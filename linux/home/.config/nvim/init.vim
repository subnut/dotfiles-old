call plug#begin()

" Auto-complete
" -------------

" YouCompleteMe
"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py', 'on': [] }
" Initialized later

" Deoplete
" --------
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'on': [] }
	call timer_start(0, {id->execute("call plug#load('deoplete.nvim')")} )
	Plug 'Shougo/echodoc.vim'
	Plug 'Shougo/context_filetype.vim'
	let g:echodoc#enable_at_startup = 1
	Plug 'Shougo/neco-vim'
	Plug 'fszymanski/deoplete-emoji'
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
endif


" Colorscheme
Plug 'morhetz/gruvbox'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'


" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}
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
" Highlighted yank
Plug 'machakann/vim-highlightedyank'
" Vim surround
Plug 'tpope/vim-surround'
" Git diff
Plug 'airblade/vim-gitgutter'
" Better folding
Plug 'Konfekt/FastFold'
" Trailing whitespace
Plug 'inkarkat/vim-ShowTrailingWhitespace' ", { 'branch': 'stable' }
" Git
Plug 'tpope/vim-fugitive', {'on': []}
call timer_start(0, {id->execute("call plug#load('vim-fugitive')")})
" Statusline
Plug 'vim-airline/vim-airline', {'on': []}
call timer_start(0, {id->execute("call plug#load('vim-airline')")} )
Plug 'bling/vim-bufferline'
" Smooth-scroll
Plug 'psliwka/vim-smoothie'


" Misc
" ----
Plug 'tpope/vim-abolish'
Plug 'mox-mox/vim-localsearch'
Plug 'mtth/scratch.vim'
Plug 'AndrewRadev/bufferize.vim'
Plug 'ncm2/float-preview.nvim'


" Python
" -------
Plug 'nvie/vim-flake8', {'for': 'python', 'on': []}					" Python linter
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python', 'on': [] }	" Python PEP8 autoindent
Plug 'kalekundert/vim-coiled-snake', {'for': 'python', 'on': [] }	" Python folding
Plug 'dense-analysis/ale'											" Auto-linter
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python', 'on': [] }	" Python plugin for auto-completer
call timer_start(0, {id->execute("call plug#load('nvie/vim-flake8')")})
call timer_start(0, {id->execute("call plug#load('vim-python-pep8-indent')")})
call timer_start(0, {id->execute("call plug#load('vim-coiled-snake')")})
call timer_start(0, {id->execute("call plug#load('deoplete-jedi')")})


call plug#end()

" YouCompleteMe lazy loading
" ---------------------------
"let g:YouCompleteMeLazyLoaded = 0
"function! LazyLoadingYMC()
"  if g:YouCompleteMeLazyLoaded == 0
"	 let g:YouCompleteMeLazyLoaded = 1
"	 call plug#load('YouCompleteMe') | call youcompleteme#Enable()
"  endif
"endfunction
"autocmd InsertEnter * call LazyLoadingYMC()
"autocmd BufWinEnter * call timer_start(0, {id->execute('call LazyLoadingYMC()')} )
"autocmd UIEnter * call timer_start(0, {id->execute('call LazyLoadingYMC()')} )
"autocmd InsertEnter * ++once call timer_start(0, {id->execute("call plug#load('YouCompleteMe')")} )

" Set GUI colors
if (has("termguicolors"))
	set termguicolors
endif
call timer_start(0, {id->execute("syntax enable")})

" Colorscheme
" -----------
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox
" set bg=dark
let g:my_env_bg = $MY_NVIM_BG
fun My_bg_setter()
	if g:my_env_bg == 'dark'
		set background=dark
	else
		if g:my_env_bg == 'light'
			set background=light
		endif
	endif
endfun
call My_bg_setter()

