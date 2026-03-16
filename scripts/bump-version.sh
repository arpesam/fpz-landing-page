#!/bin/sh
# Bumps the patch version in version.txt and injects it into index.html

VERSION_FILE="version.txt"
INDEX_FILE="index.html"

current=$(cat "$VERSION_FILE" | tr -d '[:space:]')

major=$(echo "$current" | cut -d. -f1)
minor=$(echo "$current" | cut -d. -f2)
patch=$(echo "$current" | cut -d. -f3)

patch=$((patch + 1))
next="${major}.${minor}.${patch}"

echo "$next" > "$VERSION_FILE"

# Replace the version badge content in index.html
sed -i '' "s|<p class=\"version-badge\">v[0-9]*\.[0-9]*\.[0-9]*</p>|<p class=\"version-badge\">v${next}</p>|" "$INDEX_FILE"

git add "$VERSION_FILE" "$INDEX_FILE"

echo "Version bumped: $current → $next"
