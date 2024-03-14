#!/usr/bin/bash

# rpm-ostree
# ##########
# rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/silverblue-main
# rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ublue-os/silverblue-main:39
# rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ublue-os/silverblue-nvidia:39
rpm-ostree override remove firefox-langpacks firefox gnome-software-rpm-ostree
rpm-ostree install fish gparted langpacks-en langpacks-bn epson-inkjet-printer-escpr <other files>

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
flatpak install -y --user flathub org.gnome.Calculator org.gnome.Calendar org.gnome.Snapshot org.gnome.clocks org.gnome.Contacts org.gnome.Evince org.gnome.font-viewer org.gnome.Logs org.gnome.Loupe org.gnome.TextEditor org.gnome.Weather com.github.tchx84.Flatseal net.nokyan.Resources com.mattjakeman.ExtensionManager io.github.flattool.Warehouse 

# Toolbox
# toolbox create -y devbox
# toolbox run -c devbox sh -c 'echo "max_parallel_downloads=20" | sudo tee -a /etc/dnf/dnf.conf'
# toolbox run -c devbox sh -c 'sudo dnf update -y && sudo dnf install -y fish rustc cargo rust-analyzer helix'

#for Distrobox
# distrobox create -i fedora -n fedora-template
# distrobox enter fedora-template
# echo "max_parallel_downloads=20" | sudo tee -a /etc/dnf/dnf.conf
# sudo dnf update -y && sudo dnf install -y fish
# distrobox create --clone fedora-template devbox
# distrobox create --clone fedora-template shitbox

# chsh -s /usr/bin/fish
