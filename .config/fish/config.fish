set fish_greeting

set PATH ~/.nvm/versions/node/v16.13.2/bin $PATH
set PATH ~/.local/share/gem/ruby/2.7.0/bin $PATH
set TERM screen-256color
set PATH ~/.local/bin/noisetorch $PATH

alias open xdg-open
alias nvim "~/.local/nvim/nvim.appimage"
alias find "fdfind --hidden"
alias noisetorch "~/.local/bin/noisetorch"
alias ls "exa --long --icons --tree --level=1 -a"
alias ll ls
alias python python3
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

starship init fish | source
