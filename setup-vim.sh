curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .vimrc ~
cat vim.gitignore >> ~/.gitignore
git config --global core.excludesFile "~/.gitignore"
