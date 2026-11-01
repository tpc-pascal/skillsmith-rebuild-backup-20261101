#!/usr/bin/env bash
# Check or update pinned upstream SHAs in fetch-session.sh.
set -euo pipefail
cd "$(dirname "$0")/.."

FETCH=scripts/fetch-session.sh
MODE="${1:---check}"
REPORT=pins-report.md
PART=pins-report.part.md
UNREACH=unreachable.txt
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK" "$PART"' EXIT

if [[ "$MODE" != "--check" && "$MODE" != "--write" ]]; then
  echo "usage: scripts/bump-pins.sh [--check|--write]" >&2
  exit 2
fi

: >"$PART"
: >"$UNREACH"
PREFIXES=$(sed -nE 's/^([A-Z0-9]+)_URL=".*"$/\1/p' "$FETCH")

for prefix in $PREFIXES; do
  url=$(sed -n "s/^${prefix}_URL=\"\(.*\)\"$/\1/p" "$FETCH")
  pin=$(sed -n "s/^${prefix}_SHA=\"\(.*\)\"$/\1/p" "$FETCH")
  head=$(git ls-remote "$url" HEAD 2>/dev/null | cut -f1 || true)
  if [ -z "$head" ]; then
    echo "unreachable $prefix $url" >>"$UNREACH"
    continue
  fi
  if [ "$head" = "$pin" ]; then
    echo "ok        $prefix ${pin:0:7}"
    continue
  fi

  dir="$WORK/$prefix"
  if ! git clone -q --filter=blob:none --no-checkout "$url" "$dir" 2>/dev/null ||
    ! git -C "$dir" fetch -q --depth 1 origin "$head" 2>/dev/null; then
    echo "unreachable-sha $prefix ${head:0:7} $url" >>"$UNREACH"
    continue
  fi

  echo "stale     $prefix ${pin:0:7} -> ${head:0:7}"
  echo "| \`$prefix\` | \`$url\` | \`${pin:0:7}\` | \`${head:0:7}\` |" >>"$PART"
  if [ "$MODE" = "--write" ]; then
    sed -i "s/^${prefix}_SHA=\".*\"$/${prefix}_SHA=\"${head}\"/" "$FETCH"
  fi
done

if [ -s "$PART" ] && [ "$MODE" = "--write" ]; then
  echo "== post-bump smoke: fetch-session.sh --all"
  ./scripts/fetch-session.sh --all --out "$WORK/smoke" >/dev/null
fi

{
  echo "# Third-party pin bumps"
  echo
  if [ -s "$PART" ]; then
    echo "| Prefix | Repository | Old pin | New HEAD |"
    echo "|---|---|---|---|"
    cat "$PART"
  else
    echo "All pins already track upstream HEAD."
  fi
  if [ -s "$UNREACH" ]; then
    echo
    echo "### Unreachable upstreams (pins kept unchanged)"
    echo '```'
    cat "$UNREACH"
    echo '```'
  fi
} >"$REPORT"
rm -f "$PART"

lines=$(awk '/^\|/ { count += 1 } END { print count + 0 }' "$REPORT")
echo "bump-pins done (mode=$MODE): $lines table lines, $(wc -l <"$UNREACH") unreachable"
