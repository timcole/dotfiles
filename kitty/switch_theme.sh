colorscheme=$1

if [[ $colorscheme = 'dark' ]]; then
  # change kitty theme
  cat ~/.config/kitty/one_dark.conf > ~/.config/kitty/colors.conf
  sed -i '.bak' 's/set background=light/set background=dark/' $HOME/.vimrc 
elif [[ $colorscheme = 'light' ]]; then
  # change kitty theme
  cat ~/.config/kitty/ayu_light.conf > ~/.config/kitty/colors.conf
  sed -i '.bak' 's/set background=dark/set background=light/' $HOME/.vimrc 
fi

# reload kitty colorscheme
kitty @ set-colors --all ~/.config/kitty/colors.conf
