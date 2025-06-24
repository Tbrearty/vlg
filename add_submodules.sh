#!/usr/bin/env bash
set -euo pipefail

# Usage: ./add_submodules.sh [repo-url submodule-path [branch]]
# Adds the specified submodule if it doesn't exist and updates all submodules.

if [[ $# -ge 2 ]]; then
    repo_url="$1"
    submodule_path="$2"
    branch="${3:-main}"

    if ! git config --get submodule."$submodule_path".url > /dev/null; then
        git submodule add -b "$branch" "$repo_url" "$submodule_path"
    fi
fi

# Initialize and update submodules

git submodule update --init --recursive

git submodule update --remote --merge
