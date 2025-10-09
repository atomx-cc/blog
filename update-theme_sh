#!/bin/bash

# Exit if any command fails
set -e

echo "Updating PaperMod theme submodule..."

# Update the submodule to the latest commit from the remote repository
echo "Fetching latest changes from PaperMod repository..."
git submodule update --remote themes/PaperMod

# Remove .github directory if it exists
if [ -d "themes/PaperMod/.github" ]; then
    echo "Removing .github directory..."
    rm -rf themes/PaperMod/.github
fi

echo "PaperMod theme submodule has been updated successfully!"
echo ""
echo "Next steps:"
echo "1. Test your site: hugo serve"
echo "2. If everything works, commit the changes:"
echo "   git add themes/PaperMod"
echo "   git commit -m \"Update PaperMod theme to latest version\""
echo "   git push origin main"
