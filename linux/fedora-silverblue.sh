#!/usr/bin/bash

#Setting up Flatpak
flatpak remove --all
flatpak remote-delete fedora
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Basic Apps
flatpak install --user org.mozilla.firefox org.mozilla.Thunderbird org.libreoffice.LibreOffice

#GNOME Apps
flatpak install --user org.gnome.Calculator org.gnome.Calendar org.gnome.Snapshot org.gnome.clocks \
 org.gnome.Contacts org.gnome.Evince org.gnome.FontManager org.gnome.font-viewer \
 org.gnome.Logs org.gnome.TextEditor org.gnome.Weather
