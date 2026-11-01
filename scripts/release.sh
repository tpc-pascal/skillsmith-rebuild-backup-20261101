#!/usr/bin/env bash
# Create an immutable project version tag; CI publishes its changelog notes.
set -euo pipefail
cd "$(dirname "$0")/.."

version="${1:-}"
if [[ ! "$version" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "usage: scripts/release.sh vX.Y.Z" >&2
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "dirty working tree — commit before cutting a version" >&2
  exit 1
fi

branch="$(git symbolic-ref --quiet --short HEAD)" || {
  echo "detached HEAD — switch to main before cutting a version" >&2
  exit 1
}
upstream="$(git rev-parse --abbrev-ref --symbolic-full-name '@{upstream}')" || {
  echo "main has no upstream — configure its GitHub tracking branch first" >&2
  exit 1
}
remote="${upstream%%/*}"
upstream_branch="${upstream#*/}"

if [[ "$branch" != "main" || "$upstream_branch" != "main" ]]; then
  echo "must be on main tracking a remote main branch" >&2
  exit 1
fi

git fetch --quiet "$remote" main
if [[ "$(git rev-parse HEAD)" != "$(git rev-parse "$remote/main")" ]]; then
  echo "HEAD does not match $remote/main — push first" >&2
  exit 1
fi

if ! grep -Fqx "## [$version]" CHANGELOG.md; then
  echo "CHANGELOG.md has no ## [$version] section — move the [Unreleased] entries first" >&2
  exit 1
fi

if git rev-parse -q --verify "refs/tags/$version" >/dev/null 2>&1; then
  echo "tag $version already exists locally — versions are immutable" >&2
  exit 1
fi
if git ls-remote --exit-code --tags "$remote" "refs/tags/$version" >/dev/null 2>&1; then
  echo "tag $version already exists on $remote — versions are immutable" >&2
  exit 1
fi

git tag -a "$version" -m "skillsmith $version"
git push "$remote" "refs/tags/$version"
echo "ok: $version -> $(git rev-parse --short HEAD) — CI will publish the release from CHANGELOG"
