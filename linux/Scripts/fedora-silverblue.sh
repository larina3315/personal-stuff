#!/usr/bin/bash

# Delete Flatpak repos
flatpak remove --all
flatpak remote-delete fedora
flatpak remote-delete fedora-testing

# Add Flatpak repos
flatpak remote-add --if-not-exists --system flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub-beta https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo

# Basic Apps
flatpak install -y --system flathub org.mozilla.firefox org.mozilla.Thunderbird org.libreoffice.LibreOffice org.localsend.localsend_app

#GNOME Apps
flatpak install -y --user flathub org.gnome.Calculator org.gnome.Calendar org.gnome.Snapshot org.gnome.clocks org.gnome.Contacts org.gnome.Evince org.gnome.font-viewer org.gnome.Logs org.gnome.Loupe org.gnome.TextEditor org.gnome.Weather com.github.tchx84.Flatseal net.nokyan.Resources com.mattjakeman.ExtensionManager

# Toolbox
toolbox create -y devbox
toolbox run -c devbox sh -c 'echo "max_parallel_downloads=20" | sudo tee -a /etc/dnf/dnf.conf'
toolbox run -c devbox sh -c 'sudo dnf update -y && sudo dnf install -y fish rustc cargo rust-analyzer helix'

# rpm-ostree
rpm-ostree cancel && rpm-ostree upgrade && rpm-ostree override remove firefox-langpacks firefox
rpm-ostree install fish langpacks-en langpacks-bn epson-inkjet-printer-escpr
