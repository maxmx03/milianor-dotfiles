set fish_greeting

set PATH ~/.nvm/versions/node/v16.13.2/bin/node $PATH

alias noisetorch "~/.local/bin/noisetorch"
alias vim nvim
alias ls "exa --long --icons --tree --level=1 -a"
alias ll ls
alias python python3
alias pe "python3 -m venv venv"
alias pa ". venv/bin/activate.fish"

function fish_greeting
  if not test "$TERM" = "screen-256color"
	neofetch
  end
end

function search
  sudo find . -name $argv	
end

function ide
  if test "$TERM" = "screen-256color"
    tmux split-window -v -p 30
    nvim
  else
    echo "You need to initialize tmux to run this command"
  end
end
