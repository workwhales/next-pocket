#!/usr/bin/env bash

# This script will look for any folder and file with the name "next-pocket" and replace it with the name of your project

# get the name of the project
echo "What is the name of your project?"
read -r project_name


# Find every folder with the name "next-pocket" and replace it with the name of your project
find . -type d -name "next-pocket" -exec sh -c 'mv "$1" "${1/next-pocket/$2}"' _ {} $project_name \;

# go throug every file content and replace "next-pocket" with the name of your project
grep -rl next-pocket . | xargs sed -i '' "s/next-pocket/$project_name/g"

echo "Done!"

echo "============================="
echo "Next steps:"
echo "1. direct to your project root folder"
echo "2. docker-compose up -d --build"
echo "3. change/expand the readme.md file"
echo "4. change the name in the manifest.json and _app.tsx file"
echo "============================="
