# Neovim config by Milianor

## Requeriments
- [neovim](https://neovim.io/)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [node](https://nodejs.org/en/)
- [wsl](https://docs.microsoft.com/pt-br/windows/wsl/install)

## Python and Lua is installed by default on Linux distros
- verify if is already installed

```bash
python3 -v
lua -v
```
- if not installed

Ubuntu
```bash
sudo apt install python3 python3-pip lua
```
fedora
```bash
sudo dnf install python3
sudo dnf install lua
```

archlinux
```bash
sudo pacman -S python3 lua
```

*if anything goes wrong read your distro documentation*

## How to install neovim

1. update (linux)

ubuntu
```bash
sudo apt update
sudo apt upgrade
````

fedora
```
sudo dnf upgrade
```

archlinux
```
pacman -Syu
```

2. Neovim

ubuntu
```bash
sudo apt install neovim gcc python3-neovim
```

fedora
```bash
sudo dnf copr enable agriffis/neovim-nightly gcc
sudo dnf install -y neovim python3-neovim
```

archlinux
```bash
sudo pacman -S neovim gcc
sudo pacman -S python-pynvim
```

For Other distros [download](https://github.com/neovim/neovim/releases/nightly) nvim.appimage

3. Node version manager [here](https://github.com/nvm-sh/nvm)

```bash
nvm install lts
```

4. Install all dependencies

```bash
npm i -g neovim pyright typescript typescript-language-server vscode-langservers-extracted intelephense vls
```

```bash
npm i -g prettier blade-formatter
````

```bash
pip install pynvim autopep8
```

5. Install [sumneko](https://github.com/sumneko/lua-language-server) for lua
- follow the instrutions [here](https://github.com/sumneko/lua-language-server/wiki/Build-and-Run)

6. Clone this repository and place the nvim-linux config inside nvim

```bash
cd ~
mkdir .config/nvim
cd .config/nvim
git clone 'https://github.com/maxmx03/dotfiles'
cd dotfiles/.config/nvim-linux
cp -r * ~/.config/nvim
```

7. Open nvim
```bash
nvim
```
8. Inside neovim
:PlugInstall
