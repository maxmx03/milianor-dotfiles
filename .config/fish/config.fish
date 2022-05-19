set fish_greeting
set TERM xterm-256color

set PATH ~/.nvm/versions/node/v16.15.0/bin $PATH
set PATH ~/.local/share/flutter/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/.local/share/spring-2.6.4/bin $PATH
set PATH ~/Android/Sdk/platform-tools $PATH
set PATH ~/Android/Sdk/cmdline-tools/latest/bin $PATH

alias glow "~/.local/share/glow/glow"
alias emulator "~/Android/Sdk/emulator/emulator"
alias ls "exa --long --icons --tree --level=1 -a"
alias ll ls
alias python python3
alias pip pip3
alias pe "python3 -m venv venv"
alias pa ". venv/bin/activate.fish"
alias find "fdfind -H -I -i"
alias fd "fdfind"
alias java_set "sudo update-alternatives --config java"

function fish_greeting
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

