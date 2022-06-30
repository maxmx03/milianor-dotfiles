# Neovim - configuration

# Prerequisits

- Neovim nightly

# Installation

## Linux - ubuntu

```
sudo apt-get install python3-dev python3-pip python3-pip python3-venv
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```
### Installing dependencies

```
sudo apt install npm nodejs git gcc fd-find ripgrep
sudo npm install -g neovim
python3 -m pip install pynvim
```

## MacOs

[brew](https://brew.sh/index_pt-br)
```
brew install --HEAD neovim
```

### Installing dependencies

```
brew install git node gcc fd ripgrep
npm install -g neovim
python3 -m pip install pynvim
```

## Windows

[scoop](https://scoop.sh/)
```
scoop bucket add versions
scoop install neovim-nightly
```

### Installing dependencies

```
scoop install git nodejs gcc fd ripgrep python
npm install -g neovim
python3 -m pip install pynvim
```
