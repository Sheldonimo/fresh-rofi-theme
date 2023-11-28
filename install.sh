#!/usr/bin/env bash
# Defining variables
root=/home/$USER

# Downloading Nord theme for Rofi

if [ ! -d "./theme" ]; then
    echo "Please download the repository first"
    exit 1
fi

# Installing Rofi

# Comment: The script starts with the intention of installing Rofi.

# Check if Rofi is installed
if command -v rofi >/dev/null 2>&1; then
    # If Rofi is already installed, inform the user and do not perform any additional action.
    echo "Rofi is already installed."
else
    # If Rofi is not installed, start the installation process.
    echo "Installing Rofi..."

    # Checks which package manager is available to install Rofi.
    # Check for the presence of apt-get (typical on Debian/Ubuntu).
    if command -v apt-get >/dev/null 2>&1; then
        echo "Updating packages with apt-get..."
        sudo apt-get update  # Updates the package list using apt-get.
        echo "Installing Rofi with apt-get..."
        sudo apt-get install -y rofi  # Installs Rofi using apt-get.

    # Then checks for the presence of pacman (typical on Arch Linux and derivatives).
    elif command -v pacman >/dev/null 2>&1; then
        echo "Updating packages with pacman..."
        sudo pacman -Sy  # Synchronizes and updates the package list using pacman.
        echo "Installing Rofi with pacman..."
        sudo pacman -S rofi  # Installs Rofi using pacman.

    # Finally, checks for the presence of dnf (typical on Fedora).
    elif command -v dnf >/dev/null 2>&1; then
        echo "Updating packages with dnf..."
        sudo dnf check-update  # Checks for available updates with dnf.
        echo "Installing Rofi with dnf..."
        sudo dnf install rofi  # Installs Rofi using dnf.

    else
        # If no known package manager is found, informs the user and ends the script.
        echo "No compatible package manager found."
        exit 1
    fi
fi

## Moving the new Rofi theme

[ ! -d "$root/.config/rofi/themes" ] && mkdir -p "$root/.config/rofi/themes"
if [ ! -f $root/.config/rofi/themes/fresh.rasi ]; then
    echo "Moving the Rofi theme to $root/.config/rofi/themes"
    cp ./theme/fresh.rasi $root/.config/rofi/themes/fresh.rasi
    sudo mv ./theme/fresh.rasi /usr/share/rofi/themes/fresh.rasi
    if [ "$(lsb_release -is)" = "Linuxmint" ]; then
        cp ./theme/config.rasi $root/.config/rofi/config.rasi
    else
        rofi-theme-selector
    fi
fi

echo "Finished install fresh theme for Rofi."