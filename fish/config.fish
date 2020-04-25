# don't store sensitive credentials here!
# place them in $HOME/data/credentials

export XDG_CONFIG_HOME=$HOME/dotfiles
export XDG_DATA_HOME=$HOME/data

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

chruby 2.6

export CHEF_ORG=nielsensocial
export HUSKY_SKIP_INSTALL=1
export HUSKY_SKIP_HOOKS=1

export SAM_CLI_TELEMETRY=0

set -g fish_user_paths "/usr/local/opt/node@10/bin" $fish_user_paths

source $HOME/data/credentials

