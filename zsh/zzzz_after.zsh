# Load any custom after code
if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(ls -A $HOME/.zsh.after/)" ]; then
    for config_file ($HOME/.zsh.after/*.zsh) source $config_file
  fi
fi

alias tns='tmux new -s'
alias tks='tmux kill-session -t'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tkall='tmux kill-server'

# For copy/pasting across vim and tmux https://robots.thoughtbot.com/how-to-copy-and-paste-with-tmux-on-mac-os-x
#!/bin/sh

while true; do
  if test -n "`tmux showb 2> /dev/null`"; then
    tmux saveb -|pbcopy && tmux deleteb
  fi
  sleep 0.5
done
