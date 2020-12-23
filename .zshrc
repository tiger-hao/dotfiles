# oh-my-zsh setup
export ZSH="/home/tiger/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# env
export VISUAL=vim
export EDITOR="$VISUAL"

# WSL X forwarding
export DISPLAY=$(awk "/nameserver / {print $2; exit}" /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

for custom_path in "$HOME/bin" "$HOME/.local/bin" "/usr/local/go/bin"; do
    if [ -d $custom_path ]; then
        PATH="$custom_path:$PATH"
    fi
done

if [ -d "/mnt/c/Users/tiger" ] ; then
    WINDOWS="/mnt/c/Users/tiger"
fi
