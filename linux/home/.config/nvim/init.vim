call plug#begin()

" Auto-complete
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py', 'on': [] }
" Initialized later

" Colorscheme
Plug 'morhetz/gruvbox'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'


" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Focus on code only
Plug 'junegunn/goyo.vim'
" Fuzzy-finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Undotree
Plug 'mbbill/undotree'
" Notational ... take notes
Plug 'alok/notational-fzf-vim'
" Change root dir
Plug 'airblade/vim-rooter'

call plug#end()

" YouCompleteMe lazy loading
let g:YouCompleteMeLazyLoaded = 0
function! LazyLoadingYMC()
  if g:YouCompleteMeLazyLoaded == 0
    let g:YouCompleteMeLazyLoaded = 1
    call plug#load('YouCompleteMe') | call youcompleteme#Enable()
  endif
endfunction
"autocmd InsertEnter * call LazyLoadingYMC()
"autocmd BufWinEnter * call timer_start(1, {id->execute('call LazyLoadingYMC()')} )
autocmd UIEnter * call timer_start(1, {id->execute('call LazyLoadingYMC()')} )


if (has("termguicolors"))
 set termguicolors
endif
syntax enable

" Colorscheme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox
set bg=dark

set mouse=a
set clipboard+=unnamedplus
set cursorline
hi LineNr guifg=#202020
set number


" Aliases
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("W","w")
call SetupCommandAlias("Q","q")
call SetupCommandAlias("darkmode","set bg=dark")
call SetupCommandAlias("lightmode","set bg=light")
call SetupCommandAlias("fzf","FZF!")
call SetupCommandAlias("FZF!!","FZF")
call SetupCommandAlias("notes","NV!")
call SetupCommandAlias("NV!!","NV")


" NERDTree File explorer
let g:NERDTreeWinSize = 35
let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Open file at last cursor position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" Live substitution (syntax: :%s/from/to)
set inccommand=split

" Function for MarkdownPreview
function MarkdownBrowser(url)
	silent! execute "!firefox" shellescape("--new-window") string(a:url) | redraw!
endfunction

" MarkdownPreview 
let g:mkdp_browserfunc='MarkdownBrowser'

" FZF
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" Undo history
if has('persistent_undo')						" guard for distributions lacking the persistent_undo feature.
	let target_path = expand('~/.nvim-undo-history/')		" define a path to store persistent_undo files
	if !isdirectory(target_path)					" if the location does not exist,
	       	call system('mkdir -p ' . target_path)			" create the directory and any parent directories 
	endif
	let &undodir = target_path					" point Vim to the defined undo directory
	set undofile							" finally, enable undo persistence
endif


" Notational velocity
" let g:nv_search_paths = ['~/notes', 'docs.md','./notes.md']
let g:nv_search_paths = ['~/Notes', './Notes.md', './README.md']
let g:nv_ignore_files = 1
let g:nv_use_short_pathnames=1
let g:nv_ignore_pattern = ['*NVignore*', '*.sh']

" Default split direction
set splitright
set splitbelow

" Vim rooter
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 0
let g:rooter_use_lcd = 1	" change directory for the current window only
let g:rooter_resolve_links = 1
