" This is the oh my vim directory
let $OH_MY_VIM="/home/tim/.oh-my-vim"
let &runtimepath=substitute(&runtimepath, '^', $OH_MY_VIM.",", 'g')

" Select the packages you need
let g:oh_my_vim_packages=[
            \'vim',
            \'basic',
            \'code', 
            \'text', 
            \'grep', 
            \'searching', 
            \'registers', 
            \'navigation', 
            \'files', 
            \'git', 
            \'python', 
            \'web',
            \'tools', 
            \'markdown', 
            \'bookmarks', 
            \'sessions', 
            \'spelling',
            \'neobundle', 
            \'golang'
            \]

exec ':so ' $OH_MY_VIM."/vimrc"

set mouse=a
set nowrap
set textwidth=0
set wrapmargin=0
