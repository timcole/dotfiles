" let g:prettier#exec_cmd_async = 1

autocmd BufWritePre *.jsx,*.js,*.tsx,*.ts Prettier
