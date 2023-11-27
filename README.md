<div align="center" class="tip" markdown="1" style>

![GitHub stars](https://img.shields.io/github/stars/Sheldonimo/fresh-rofi-theme) ![rep size](https://img.shields.io/github/repo-size/Sheldonimo/fresh-rofi-theme) ![Tested on Linux Mint](https://img.shields.io/badge/Tested%20on-linux_mint-brightgreen)

</div>

# Fresh Theme for Rofi Launcher
Enhance your Rofi experience with the Fresh theme! This bash script makes it easy to install a sleek, modern theme for the Rofi launcher.

### :rocket: Fresh theme
<div align="center" class="tip" markdown="1" style>

![Fresh theme](images/fresh-theme.png)

</div>

## :computer: Installation

To install the Fresh theme, simply clone the repository and run the installation script:
```bash
git clone https://github.com/Sheldonimo/fresh-rofi-theme.git
cd fresh-rofi-theme
chmod +x install.sh
./install.sh
```

## :zap: Using the Fresh Theme

After installing the Fresh theme for Rofi, enhance your experience with this simple command:

```bash
rofi -show-icons -modi drun -show drun
```

**Note:** For quick access, consider assigning this command to a keyboard shortcut in your system settings. This enables you to enjoy the Fresh theme's sleek interface with just a key press, making application launching faster and more convenient.

## Optional: Don't Have Rofi Yet? Install It!

If you prefer to manually install Rofi, use the following commands depending on your distribution:

- On Debian / Ubuntu: `apt-get install rofi`
- On Arch / Arch-based: `pacman -S rofi`
- On Fedora: `dnf install rofi`

**Note:** These manual steps are optional if you're using our installation script. The script automatically checks if Rofi is installed and, if not, proceeds with the appropriate installation for your system.

> Want to learn more about setting up Rofi, including keyboard shortcuts? Find additional information [here](https://github.com/davatorium/rofi).


## What is Rofi?

Rofi is a versatile and efficient tool that functions as a window switcher, application launcher, and a replacement for dmenu. Initially developed as a clone of simpleswitcher, Rofi has evolved to include additional features like an application launcher and ssh-launcher. It offers a user-friendly textual list interface for various actions, such as running applications, selecting windows, or executing options from external scripts. Rofi's functionality makes it a valuable tool for streamlining user interactions on a computer. More information about Rofi and its capabilities can be found on its [GitHub page](https://github.com/davatorium/rofi).
