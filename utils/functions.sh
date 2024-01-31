#!/bin/bash

# Link Configurations with Symbolic Links
link_config () {
    echo "Replacing configuration for: $2"
    local src_dir="$1"
    local dest_dir="$2"

    if [ -d "$dest_dir" ]; then
        echo "Existing configuration found at $dest_dir."
        rm $dest_dir
        echo "Creating symbolic links for $dest_dir"
        ln -s "$src_dir" "$dest_dir"
    else
        echo "Error: Repository directory $dest_dir not found"
        exit 1
    fi
}

clone_git_repo () {
    local repo_url="$1"
    local dest_dir="$2"
    echo "Cloning repository: $repo_url into $dest_dir"
    git clone "$repo_url" "$dest_dir"
}

install_dnf_packages () {
    echo "Installing DNF package: $@"
    sudo dnf install -y "$@"
}

add_repo () {
    echo "Adding repository: $1"
    sudo dnf config-manager --add-repo "$1"
}

import_gpg_key () {
    echo "Importing GPG key from: $1"
    sudo rpm --import "$1"
}

add_flatpak_repo () {
    echo "Adding Flatpak repository: $1"
    flatpak remote-add --if-not-exists "$1" "$2"
}

install_flatpak_app () {
    echo "Installing Flatpak application: $1"
    flatpak install -y flathub "$1"
}