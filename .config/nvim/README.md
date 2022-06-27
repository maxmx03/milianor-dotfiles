# Minimalist neovim config

# [Inspired by](https://github.com/craftzdog/dotfiles-public)

# Quick Start

```bash
git clone https://github.com/maxmx03/devaslife-ide.git ~/.config/nvim
nvim
```

# Installation

# Before you start

You must install one [nerd font](https://www.nerdfonts.com/font-downloads), my recommentation are:
Hack Nerd Font, Fire Code Nerd Font, Sauce Code Pro Nerd Font, VictorMono Nerd Font, you just need to pick one to install.

# Linux

## Install Neovim

from source: [neovim nightly](https://github.com/neovim/neovim/releases/nightly)

with package manager - fedora
```
sudo dnf copr enable agriffis/neovim-nightly
sudo dnf install -y neovim python3-neovim

```

with package manager - ubuntu
```
sudo apt-get install python3-dev python3-pip python3-pip python3-venv
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```
## Install dependencies

```
sudo apt install npm nodejs git gcc fd-find ripgrep
sudo npm install -g neovim
python3 -m pip install pynvim
```

# MacOs

## Install Neovim

from source: [neovim nightly](https://github.com/neovim/neovim/releases/nightly)

with package manager

[brew](https://brew.sh/index_pt-br)
```
brew install --HEAD neovim
```

## Install dependencies

```
brew install git node gcc fd ripgrep
npm install -g neovim
python3 -m pip install pynvim
```

# Windows

## Install Neovim

from source: [neovim nightly](https://github.com/neovim/neovim/releases/nightly)

with package manager

[scoop](https://scoop.sh/)
```
scoop bucket add versions
scoop install neovim-nightly
```

## Install dependencies

```
scoop install git nodejs gcc fd ripgrep python
npm install -g neovim
python3 -m pip install pynvim
```
