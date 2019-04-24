#!/bin/bash

echo "Copying git config"
cp .gitconfig ~/.gitconfig

echo "Installing ZSH"
sudo pacman -S zsh

echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Copying ZSH configs"
cp .zshrc ~/.zshrc
cp .zsh_secrets ~/.zsh_secrets

echo "Installing bat"
sudo pacman -S bat

echo "Installing Oh My Vim"
curl -L https://raw.github.com/liangxianzhe/oh-my-vim/master/tools/install.sh | sh

echo "Copying Vim configs"
cp .after.vimrc ~/.after.vimrc

mkdir -p ~/.vim/colors/
mkdir -p ~/.vim/autoload/airline/themes/

cp .vim/autoload/onedark.vim ~/.vim/autoload/onedark.vim
wget -O ~/.vim/colors/onedark.vim https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
wget -O ~/.vim/autoload/airline/themes/onedark.vim https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/airline/themes/onedark.vim

echo "Installing VSCode"
yay -S visual-studio-code-bin

echo "Installing VSCode Extensions"
code --install-extension dbaeumer.vscode-eslint
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension ducksoupdev.Vue2
code --install-extension felixfbecker.php-intellisense
code --install-extension GitHub.vscode-pull-request-github
code --install-extension hollowtree.vue-snippets
code --install-extension jsayol.firebase-explorer
code --install-extension kumar-harsh.graphql-for-vscode
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-vscode.atom-keybindings
code --install-extension ms-vscode.Go
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension octref.vetur
code --install-extension PeterJausovec.vscode-docker
code --install-extension premparihar.gotestexplorer
code --install-extension quicktype.quicktype
code --install-extension redhat.vscode-yaml
code --install-extension ritwickdey.LiveServer
code --install-extension sandy081.todotasks
code --install-extension slevesque.vscode-hexdump
code --install-extension wayou.vscode-todo-highlight
code --install-extension zhuangtongfa.Material-theme

echo "Copying .config dir"
cp -R .config/ ~/.config/

echo "Copying .local dir"
cp -R .local/ ~/.local/
