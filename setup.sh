cp .vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cat vim.gitignore >> ~/.gitignore
git config --global core.excludesFile "~/.gitignore"

echo 'set -g default-terminal "tmux-256color"' >> ~/.tmux.conf
echo 'set -ga terminal-overrides ",*256col*:Tc"' >> ~/.tmux.conf

exec $SHELL
