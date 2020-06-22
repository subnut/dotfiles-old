call plug#begin()


" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}



call plug#end()

set mouse=a
set clipboard+=unnamedplus

    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
