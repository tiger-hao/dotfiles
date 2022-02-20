cp .vimrc .zshrc .tmux.conf ~
cp coc-settings.json ~/.vim/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cat .gitconfig >> ~/.gitconfig
for f in vim.gitignore latex.gitignore; do cat $f; echo; done >> ~/.gitignore

exec $SHELL
