set fish_greeting
set TERM screen-256color

set PATH ~/.nvm/versions/node/v16.14.0/bin $PATH
set PATH ~/.local/share/flutter/bin $PATH
set PATH ~/.cargo/bin $PATH

alias emulator "~/Android/Sdk/emulator/emulator"
alias icat "kitty +kitten icat"
alias noisetorch "~/.local/bin/noisetorch"
alias ls "exa --long --icons --tree --level=1 -a"
alias ll ls
alias python python3
alias pip pip3
alias pe "python3 -m venv venv"
alias pa ". venv/bin/activate.fish"
alias find "fd -H -I -i"
alias java_status "archlinux-java status"
alias java_set "sudo archlinux-java set"

function fish_greeting
  if not test "$TMUX" 
	neofetch
  end
end

function ide
  set DEV_AMB "on_tmux"

  if test "$TMUX"
    tmux split-window -v -p 30
    nvim
  else
    echo "You need to initialize tmux to run this command"
  end
end

function change_java
  sudo update-alternatives --config java
end

