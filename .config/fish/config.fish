set fish_greeting


set PATH ~/.local/share/nvm/v16.13.0/bin $PATH
set PATH ~/.local/share/lua-5.4.3/src $PATH


alias ls "~/.local/share/exa/bin/exa --long --icons --tree --level=1 -a"


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

starship init fish | source
