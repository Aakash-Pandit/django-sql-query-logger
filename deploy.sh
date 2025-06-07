#!/bin/bash
set -e

echo "Cleaning previous builds..."
rm -rf dist/ build/ *.egg-info/

echo "Building package..."
python -m build

# if [ ! -f ./.pypirc ]; then
#     echo "Error: ./.pypirc not found. Please create it with your API tokens."
#     echo "See: https://packaging.python.org/en/latest/specifications/pypirc/"
#     exit 1
# fi

# echo "Uploading to Test PyPI..."
# python -m twine upload --repository testpypi dist/* --verbose

# echo "Package uploaded to Test PyPI!"
# echo "Test installation with:"
# echo "pip install --index-url https://test.pypi.org/simple/ django-sql-query-logger"

read -p "Upload to real PyPI? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Uploading to PyPI..."
    python -m twine upload dist/*
    echo "Package uploaded to PyPI!"
fi
