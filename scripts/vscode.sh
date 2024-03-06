#!/bin/bash

extensions=(
    ms-python.python # Python
    ms-azuretools.vscode-docker # Docker
    donjayamanne.githistory # Git History
    GitHub.github-vscode-theme # Github Theme
    ms-vscode.live-server # Live Server
    ms-vsliveshare.vsliveshare # Live Share
    PKief.material-icon-theme # Material Icon Theme
    charliermarsh.ruff # Ruff
    dbaeumer.vscode-eslint # ESLint
    bradlc.vscode-tailwindcss # TailwindCSS
    formulahendry.code-runner # Code Runner
)

# Get a list of all currently installed extensions.
installed_extensions=$(code --list-extensions)  

for extension in "${extensions[@]}"; do
    if echo "$installed_extensions" | grep -qi "^$extension$"; then
        echo "$extension is already installed. Skipping..."
    else
        echo "Installing $extension..."
        code --install-extension "$extension"
    fi
done

# Define the target directory for VS Code user settings on linux
VSCODE_USER_SETTINGS_DIR="$HOME/.config/Code/User/"

# Check if VS Code settings directory exists
if [ -d "$VSCODE_USER_SETTINGS_DIR" ]; then
    # Backup existing settings.json, if they exist
    cp "${VSCODE_USER_SETTINGS_DIR}/settings.json" "${VSCODE_USER_SETTINGS_DIR}/settings.json.backup"

    # Copy new settings.json
    cp "config/vscode/settings.json" "${VSCODE_USER_SETTINGS_DIR}/settings.json"

    echo "VS Code settings and keybindings have been updated."
else
    echo "VS Code user settings directory does not exist. Please ensure VS Code is installed."
fi
