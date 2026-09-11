#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CASK_PATH="$REPO_ROOT/Casks/kipless.rb"
TAG=""

if [[ $# -gt 1 ]]; then
  echo "Usage: $0 [vX.Y.Z]" >&2
  exit 2
fi

if [[ $# -eq 1 ]]; then
  TAG="${1#v}"
  TAG="v$TAG"
  RELEASE_JSON="$(gh api "repos/ShiinaLabs/Kipless/releases/tags/$TAG")"
else
  RELEASE_JSON="$(gh api repos/ShiinaLabs/Kipless/releases/latest)"
fi

if ! printf '%s' "$RELEASE_JSON" | jq -e '(.draft == false) and (.prerelease == false)' >/dev/null; then
  echo "Release must be published and stable." >&2
  exit 1
fi

RELEASE_TAG="$(printf '%s' "$RELEASE_JSON" | jq -r '.tag_name')"
if [[ ! "$RELEASE_TAG" =~ ^v[0-9]+[.][0-9]+[.][0-9]+$ ]]; then
  echo "Release tag is not a stable SemVer tag: $RELEASE_TAG" >&2
  exit 1
fi

RELEASE_VERSION="${RELEASE_TAG#v}"
ASSET_URL="$(printf '%s' "$RELEASE_JSON" | jq -r '[.assets[] | select(.name == "Kipless.dmg") | .browser_download_url][0] // empty')"
if [[ -z "$ASSET_URL" ]]; then
  echo "Kipless.dmg is missing from release $RELEASE_TAG." >&2
  exit 1
fi

TEMP_DIR="$(mktemp -d /tmp/kipless-cask.XXXXXX)"
trap 'rm -rf -- "$TEMP_DIR"' EXIT
DMG_PATH="$TEMP_DIR/Kipless.dmg"

curl --fail --location --retry 3 "$ASSET_URL" -o "$DMG_PATH"
DMG_SHA256="$(shasum -a 256 "$DMG_PATH" | awk '{print $1}')"

python3 - "$CASK_PATH" "$RELEASE_VERSION" "$DMG_SHA256" <<'PY'
import re
import sys
from pathlib import Path

cask_path = Path(sys.argv[1])
version = sys.argv[2]
sha256 = sys.argv[3]
text = cask_path.read_text(encoding="utf-8")
text, version_count = re.subn(
    r'(?m)^  version "[^"]+"$',
    f'  version "{version}"',
    text,
)
text, checksum_count = re.subn(
    r'(?m)^  sha256 "[^"]+"$',
    f'  sha256 "{sha256}"',
    text,
)
if version_count != 1 or checksum_count != 1:
    raise SystemExit("Cask must contain exactly one version and one sha256 stanza")
cask_path.write_text(text, encoding="utf-8")
PY

if brew tap | grep -Fxq 'shiinalabs/apps'; then
  (cd "$REPO_ROOT" && brew style --cask ShiinaLabs/apps/kipless)
else
  echo "Skipping Homebrew style check: tap ShiinaLabs/apps is not installed locally." >&2
fi
echo "Kipless Cask updated to $RELEASE_VERSION ($DMG_SHA256)."
