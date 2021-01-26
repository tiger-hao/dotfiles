cp .vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cat vim.gitignore >> ~/.gitignore
git config --global core.excludesFile "~/.gitignore"

git clone git://github.com/altercation/vim-colors-solarized.git
mkdir -p ~/.vim/colors && cp vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
rm -rf vim-colors-solarized

git clone https://github.com/seebi/tmux-colors-solarized.git
cat tmux-colors-solarized/tmuxcolors-256.conf >> ~/.tmux.conf
rm -rf tmux-colors-solarized

exec $SHELL
