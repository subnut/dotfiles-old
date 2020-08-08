let g:python3_host_prog = '/home/subhaditya/.config/nvim/venv/bin/python'

call plug#begin()

" Auto-complete
" -------------

" YouCompleteMe
"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py', 'on': [] }
" Initialized later


" NCM2
" ----
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Subscope-detectors
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-html-subscope'

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'svermeulen/ncm2-yoink', { 'on': [] }
Plug 'subnut/ncm2-github-emoji/', { 'do': './install.py' }

" ----

" Colorschemes
Plug 'morhetz/gruvbox'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'


" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }

" Focus on code only
Plug 'junegunn/goyo.vim'

" Fuzzy-finder
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" Statusline
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline', { 'on': [] }

" Misc
" ----
Plug 'amix/vim-zenroom2'
Plug 'majutsushi/tagbar'
Plug 'Shougo/echodoc.vim'					" Echo function usage
Plug 'alok/notational-fzf-vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-rooter' 					" Change root dir
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
Plug 'Konfekt/FastFold' 					" Better folding
Plug 'airblade/vim-gitgutter' 				" Git diff
Plug 'inkarkat/vim-ShowTrailingWhitespace' 	" Trailing whitespace
Plug 'psliwka/vim-smoothie'					" Smooth-scroll
Plug 'tpope/vim-abolish'
Plug 'mox-mox/vim-localsearch'
Plug 'mtth/scratch.vim'
Plug 'AndrewRadev/bufferize.vim'
Plug 'ncm2/float-preview.nvim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'					" gc<motion> = toggle comment
Plug 'svermeulen/vim-yoink'					" Clipboard


" Python
" -------
Plug 'nvie/vim-flake8', {'for': 'python'}					" Python linter
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python' }	" Python PEP8 autoindent
Plug 'kalekundert/vim-coiled-snake', { 'for': 'python' }			" Python folding
Plug 'dense-analysis/ale'									" Auto-linter
Plug 'psf/black', { 'branch': 'stable', 'for': 'python' }					" Auto-formatter
autocmd BufWritePre *.py execute ':Black'

call plug#end()
call timer_start(0, {id->execute("call plug#load('vim-airline')")} )
call timer_start(0, {id->execute("call plug#load('ncm2-yoink')")})

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
syntax enable

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
	elseif g:my_env_bg == 'light'
		set background=light
	endif
endfun
call My_bg_setter()


" Goyo customization
" ------------------
let g:goyo_width=100
let g:goyo_height=20
fun! s:goyo_enter()
	hi CursorLine gui=NONE
	AirlineToggle
endfun
fun! s:goyo_leave()
	hi CursorLine gui=underline
	AirlineToggle
endfun
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


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
set guicursor=n-v-c-sm:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr-o:hor20-Cursor/lCursor


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
	let g:ncm2#complete_delay = 200
	let g:mkdp_refresh_slow = 1	" Only refresh on leaving insert mode

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
function MarkdownBrowserFirefox(url)
	silent! execute "!firefox" shellescape("--new-window") string(a:url) | redraw!
endfunction
function MarkdownBrowserQute(url)
	silent! execute "!qutebrowser" shellescape("--target") 'window' string(a:url) '&' | redraw!
endfunction
let g:mkdp_browserfunc='MarkdownBrowserQute'

" FZF
" ---
" This is the default extra key bindings
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }
" Prefix FZF commands
" let g:fzf_command_prefix = 'FZF'


" Undo history
" ------------
if has('persistent_undo')										" guard for distributions lacking the persistent_undo feature.
		let target_path = expand('~/.nvim-undo-history/')		" define a path to store persistent_undo files
		if !isdirectory(target_path)							" if the location does not exist,
			call system('mkdir -p ' . target_path)				" create the directory and any parent directories
		endif
		let &undodir = target_path								" point Vim to the defined undo directory
		set undofile											" finally, enable undo persistence
endif


" Notational velocity
" -------------------
" let g:nv_search_paths = ['~/notes', 'docs.md','./notes.md']
let g:nv_search_paths = ['~/Notes', './Notes', './Notes.md', './README.md']
let g:nv_ignore_files = 1
let g:nv_use_short_pathnames=1
let g:nv_ignore_pattern = ['*NVignore*', '*.sh']

" Default split direction
" -----------------------
set splitright
set splitbelow

" Vim rooter
" ----------
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_silent_chdir = 1
let g:rooter_cd_cmd= "lcd"	" change directory for the current window only
let g:rooter_resolve_links = 1

" Python folding (vim-coiled-snake)
" --------------
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
" --------------------
let g:flake8_quickfix_height=15		" Height of quickfix window
let g:flake8_show_in_gutter=1		" show signs in gutter
let g:flake8_error_marker='❌'		" set error marker to 'EE'
let g:flake8_warning_marker='W'		" set warning marker to 'WW'

" Git gutter
" ----------
set signcolumn=yes
let g:gitgutter_set_sign_backgrounds = 1
"hi clear SignColumn	" Included in colorscheme_overrides

" vim-airline
" -----------
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
"let g:deoplete#enable_at_startup = 1
"au InsertEnter * ++once call timer_start(0, {id->execute("call deoplete#custom#option('sources',{ 'python': ['jedi'] })")} )
"au InsertEnter * ++once call timer_start(0, {id->execute("call deoplete#enable()")} )
"call timer_start(0, {id->execute("call deoplete#custom#option({
"			\ 'auto_complete_delay': 100,
"			\ 'sources': { 'python': ['jedi']},
"			\ 'ignore_sources': {'_': ['around']},
"			\ })")})

" Floating preview
" ----------------
set completeopt-=preview
let g:float_preview#docked = 1
let g:float_preview#max_width = 100

" Show function parmeters
" -----------------------
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'echo'
let g:echodoc#events = ['CompleteDone', 'TextChangedI', 'TextChangedP']

" Do not show -- MATCH X OF Y -- in completion
" ---------------------------------------------
if has("patch-7.4.314")
	set shortmess+=c
endif

" Navigate through suggestions using TAB and Arrows
" ----------------------------------------
inoremap <silent><expr><tab>	pumvisible() ? "\<c-n>"  : "\<tab>"
inoremap <silent><expr><s-tab>	pumvisible() ? "\<c-p>"  : "\<s-tab>"
inoremap <expr><Down>			pumvisible() ? "\<C-n>"  : "\<Down>"
inoremap <expr><Up> 			pumvisible() ? "\<C-p>"  : "\<Up>"

" NCM2
" ----
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr><CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd BufEnter * call timer_start(0, {id->execute("call ncm2#enable_for_buffer()")})
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" Disable syntax hint after completion
let g:ncm2_jedi#call_sig_hint = 0

" Gabrielana markdown
" -------------------
let g:markdown_enable_insert_mode_mappings = 0

" Indentline
" ----------
let g:indentLine_enabled = 0
let g:indentLine_char = '│'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:indentLine_color_gui = '#00ff00'
nnoremap <silent> <C-i> :IndentLinesToggle <CR>

" vim-yoink
" ---------
" Alt+P and Alt+Shift+P
nmap <a-p> <plug>(YoinkPostPasteSwapBack)
nmap <a-s-p> <plug>(YoinkPostPasteSwapForward)
" Do not change cursor position after yanking
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)
" Remap p and P to yoink
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
let g:yoinkIncludeDeleteOperations = 1
let g:yoinkMoveCursorToEndOfPaste = 1		" ... after pasting
let g:yoinkSwapClampAtEnds = 0				" Cycle thru the list while swapping

