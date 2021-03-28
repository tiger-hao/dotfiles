cp .vimrc .zshrc .tmux.conf ~
cp coc-settings.json ~/.vim/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cat vim.gitignore >> ~/.gitignore
cat .gitconfig >> ~/.gitconfig
