#!/bin/bash
set -e

echo "Cleaning previous builds..."
rm -rf dist/ build/ *.egg-info/

echo "Building package..."
python -m build

read -p "Upload to real PyPI? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Uploading to PyPI..."
    python -m twine upload dist/*
    echo "Package uploaded to PyPI!"
fi
