autocmd BufEnter *.{jsx,tsx} :syntax sync fromstart
autocmd BufLeave *.{jsx,tsx} :syntax sync clear
