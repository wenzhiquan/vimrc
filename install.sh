#! /bin/sh

cd ~
mv .vim .vim_orig
mv .vimrc .vimrc_org
git clone  https://github.com/lxxdn/vimrc.git

mv vimrc/vimrc ~/.vimrc
rm -rf vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#for install airline font
git clone https://github.com/powerline/fonts.git tmpfonts
./tmpfonts/install.sh
rm -rf tmpfonts

vim -c VundleInstall
