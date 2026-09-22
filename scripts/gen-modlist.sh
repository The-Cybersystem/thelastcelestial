#!/usr/bin/env bash
# gen-modlist.sh — regenerate src/data/modlist.json from the live server pack.
# Publishes ONLY the client-relevant mods; server-only / administrative mods
# (BlueMap, integrity, vanish, ghost, spark, booster…) are excluded so the
# public site never reveals admin tooling.
#
# Patterns in scripts/.local-excludes (gitignored) are additionally withheld
# from the published list without being named in this repository.
#
# Run after any pack change and commit the result:
#   scripts/gen-modlist.sh            (uses /srv/the-last-celestial/mods)
#   SERVER_MODS_DIR=/path ./scripts/gen-modlist.sh
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
SRC_DIR="${SERVER_MODS_DIR:-/srv/the-last-celestial/mods}"
OUT="$REPO/src/data/modlist.json"
PRIVATE_EXCLUDES="$REPO/scripts/.local-excludes"

# Basenames (case-insensitive glob) of server-only / administrative mods that
# must never be published. Add new admin tooling here.
EXCLUDE=(
  'bluemap-*.jar'
  'integrityserver-*.jar'
  'ghostmod-*.jar'
  'Vanishmod-*.jar'
  'vanishtracker-*.jar'
  'boosterperks-*.jar'
  'spark-*.jar'
)

# Extra patterns kept out of version control (see .gitignore). Not recorded in
# the published JSON and never named here.
PRIVATE=()
if [[ -f "$PRIVATE_EXCLUDES" ]]; then
  while IFS= read -r line || [[ -n "$line" ]]; do
    line="${line%%#*}"
    line="${line//[[:space:]]/}"
    [[ -n "$line" ]] && PRIVATE+=("$line")
  done < "$PRIVATE_EXCLUDES"
fi

[[ -d "$SRC_DIR" ]] || { echo "mods dir not found: $SRC_DIR (set SERVER_MODS_DIR)"; exit 1; }

mkdir -p "$(dirname "$OUT")"

cd "$SRC_DIR"
files=()
excluded=()
shopt -s nocasematch
for f in *.jar; do
  [[ -e "$f" ]] || continue
  skip=0
  for pat in "${EXCLUDE[@]}"; do
    if [[ "$f" == $pat ]]; then  # unquoted rhs => glob match (case-insensitive)
      excluded+=("$f")
      skip=1
      break
    fi
  done
  if [[ $skip -eq 0 ]]; then
    for pat in "${PRIVATE[@]}"; do
      if [[ "$f" == $pat ]]; then
        skip=1
        break
      fi
    done
  fi
  [[ $skip -eq 0 ]] && files+=("$f")
done
shopt -u nocasematch

printf '%s\n' "${files[@]}" | sort -u > "$REPO/.modlist.tmp"
mapfile -t sorted < "$REPO/.modlist.tmp"
rm -f "$REPO/.modlist.tmp"

jq -n \
  --arg generatedAt "$(date -u +%Y-%m-%d)" \
  --argjson files "$(printf '%s\n' "${sorted[@]}" | jq -R -s 'split("\n") | map(select(. != ""))')" \
  --argjson excluded "$(printf '%s\n' "${excluded[@]:-}" | sort -u | jq -R -s 'split("\n") | map(select(. != ""))')" \
  '{ generatedAt: $generatedAt, count: ($files|length), files: $files, excluded: $excluded }' \
  > "$OUT"

echo "wrote $OUT ($(jq -r .count "$OUT") client mods published, $(jq -r '.excluded|length' "$OUT") server-only excluded)"

[[ -f "$PRIVATE_EXCLUDES" ]] && echo "applied $(grep -vcE '^[[:space:]]*(#|$)' "$PRIVATE_EXCLUDES" || true) private exclude pattern(s) (not recorded)"