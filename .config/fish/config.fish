set fish_greeting

set PATH ~/.nvm/versions/node/v16.14.0/bin $PATH
set PATH ~/.local/share/gem/ruby/2.7.0/bin $PATH
set TERM screen-256color
set PATH ~/.local/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/Android/Sdk/tools/bin $PATH
set PATH ~/Android/Sdk/platform-tools/ $PATH

# alias emulator "~/Android/Sdk/emulator/emulator"
alias noisetorch "~/.local/bin/noisetorch"
alias ls "exa --long --icons --tree --level=1 -a"
alias ll ls
alias python python3
alias pip pip3
alias pe "python3 -m venv venv"
alias pa ". venv/bin/activate.fish"

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

starship init fish | source
