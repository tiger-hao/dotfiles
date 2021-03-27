# oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(
  docker
  docker-compose
  git
  ruby
  tmux
  yarn
)

source $ZSH/oh-my-zsh.sh

# alias
alias ghist="git log --follow -p --stat --"

# env
export VISUAL=vim
export EDITOR="$VISUAL"

# WSL X forwarding
export DISPLAY=$(awk "/nameserver / {print $2; exit}" /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

# WSL specific
export LS_COLORS="$LS_COLORS:ow=1;34"
echo -e "\e[2 q"

for custom_path in "$HOME/bin" "$HOME/.local/bin" "/usr/local/go/bin"; do
    if [ -d $custom_path ]; then
        PATH="$custom_path:$PATH"
    fi
done

if [ -d "/mnt/c/Users/tiger" ] ; then
    WINDOWS="/mnt/c/Users/tiger"
fi
