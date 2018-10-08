# Load any custom after code
if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(ls -A $HOME/.zsh.after/)" ]; then
    for config_file ($HOME/.zsh.after/*.zsh) source $config_file
  fi
fi

# tmux aliases
alias tns='tmux new -s'
alias tks='tmux kill-session -t'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tkall='tmux kill-server'

# For copy/pasting across vim and tmux https://robots.thoughtbot.com/how-to-copy-and-paste-with-tmux-on-mac-os-x

while true; do
  if test -n "`tmux showb 2> /dev/null`"; then
    tmux saveb -|pbcopy && tmux deleteb
  fi
  sleep 0.5
done

# Additional git shortcuts
alias gru='git remote update'
alias gitl='git log -10'
alias gl='git log -10'

# Rails
alias dbm='rake db:migrate'
alias dbrb='rake db:rollback'
alias dbd='rake db:drop'
alias dbc='rake db:create'
