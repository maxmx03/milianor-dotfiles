# Neovim config by Milianor

## requeriments
- [neovim](https://neovim.io/)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [node](https://nodejs.org/en/)
- [python](https://www.python.org/downloads/)
- [powershell](https://docs.microsoft.com/pt-br/powershell/scripting/overview?view=powershell-7.2)

## how to install neovim

1. install [scoop](https://scoop.sh/) 

```powershell
iwr -useb get.scoop.sh | iex

````

2. install neovim/mingw/nvm

```powershell
scoop install neovim mingw nvm
```

3. install node.js

```powershell
nvm install lts
```

5. install [python](https://www.python.org/downloads/)

4. install all dependencies

```powershell
npm i -g neovim pyright typescript tsserver vscode-langservers-extracted intelephense vls
```

````powershell
npm i -g prettier blade-formatter
````

```powershell
pip install pynvim autopep8

```

5. install [sumneko](https://github.com/sumneko/lua-language-server) for lua

- follow the instrutions [here](https://github.com/sumneko/lua-language-server/wiki/Build-and-Run)

