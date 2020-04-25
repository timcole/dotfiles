" CtrlP Ignores
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|node_modules|vendor|target|dist|build|android|ios|__tests__)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

if isdirectory(expand("%:p:h")."/.git") 
  let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
else
  let g:ctrlp_user_command = ['find %s -type f']
endif
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_use_caching = 0
