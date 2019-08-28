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
# The loop was commented out because it was always returning true

# while true; do
if test -n "`tmux showb 2> /dev/null`"; then
  tmux saveb -|pbcopy && tmux deleteb
fi
sleep 0.5
# done

# Additional git shortcuts
alias gru='git remote update'
alias gitl='git log -10'
alias gl='git log -10'

# Rails
alias dbm='rake db:migrate'
alias dbrb='rake db:rollback'
alias dbd='rake db:drop'
alias dbc='rake db:create'

# Platform specific

# To reset the database copletely then seed:
db_setup() {
  rails db:reset &&
    RAILS_ENV=test rails epernicus:rebuild_views &&
    rails volumize:all &&
    rails tn:keycloak_client:sync_keycloak_clients &&
    rails tn:keycloak_user:sync_keycloak_users PASSWORD=Test12345\! FORCE_SYNC=ENABLE
  }

# Additional bash

follow() {
    tail -f log/development.log | grep -i "$@"
} # Use this to search for something specific. eg: follow ERROR

# DrugDev specific Docker containers

alias dstop='docker stop `docker ps -q`'
alias dset='ansible-playbook -vvv --tags "clean_docker, start_infrastructure, init_platform, start_platform, start_selenium" setup.yml'
alias diset='ansible-playbook -vvv --tags "setup-docker" --skip-tags "never" setup.yml'

# Stop all current containers and remove all images. This will ensure a clean slate as you transition to the new setup.

dpurge() {
    docker stop `docker ps -q` &&
    docker system prune -a
}
