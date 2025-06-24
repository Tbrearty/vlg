#!/usr/bin/env bash
set -euo pipefail

# Downloads Godot binaries and places them in the tools/ directory.
# Usage: ./install_godot.sh [version]

version="${1:-4.2.1}"
platform="linux.x86_64"

base_url="https://downloads.tuxfamily.org/godotengine/${version}"
file="Godot_v${version}-stable_${platform}.zip"
url="${base_url}/${file}"

target_dir="$(dirname "$0")/tools"
mkdir -p "$target_dir"

tmp_zip=$(mktemp)

echo "Downloading Godot ${version} from ${url}..."
curl -L "$url" -o "$tmp_zip"

echo "Extracting to $target_dir..."
unzip -o "$tmp_zip" -d "$target_dir"

rm "$tmp_zip"

echo "Godot installed in $target_dir"
