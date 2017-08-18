ln -s $(pwd)/gitconfig $HOME/.gitconfig
ln -s $(pwd)/gitmessage $HOME/.gitmessage
ln -s $(pwd)/pinkoirc $HOME/.pinkoirc
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/vimrc $HOME/.vimrc
mkdir -p $HOME/.vim/colors
ln -s $(pwd)/vim/colors/solarized.vim $HOME/.vim/colors/solarized.vim
mkdir -p $HOME/.config/nvim/colors
ln -s ${pwd}/vim/colors/solarized.vim $HOME/.config/nvim/colors/solarized.vim
ln -s $(pwd)/init.vim $HOME/.config/nvim/init.vim
ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/tmuxinator $HOME/.tmuxinator
