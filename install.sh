#!/usr/bin/env bash

# Definiendo variables
root=/home/$USER

# Descargando thema nord para rofi

if [ ! -d "./theme" ]; then
    echo "Please download the repository first"
    exit 1
fi

# Instalando rofi

# Comentario: El script inicia con la intención de instalar Rofi.

# Verificar si Rofi está instalado
if command -v rofi >/dev/null 2>&1; then
    # Si Rofi ya está instalado, informa al usuario y no realiza ninguna acción adicional.
    echo "Rofi ya está instalado."
else
    # Si Rofi no está instalado, inicia el proceso de instalación.
    echo "Instalando Rofi..."

    # Verifica qué administrador de paquetes está disponible para instalar Rofi.
    # Verifica la presencia de apt-get (típico en Debian/Ubuntu).
    if command -v apt-get >/dev/null 2>&1; then
        echo "Actualizando paquetes con apt-get..."
        sudo apt-get update  # Actualiza la lista de paquetes usando apt-get.
        echo "Instalando Rofi con apt-get..."
        sudo apt-get install -y rofi  # Instala Rofi utilizando apt-get.

    # Luego verifica la presencia de pacman (típico en Arch Linux y derivados).
    elif command -v pacman >/dev/null 2>&1; then
        echo "Actualizando paquetes con pacman..."
        sudo pacman -Sy  # Sincroniza y actualiza la lista de paquetes usando pacman.
        echo "Instalando Rofi con pacman..."
        sudo pacman -S rofi  # Instala Rofi utilizando pacman.

    # Finalmente, verifica la presencia de dnf (típico en Fedora).
    elif command -v dnf >/dev/null 2>&1; then
        echo "Actualizando paquetes con dnf..."
        sudo dnf check-update  # Comprueba si hay actualizaciones disponibles con dnf.
        echo "Instalando Rofi con dnf..."
        sudo dnf install rofi  # Instala Rofi utilizando dnf.

    else
        # Si no se encuentra ningún administrador de paquetes conocido, informa al usuario y termina el script.
        echo "No se encontró un administrador de paquetes compatible."
        exit 1
    fi
fi

## Moviendo el nuevo rofi theme

echo "Moviendo el rofi theme a $root/.config/rofi/themes"

[ ! -d "$root/.config/rofi/themes" ] && mkdir -p "$root/.config/rofi/themes"
if [ ! -f $root/.config/rofi/themes/fresh.rasi ]; then
    cp ./theme/fresh.rasi $root/.config/rofi/themes/fresh.rasi
    sudo mv ./theme/fresh.rasi /usr/share/rofi/themes/fresh.rasi
    if [ "$(lsb_release -is)" = "Linuxmint" ]; then
        cp ./theme/config.rasi $root/.config/rofi/config.rasi
    else
        rofi-theme-selector
    fi
fi
