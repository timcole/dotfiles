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

echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing Oh My Vim"
curl -L https://raw.github.com/liangxianzhe/oh-my-vim/master/tools/install.sh | sh

echo "Copying Vim configs"
cp .after.vimrc ~/.after.vimrc

mkdir -p ~/.vim/colors/
mkdir -p ~/.vim/autoload/airline/themes/

cp .vim/autoload/onedark.vim ~/.vim/autoload/onedark.vim
wget -O ~/.vim/colors/onedark.vim https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
wget -O ~/.vim/autoload/airline/themes/onedark.vim https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/airline/themes/onedark.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/dist/start/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/pack/dist/start/nerdtree-git-plugin
git clone https://github.com/kien/ctrlp.vim ~/.vim/pack/dist/start/ctrlp
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/dist/start/typescript-vim

echo "Installing VSCode"
yay -S visual-studio-code-bin

echo "Installing VSCode Extensions"
code --install-extension albymor.increment-selection
code --install-extension dbaeumer.vscode-eslint
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension ducksoupdev.Vue2
code --install-extension felixfbecker.php-intellisense
code --install-extension GitHub.vscode-pull-request-github
code --install-extension hollowtree.vue-snippets
code --install-extension jsayol.firebase-explorer
code --install-extension kumar-harsh.graphql-for-vscode
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-vscode-remote.remote-ssh-explorer
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vscode.atom-keybindings
code --install-extension ms-vscode.Go
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension octref.vetur
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
