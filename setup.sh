cp .vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cat vim.gitignore >> ~/.gitignore
git config --global core.excludesFile "~/.gitignore"

exec $SHELL
