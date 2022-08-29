#!/usr/bin/bash
mkdir -pv ~/{.config, dls, docs, pix, tmp, vid, proj}
sudo apt update && sudo apt upgrade -y
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim curl build-essential cmake gcc python3 clang snapd ripgrep zsh wget make alacritty tmux neofetch \
	rsync python3-pip mpv bat gimp inkscape bottom golang-go
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest
curl https://raw.githubusercontent.com/thameera/vimv/master/vimv > ~/bin/vimv && chmod +755 ~/bin/vimv
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo snap install bitwarden spotify mailspring teams
git clone https://github.com/BlankTiger/dotfiles.git
cd dotfiles
