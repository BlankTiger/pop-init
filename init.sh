#!/usr/bin/bash
mkdir -pv ~/{.config, dls, docs, pix, tmp, vid, proj}
sudo apt update && sudo apt upgrade -y
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install neovim curl build-essential cmake gcc \
	python3 clang snapd ripgrep zsh wget make alacritty tmux \
	neofetch rsync python3-pip mpv bat gimp inkscape bottom \
	golang-go gnome-tweaks exa dotenv docker.io automake pipx \
	libc6-dev lxc-dev libxcb-shape0-dev pkg-config \
	libasound2-dev libssl-dev libfreetype6-dev libexpat1-dev \
	libxcb-composite0-dev gcc-arm-linux-gnueabihf \
	libc6-armhf-cross libc6-dev-armhf-cross vim \

pipx install ipython
pipx install ensurepath
pipx install black
pipx install completions
pip install ueberzug

# lf
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

# vimv file renamer
curl https://raw.githubusercontent.com/thameera/vimv/master/vimv > ~/bin/vimv && chmod +755 ~/bin/vimv

# snaps
sudo snap install bitwarden spotify mailspring teams insomnia


chsh $USER -s /usr/bin/zsh
source ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
p10k configure

# dotfiles
git clone https://github.com/BlankTiger/dotfiles.git
cp -rv dotfiles/.* ~/

# rust and cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup component add rust-src
cargo install silicon
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

# file searcher
cargo install skim

# neovide
sudo apt install -y curl \
    gnupg ca-certificates git \
    gcc-multilib g++-multilib cmake libssl-dev pkg-config \
    libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
    libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev
cargo install --git https://github.com/neovide/neovide

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install mutter-rounded
git clone https://github.com/yilozt/mutter-rounded
cd ./mutter-rounded/ubuntu
./package.sh

sudo dpkg -i libmutter-10-0*.deb mutter-common*.deb
sudo apt-mark hold mutter mutter-common libmutter-10-0:amd64