" Customize colorscheme
" ---------------------
augroup colorscheme_overrides
	autocmd!
	autocmd ColorScheme * hi Comment gui=italic
	autocmd ColorScheme * hi clear SignColumn
	autocmd ColorScheme * hi CursorLine gui=underline
	autocmd ColorScheme * hi Cursor gui=NONE
	autocmd ColorScheme * hi Cursor guifg=bg guibg=fg
	autocmd ColorScheme * set guicursor=n-v-c-sm:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr-o:hor20
	autocmd ColorScheme * hi clear ALEErrorSign
	autocmd ColorScheme * hi clear ALEWarningSign
augroup END
hi Comment gui=italic
hi clear SignColumn
hi CursorLine gui=underline
hi Cursor gui=NONE
hi Cursor guifg=bg guibg=fg
set guicursor=n-v-c-sm:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr-o:hor20


" Custom settings
" ---------------
set mouse=a
set clipboard+=unnamedplus
set cursorline
set noexpandtab					" DO NOT replace tabs with spaces
set tabstop=4					" No. of spaces that <TAB> stands for
set shiftwidth=0				" i.e. tabstop value will be used for auto-indenting
" au BufWinEnter *.py %retab!	" Replace all tabs with spaces when entering a python file
" set foldmethod=marker
" set nowrap
set autoread
set autowrite
"set nonumber nornu
set nu rnu
" nnoremap <silent> <C-n> :set number!<CR>
" nnoremap <silent> <C-A-n> :set relativenumber!<CR>
nnoremap <silent> <C-g> :Goyo<CR>
nnoremap <silent> <C-l> :set list!<CR>
nnoremap <silent> <C-n> :call ToggleLineNrCustom()<CR>
nnoremap <silent> <C-A-n> :call ToggleLineNrCustomLocal()<CR>
nnoremap <silent> <C-c> :ContextToggleWindow <CR>

" LineNr toggling functions
" -------------------------
fun ToggleLineNrCustom()
	if &nu == 0
		SetAll nu 1
		SetAll rnu 0
	else
		if &rnu == 0
			SetAll rnu 1
			SetAll nu 1
		else
			SetAll nu 0
			SetAll rnu 0
		endif
	endif
endfun
fun ToggleLineNrCustomLocal()
	if &nu == 0
		set nu
	else
		if &rnu == 0
			set rnu
		else
			set nonu nornu
		endif
	endif
endfun


" Battery saver mode
" ------------------
function! MyOnBattery()
	if has('macunix')
		return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
	elseif has('unix')
		return readfile('/sys/class/power_supply/AC/online') == ['0']
	endif
	return 0
endfunction

if MyOnBattery()
	let g:ale_lint_delay = 5000
	let g:ale_lint_on_text_changed = 'never'
endif


" Aliases
fun! SetupCommandAlias(from, to)
	exec 'cnoreabbrev <expr> '.a:from
			\ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
			\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("W","w")
call SetupCommandAlias("Q","q")
call SetupCommandAlias("Qa","qa")
call SetupCommandAlias("darkmode","set bg=dark")
call SetupCommandAlias("lightmode","set bg=light")
call SetupCommandAlias("fzf","FZF!")
call SetupCommandAlias("FZF!!","FZF")
call SetupCommandAlias("notes","NV!")
call SetupCommandAlias("NV!!","NV")
call SetupCommandAlias("~","cd ~")
call SetupCommandAlias("so","source ~/.config/nvim/init.vim")



" SetAll - 'set' for all tabs and windows
" -------
function! s:set_all(option, val, ...) abort
	let val = eval(a:val)
	for t in range(1, tabpagenr('$'))
		for w in range(1, tabpagewinnr(t, '$'))
			if gettabwinvar(t, w, '&buftype') !=# ''
				continue
			endif
			call settabwinvar(t, w, '&'.a:option, val)
		endfor
	endfor
endfunction
command! -complete=option -nargs=+ SetAll call s:set_all(<f-args>)


" NERDTree File explorer
" ----------------------
let g:NERDTreeWinSize = 35
let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-e> :NERDTreeToggle<CR>


" Open file at last cursor position
" ---------------------------------
autocmd BufReadPost *
	\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif


" Live substitution (syntax: :%s/from/to)
" -----------------
set inccommand=split
set gdefault		" Substitute all occurences on a line

" MarkdownPreview
" ---------------
function MarkdownBrowser(url)
	silent! execute "!firefox" shellescape("--new-window") string(a:url) | redraw!
endfunction
let g:mkdp_browserfunc='MarkdownBrowser'

" FZF
" This is the default extra key bindings
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }
" Prefix FZF commands
" let g:fzf_command_prefix = 'FZF'


" Undo history
if has('persistent_undo')										" guard for distributions lacking the persistent_undo feature.
		let target_path = expand('~/.nvim-undo-history/')		" define a path to store persistent_undo files
		if !isdirectory(target_path)							" if the location does not exist,
			call system('mkdir -p ' . target_path)				" create the directory and any parent directories
		endif
		let &undodir = target_path								" point Vim to the defined undo directory
		set undofile											" finally, enable undo persistence
endif


" Notational velocity
" let g:nv_search_paths = ['~/notes', 'docs.md','./notes.md']
let g:nv_search_paths = ['~/Notes', './Notes', './Notes.md', './README.md']
let g:nv_ignore_files = 1
let g:nv_use_short_pathnames=1
let g:nv_ignore_pattern = ['*NVignore*', '*.sh']

" Default split direction
set splitright
set splitbelow

" Vim rooter
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1
let g:rooter_cd_cmd= "lcd"	" change directory for the current window only
let g:rooter_resolve_links = 1

" Python folding (vim-coiled-snake)
filetype plugin indent on
let g:coiled_snake_set_foldtext = 1

" Highlighted yank
" -----------------
" let g:highlightedyank_highlight_duration = 1000		" Assign a number of time in milliseconds.
let g:highlightedyank_highlight_duration = -1			" A negative number makes the highlight persistent.
" When a new text is yanked or user starts editing, the old highlighting shall be removed
"
" If the highlight is not visible for some reason, you can redefine the HighlightedyankRegion highlight group like:
" highlight HighlightedyankRegion cterm=reverse gui=reverse
" Note that the line should be located AFTER the :colorscheme command execution in your vimrc.

" Python linter config
let g:flake8_quickfix_height=15		" Height of quickfix window
let g:flake8_show_in_gutter=1		" show signs in gutter
let g:flake8_error_marker='❌'		" set error marker to 'EE'
let g:flake8_warning_marker='W'		" set warning marker to 'WW'

" Git gutter
set signcolumn=yes
let g:gitgutter_set_sign_backgrounds = 1
"hi clear SignColumn	" Included in colorscheme_overrides

" vim-airline
set noshowmode
let g:bufferline_echo = 0
let g:bufferline_modified = ' +'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.readonly = '[RO]'



" Show non-printable characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" set list


" Deoplete
" --------
inoremap <silent><expr><tab>	pumvisible() ? "\<c-n>"  : "\<tab>"
inoremap <silent><expr><s-tab>	pumvisible() ? "\<c-p>"  : "\<s-tab>"
inoremap <expr><Down>			pumvisible() ? "\<C-n>"  : "\<Down>"
inoremap <expr><Up> 			pumvisible() ? "\<C-p>"  : "\<Up>"
let g:deoplete#enable_at_startup = 1
"au InsertEnter * ++once call timer_start(0, {id->execute("call deoplete#custom#option('sources',{ 'python': ['jedi'] })")} )
"au InsertEnter * ++once call timer_start(0, {id->execute("call deoplete#enable()")} )
if has("patch-7.4.314")
	set shortmess+=c
endif
"let g:deoplete#sources.python = ['jedi']
call timer_start(0, {id->execute("call deoplete#custom#option({
			\ 'auto_complete_delay': 100,
			\ 'sources': { 'python': ['jedi']},
			\ 'ignore_sources': {'_': ['around']},
			\ })")})
set completeopt-=preview
let g:float_preview#docked = 0
let g:float_preview#max_width = 100
let g:echodoc#type = 'echo'
let g:echodoc#events = ['CompleteDone', 'TextChangedI', 'TextChangedP']
