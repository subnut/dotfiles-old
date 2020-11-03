" vim: fdm=marker noet ts=4 nowrap
scriptencoding utf-8

" Disable polyglot plasticboy markdown to avoid clashing with gabrielelana
"	let g:polyglot_disabled = ['markdown.plugin']
" NOTE: This configuration MUST be set before vim-polyglot is loaded


let g:python3_host_prog = '/home/subhaditya/.config/nvim/venv/bin/python'
if len($VIRTUAL_ENV) == 0
	let $PATH = '/home/subhaditya/.config/nvim/venv/bin:' . $PATH
else
	let $PATH = join(insert(split($PATH, ':'),'/home/subhaditya/.config/nvim/venv/bin',1),':')
endif

call plug#begin()	" Make sure you use single-quotes in all Plug commands below

" YouCompleteMe	{{{1
" -------------
" Plug 'ycm-core/YouCompleteMe', { 'do': './install.py', 'on': [] }
" Initialized later
" }}}

" NCM2
" -----------------------------------------------------------------------
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" Plug 'ncm2/float-preview.nvim'

" Subscope-detectors
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-html-subscope'

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'svermeulen/ncm2-yoink', { 'on': [] }
Plug 'subnut/ncm2-github-emoji', { 'do': 'python install.py' }
" -----------------------------------------------------------------------

" LSP
" -----------------------
Plug 'subnut/vim-lsp'
let g:lsp_documentation_float = 1
let g:lsp_documentation_float_docked = 0
let g:lsp_diagnostics_enabled = 1

" Integration with ncm2
Plug 'prabirshrestha/async.vim'
Plug 'ncm2/ncm2-vim-lsp'

" Server installer
Plug 'mattn/vim-lsp-settings'
" ----------------------


" Neovim nightly
" --------------
"  Treesitter
" Plug 'nvim-treesitter/nvim-treesitter'


" ---------------


" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'reedes/vim-colors-pencil'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'romgrk/doom-one.vim'
Plug 'sainnhe/sonokai'
Plug 'Iron-E/nvim-highlite'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}


" Markdown
" Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'PratikBhusal/vim-grip'
let g:grip_default_map = 0

" Focus on code only
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Fuzzy-finder
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'		" Commit browser

" Statusline
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline', { 'on': [] }

" Python
" -------
" Plug 'nvie/vim-flake8', { 'for': 'python' }					" Python linter
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }	" Python PEP8 autoindent
Plug 'kalekundert/vim-coiled-snake', { 'for': 'python' }	" Python folding
Plug 'psf/black', { 'branch': 'stable', 'on': [] }			" Auto-formatter
Plug 'Yggdroot/indentLine'

" Misc
" ----
Plug 'dense-analysis/ale'							" Auto-linter
Plug 'chaoren/vim-wordmotion'
Plug 'reedes/vim-pencil'
Plug 'majutsushi/tagbar'
Plug 'Shougo/echodoc.vim'							" Echo function usage
Plug 'alok/notational-fzf-vim'
Plug 'mbbill/undotree'
Plug 'simnalamburt/vim-mundo'
let g:mundo_preview_bottom = 1
Plug 'airblade/vim-rooter'							" Change root dir
Plug 'airblade/vim-gitgutter'						" Git diff
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'							" (c)oe(rc)e to case-change
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'							" gc<motion> = toggle comment
Plug 'svermeulen/vim-yoink'							" Clipboard
Plug 'Konfekt/FastFold'								" Better folding
Plug 'inkarkat/vim-ShowTrailingWhitespace'			" Trailing whitespace
Plug 'subnut/vim-smoothie'							" Smooth-scroll
" Plug 'psliwka/vim-smoothie'							" Smooth-scroll
Plug 'mox-mox/vim-localsearch'
Plug 'wincent/scalpel'								" See before replacing
Plug 'mtth/scratch.vim'
Plug 'AndrewRadev/bufferize.vim'
Plug 'sheerun/vim-polyglot'							" Polyglot => one who knows many languages
Plug 'norcalli/nvim-colorizer.lua'					" :ColorizerAttachToBuffer
Plug 'subnut/vim-iawriter'
Plug 'kkoomen/vim-doge', {'do':{->doge#install()}}	" (DO)cumentation (GE)nerator
Plug 'RRethy/vim-illuminate'
Plug 'justinmk/vim-sneak'							" s<char><char> (z<char><char> for operator-pending mode)
Plug 'romainl/vim-cool'								" Remove search highlight automatically
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-completion'

" Vanity
" ------
Plug 'lambdalisue/suda.vim'
Plug 'fedorenchik/vimcalc3'					" :Calc
Plug 'mattn/calendar-vim'					" :Calendar
" Plug 'raghur/vim-ghost'


call plug#end()
call timer_start(0, {id->execute("call plug#load('vim-airline')")})
call timer_start(0, {id->execute("call plug#load('ncm2-yoink')")})
augroup delayed_plug_load
	au!
	au BufEnter *.py call timer_start(0, {id->execute("call plug#load('black')")})
augroup end
augroup black_on_write
	au!
	autocmd BufWritePre *.py execute ':Black'
augroup end

" YouCompleteMe lazy loading
" ---------------------------	" {{{1
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
" }}}

" Set GUI colors
" --------------
if (has('termguicolors'))
	set termguicolors
endif
syntax enable
if &termguicolors
	lua require'colorizer'.setup{''}
endif

" Colorscheme
" -----------
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_italic=1
colorscheme gruvbox
" set bg=dark
let g:my_env_bg = $MY_NVIM_BG
fun My_bg_setter()
	if g:my_env_bg ==? 'dark'
		set background=dark
	elseif g:my_env_bg ==? 'light'
		set background=light
	endif
endfun
call My_bg_setter()


" Goyo customization
" ------------------
" let g:goyo_width=100
" let g:goyo_height=20
let g:goyo_width='70%'
fun! s:goyo_enter()
	hi CursorLine gui=NONE
	set eventignore+=FocusGained
	let s:saved_signcolumn_state = &scl
	set scl=no
endfun
fun! s:goyo_leave()
	hi CursorLine gui=underline
	set eventignore-=FocusGained
	if exists('s:saved_signcolumn_state')
		execute 'set scl=' . s:saved_signcolumn_state
	endif
endfun
augroup goyo_customization
	au!
	autocmd User GoyoEnter nested call <SID>goyo_enter()
	autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup end


" Customize colorscheme
" ---------------------
let g:kitty_fancy_cursor = 0	" Somewhat successful 'inverse' cursor color in kitty
func! s:kitty_term_custom()	" {{{1
	if !exists('g:kitty_fancy_cursor')	" {{{2
		let g:kitty_fancy_cursor = 0
	endif	" }}}
	if $TERM =~# 'kitty'
		if synIDattr(synIDtrans(hlID('Cursor')), 'reverse')	" {{{2
			hi Cursor gui=NONE
			if !g:kitty_fancy_cursor	" {{{3
				hi Cursor guifg=bg guibg=fg
				augroup kitty_term_custom
					au!
				augroup end
			else
				hi Cursor guifg=bg
				augroup kitty_term_custom
					au!
					au CursorMoved * execute('hi Cursor guibg='. (len(synIDattr(synIDtrans(hlID(synIDattr(synID(line("."), col("."), 1), 'name'))), "fg")) ? synIDattr(synIDtrans(hlID(synIDattr(synID(line("."), col("."), 1), 'name'))), "fg") : 'fg'))
				augroup end
			endif	" }}}
		endif
	endif	" }}}
endfun	" }}}
augroup colorscheme_overrides
	autocmd!
	" autocmd ColorScheme * hi Comment gui=italic
	autocmd ColorScheme * hi clear SignColumn
	autocmd ColorScheme * hi CursorLine gui=underline
	autocmd ColorScheme * call s:kitty_term_custom()
	autocmd ColorScheme * set guicursor=n-v-c-sm:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr-o:hor20
	autocmd ColorScheme * hi clear ALEErrorSign
	autocmd ColorScheme * hi clear ALEWarningSign
	autocmd ColorScheme gruvbox call MyGruvboxCustomizations()
augroup end
" hi Comment gui=italic
hi clear SignColumn
hi CursorLine gui=underline
call s:kitty_term_custom()
set guicursor=n-v-c-sm:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr-o:hor20-Cursor/lCursor
hi clear ALEWarningSign
hi clear ALEErrorSign
fun! MyGruvboxCustomizations()
if g:colors_name !=# 'gruvbox'
	return
endif
hi clear Visual
execute('hi Visual  guibg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui'))
silent! execute('hi Visual  ctermbg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'cterm'))
endfun
call MyGruvboxCustomizations()

" Get the higlight group of the character under cursor
" ----------------------------------------------------
fun Get_hi_group()
	echo synIDattr(synID(line('.'), col('.'), 1), 'name')
endfun
command! GetHiGroup call Get_hi_group()

" Custom settings
" ---------------
set ignorecase		" Ignore uppercase and lowercase
set smartcase		" If search contains UPPERCASE letter, then set "noignorecase"
set mouse=a
set clipboard+=unnamedplus
set cursorline
set noexpandtab					" DO NOT replace tabs with spaces
set tabstop=4					" No. of spaces that <TAB> stands for
set shiftwidth=0				" i.e. tabstop value will be used for auto-indenting
" au BufWinEnter *.py %retab!	" Replace all tabs with spaces when entering a python file
" set foldmethod=marker
" set nowrap
set showbreak=¬\ 				" The backslash is used to escape the space after it
set autoread
set autowrite
"set nonumber nornu
set number relativenumber
" nnoremap <silent> <C-n> :set number!<CR>
" nnoremap <silent> <C-A-n> :set relativenumber!<CR>
nnoremap <silent> gB :bprev<CR>
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> <C-g> :Goyo<CR>
nnoremap <silent> <C-l> :set list!<CR>
nnoremap <silent> <C-n> :call ToggleLineNrCustom()<CR>
nnoremap <silent> <C-A-n> :call ToggleLineNrCustomLocal()<CR>
nnoremap <silent> yY :%y<CR>
" NOTE: This one's pretty darn useful.
		inoremap <a-o> <c-o>
" inoremap <C-w> <C-o>
" let mapleader = ';'
let mapleader = ' '
com! YankAll %y

nmap <Leader>s <Plug>(Scalpel)
nnoremap <leader>e <cmd>CHADopen<cr>
nnoremap <silent> <leader>r :LspRename<cr>
nnoremap <silent> <leader>m :MundoToggle<cr>

" Advanced customization
" ----------------------
" Goto specific line-number using <LineNr>Enter
	nnoremap <silent><expr> <CR> (v:count ? 'G' : '<CR>')

" Automatically close in markdown and html
"
"		*	"<" --> "<>" with cursor in between < and >
"		*	check that the previous map does not interfere if I typed "<>"
"		*	"`" --> "``" with cursor in between
"		*	"```" mapping. ref: https://github.com/SidOfc/mkdx#insert-fenced-code-block
"		*	If <CR> inside tag at beginning, "/", else if <CR> inside tag at end, directly goto next line

augroup my_autoclose_au
	au!
	au BufEnter,FileType * if index(['markdown','html'], &ft) >= 0 | execute("inoremap <silent><buffer><expr> < ((col('.') >= col('$') - 1) ? '<><C-o>i' : '<><C-o>h')") | endif
	au BufEnter,FileType * if index(['markdown','html'], &ft) >= 0 | execute("imap <silent><buffer> <> <>") | endif
	" au BufEnter,FileType * if &ft ==# 'markdown' | execute("inoremap <silent><buffer><expr> ` ((col('.') >= col('$') - 1) ? '``<C-o>i' : '``<C-o>h')") | endif
	" au BufEnter,FileType * if &ft ==# 'markdown' | execute("inoremap <buffer><silent> ``` ```<Enter>```<C-o>k<C-o>A") | endif
	au BufEnter,FileType * if &ft ==# 'html' | execute("imap <buffer><silent><expr> <CR> ((getline('.')[col('.') - 2] == '<') ? '/' : ((getline('.')[col('.') - 1] == '>') ? '<C-o>A<CR>' : '<CR>'))") | endif
	au BufEnter,FileType * if &ft ==# 'markdown' | execute("imap <buffer><silent><expr> <CR> ((getline('.')[col('.') - 2] == '<') ? '/' : ((getline('.')[col('.') - 1] == '>') ? '<C-o>A<CR>' : ( pumvisible() ? '<c-y><cr>'  : '<CR>')))") | endif
augroup end

" Change previewheight on terminal resize
augroup my_auto_previewheight
	au!
	au VimEnter * ++once if !exists('g:preview_window_height_percentage') | let g:preview_window_height_percentage = 55 | endif
	au VimEnter * ++once execute('set pvh=' . &lines*g:preview_window_height_percentage/100 )
	au VimResized * execute('set pvh=' . &lines*g:preview_window_height_percentage/100 )
augroup end

" LineNr toggling functions
" -------------------------
fun ToggleLineNrCustom()	" {{{1
	if &number == 0
		SetAll nu 1
		SetAll rnu 0
	else
		if &relativenumber == 0
			SetAll rnu 1
			SetAll nu 1
		else
			SetAll nu 0
			SetAll rnu 0
		endif
	endif
endfun
fun ToggleLineNrCustomLocal()	" {{{1
	if &number == 0
		set number
	else
		if &relativenumber == 0
			set relativenumber
		else
			set nonumber norelativenumber
		endif
	endif
endfun	" }}}


" Battery saver mode
" ------------------
function! MyOnBattery()	" {{{1
	if has('macunix')
		return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
	elseif has('unix')
		return readfile('/sys/class/power_supply/AC/online') == ['0']
	endif
	return 0
endfunction
	" }}}
if MyOnBattery()
	let g:ale_lint_delay = 5000
	let g:ale_lint_on_text_changed = 'normal'
	let g:ncm2#complete_delay = 200
	let g:mkdp_refresh_slow = 1	" Only refresh on leaving insert mode
endif


" Aliases
" -------
fun! SetupCommandAlias(from, to)	" {{{1
	exec 'cnoreabbrev <expr> '.a:from
			\ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
			\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun	" }}}
call SetupCommandAlias('W','w')
call SetupCommandAlias('Q','q')
call SetupCommandAlias('Qa','qa')
call SetupCommandAlias('darkmode','set bg=dark')
call SetupCommandAlias('lightmode','set bg=light')
call SetupCommandAlias('fzf','FZF!')
call SetupCommandAlias('FZF!!','FZF')
call SetupCommandAlias('H','History')
call SetupCommandAlias('Y','YankAll')
call SetupCommandAlias('notes','NV!')
call SetupCommandAlias('NV!!','NV')
call SetupCommandAlias('~','cd ~')
call SetupCommandAlias('python','python3')
call SetupCommandAlias('colo','MyColorscheme')
" call SetupCommandAlias("so","source ~/.config/nvim/init.vim")


" SetAll - 'set' for all tabs and windows	" {{{1
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
endfunction	" }}}
command! -complete=option -nargs=+ SetAll call s:set_all(<f-args>)


" NERDTree File explorer
" ----------------------
let g:NERDTreeWinSize = 35
let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open		" {{{1
augroup NERDTree_au
au!
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup end	" }}}
" Toggle
" nnoremap <silent> <C-e> :NERDTreeToggle<CR>


" Open file at last cursor position		" {{{1
" ---------------------------------
augroup file_open_last_pos
au!
autocmd BufReadPost *
	\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif
augroup end	" }}}


" Live substitution (syntax: :%s/from/to)
" -----------------
set inccommand=split
set gdefault		" Substitute all occurences on a line (i.e. reverse the work of the /g global switch)

" MarkdownPreview
" ---------------
function MarkdownBrowserFirefox(url)	" {{{1
	silent! execute '!firefox' shellescape('--new-window') string(a:url) | redraw!
endfunction
function MarkdownBrowserQute(url)	" {{{1
	silent! execute '!qutebrowser' shellescape('--target') 'window' string(a:url) '&' | redraw!
endfunction	" }}}
let g:mkdp_browserfunc='MarkdownBrowserFirefox'
let g:mkdp_auto_close = 0

" FZF
" ---
" This is the default extra key bindings
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }
" Prefix FZF commands
" let g:fzf_command_prefix = 'FZF'
if len(split($FZF_DEFAULT_OPTS,'hidden')) - len(split($FZF_DEFAULT_OPTS,'nohidden')) == 1
let $FZF_DEFAULT_OPTS = join(split($FZF_DEFAULT_OPTS,'hidden'),'nohidden')
endif

augroup AutoFZFLayout
	au!
	" au VimResized * if &lines < 15 | let g:fzf_layout = { 'down': '~40%' } | else | execute(exists('g:fzf_layout') ? 'unlet g:fzf_layout' : '') | endif
	" au VimEnter * ++once if &lines < 15 | let g:fzf_layout = { 'down': '~40%' } | else | execute(exists('g:fzf_layout') ? 'unlet g:fzf_layout' : '') | endif
	au VimResized * if &lines < 15 | let g:fzf_layout = { 'down': '~40%' } | else | let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.8}} | endif
	au VimEnter * ++once if &lines < 15 | let g:fzf_layout = { 'down': '~40%' } | else | let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.8}} | endif
augroup end


" Undo history
" ------------	" {{{1
if has('persistent_undo')										" guard for distributions lacking the persistent_undo feature.
	let target_path = expand('~/.nvim-undo-history/')		" define a path to store persistent_undo files
	if !isdirectory(target_path)							" if the location does not exist,
		call system('mkdir -p ' . target_path)				" create the directory and any parent directories
	endif
	let &undodir = target_path								" point Vim to the defined undo directory
	set undofile											" finally, enable undo persistence
endif	" }}}


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
let g:rooter_resolve_links = 1
let g:rooter_cd_cmd= 'lcd'	" change directory for the current window only

" Python folding (vim-coiled-snake)
" --------------
filetype plugin indent on
let g:coiled_snake_set_foldtext = 1

" Highlighted yank
" -----------------
let g:highlightedyank_highlight_duration = -1			" A negative number makes the highlight persistent.
" Other configs		{{{1
" let g:highlightedyank_highlight_duration = 1000		" Assign a number of time in milliseconds.
" When a new text is yanked or user starts editing, the old highlighting shall be removed
"
" If the highlight is not visible for some reason, you can redefine the HighlightedyankRegion highlight group like:
" highlight HighlightedyankRegion cterm=reverse gui=reverse
" Note that the line should be located AFTER the :colorscheme command execution in your vimrc.	}}}

" Python linter config
" --------------------
let g:flake8_quickfix_height=15		" Height of quickfix window
let g:flake8_show_in_gutter=1		" show signs in gutter
let g:flake8_error_marker='❌'		" set error marker to 'EE'
let g:flake8_warning_marker='W'		" set warning marker to 'WW'

" ALE
" ---
let g:ale_disable_lsp = 1
let g:ale_completion_enabled = 0
let g:ale_sign_error = '❌'
" let g:ale_sign_info = ' i'
" let g:ale_sign_warning = ' W'
" let g:ale_sign_info = '💡'
let g:ale_sign_info = '🔹'
let g:ale_sign_warning = '🔸'

let g:ale_python_flake8_options='--extend-ignore E231,E252,E501'


" Git gutter
" ----------
set signcolumn=yes
let g:gitgutter_set_sign_backgrounds = 1
" hi clear SignColumn		" Included in colorscheme_overrides

" vim-airline
" -----------
set noshowmode
let g:bufferline_echo = 0
let g:bufferline_modified = ' +'
let g:bufferline_solo_highlight = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_symbols.space = "\ua0"
let g:airline_symbols.readonly = '[RO]'
let g:airline_symbols.whitespace = ' '
let g:airline_symbols.notexists = ' ?'
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline#extensions#localsearch#inverted = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#alt_sep = 1
let g:my_airline_sep = '|'
let g:my_airline_sep_raw = '%#__accent_bold#'.g:my_airline_sep.'%#__restore__#'
let g:my_airline_customcurpos_enabled = 0
let g:my_airline_customcurpos_short = 0
function! s:airline_custom()
fun! MyAirlineSeparatorSpacerFunc()	" {{{1
	return g:airline_symbols.space . g:my_airline_sep .g:airline_symbols.space
endfun
fun! MyAirlineSeparatorWrapper(name,side)	" {{{1
	if empty(airline#parts#get(a:name))
		return ''
	endif
	let side = toupper(a:side[0])
	let part_name = 'MySep' . a:name . side
	let condition = get(airline#parts#get(a:name),'condition','')
	if !empty(airline#parts#get(part_name))
		return airline#section#create([part_name])
	endif
	call airline#parts#define_function(part_name,'MyAirlineSeparatorSpacerFunc')
	call airline#parts#define_accent(part_name,'bold')
	if !empty(condition)
		call airline#parts#define_condition(part_name,condition)
	endif
	if side ==# 'R'
		return airline#section#create([a:name,part_name])
	endif
	if side ==# 'L'
		return airline#section#create([part_name, a:name])
	endif
endfun	" }}}
fun! Airline_bufferline_overrides()	"{{{1
	" hi bufferline_selected gui=NONE
	if exists('$NVIM_AIRLINE_MODE_NONBOLD') | execute('hi bufferline_selected gui=NONE') | endif
endfun
call Airline_bufferline_overrides()
fun! AirlineRemoveModeBold()	" {{{1
	let initial_value = airline#section#create_left(['mode'])
	call airline#parts#define_accent('mode', 'none')
	if len(split(g:airline_section_a,initial_value)) == 1
	let g:airline_section_a = airline#section#create_left(['mode']) . split(g:airline_section_a, initial_value)[0]
	else
		let g:airline_section_a = join(split(g:airline_section_a,initial_value),airline#section#create_left(['mode']))
		" See https://learnvimscriptthehardway.stevelosh.com/chapters/27.html#joining
	endif
endfun
if exists('$NVIM_AIRLINE_MODE_NONBOLD') | call AirlineRemoveModeBold() | endif
fun! CustomAirlineCursorPos()	" {{{1
	let g:my_airline_customcurpos_short = get(g:,'my_airline_customcurpos_short', 0)
	if airline#util#winwidth() > 79 || !g:my_airline_customcurpos_short
	return line('.') . ':' . col('.')
	else
	return ':' . col('.')
	endif
endfun
let g:my_airline_customcurpos_enabled = get(g:,'my_airline_customcurpos_enabled',0)
call airline#parts#define_function('CustomCurPos', 'CustomAirlineCursorPos')
call airline#parts#define_condition('CustomCurPos', 'g:my_airline_customcurpos_enabled')
" call airline#parts#define_condition('CustomCurPos', 'mode() =~? "v" || mode() ==# "\<C-V>"')	" }}}
" g:airline_section_x	" {{{1
let g:airline_section_x = airline#section#create_right(['bookmark', 'tagbar', 'vista', 'gutentags', 'omnisharp', 'grepper'])
" i.e. defaults with 'filetype' removed
" g:airline_section_y	{{{1
" let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}%#__accent_bold#%{len(airline#util#prepend(airline#parts#ffenc(),0)) && len(airline#util#wrap(airline#parts#filetype(),0)) ? "  | " : ""}%#__restore__#%{trim(airline#util#prepend(airline#parts#ffenc(),0))}'
let g:airline_section_y = "%{airline#util#wrap(airline#parts#filetype(),0)}%#__accent_bold#%{len(airline#util#prepend(airline#parts#ffenc(),0)) && len(airline#util#wrap(airline#parts#filetype(),0)) ? ' ' : ''}%#__restore__#%{trim(airline#util#prepend(airline#parts#ffenc(),0))}"
" g:airline_section_z	{{{1
" let g:airline_section_z = airline#section#create(['windowswap', 'obsession']) . '%p%% %#__accent_bold#|%#__restore__# %L' . airline#section#create(['CustomCurPos'])
let g:airline_section_z = airline#section#create(['windowswap', 'obsession']) . '%p%% ' .g:my_airline_sep_raw.' %L' . MyAirlineSeparatorWrapper('CustomCurPos','l')
" i.e. default	minus  [ '%p%%'.spc, 'linenr', 'maxlinenr', ':%v' ]
" g:airline_section_warning		{{{1
" let g:airline_section_warning = airline#section#create(['ycm_warning_count',	'syntastic-warn', 'neomake_warning_count', 'ale_warning_count', 'lsp_warning_count', 'nvimlsp_warning_count', 'languageclient_warning_count', 'coc_warning_count']) . trim(airline#extensions#whitespace#check())
" let g:airline_section_warning = join(split(g:airline_section_warning, airline#section#create(['whitespace']))) . trim(airline#extensions#whitespace#check())
" ie default minus 'whitespace', with trimmed whitespace at the end
" }}}
AirlineRefresh
endfun
augroup airline_customization
	au!
	au User AirlineAfterInit ++once call s:airline_custom()
augroup end
nnoremap <silent> <leader>; :call CustomAirlineCursorPosToggler()<CR>
nnoremap <silent> <leader>: :call CustomAirlineCursorPosLengthToggler()<CR>
fun! CustomAirlineCursorPosToggler()	" {{{1
	let g:my_airline_customcurpos_enabled += 1
	let g:my_airline_customcurpos_enabled %= 2
	if !g:my_airline_customcurpos_enabled
		let g:my_airline_customcurpos_short = 0
	endif
endfun	" }}}
fun! CustomAirlineCursorPosLengthToggler()	" {{{1
	let g:my_airline_customcurpos_short+= 1
	let g:my_airline_customcurpos_short%= 2
	if !g:my_airline_customcurpos_enabled
		let g:my_airline_customcurpos_enabled = 1
	endif
endfun	" }}}

" Show non-printable characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" set list


" Deoplete	"{{{
" --------
"let g:deoplete#enable_at_startup = 1
"au InsertEnter * ++once call timer_start(0, {id->execute("call deoplete#custom#option('sources',{ 'python': ['jedi'] })")} )
"au InsertEnter * ++once call timer_start(0, {id->execute("call deoplete#enable()")} )
"call timer_start(0, {id->execute("call deoplete#custom#option({
"			\ 'auto_complete_delay': 100,
"			\ 'sources': { 'python': ['jedi']},
"			\ 'ignore_sources': {'_': ['around']},
"			\ })")})
"	}}}

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
if has('patch-7.4.314')
	set shortmess+=c
endif

" Navigate through suggestions using TAB and Arrows
" ----------------------------------------
inoremap <silent><expr>	<tab>	pumvisible() ? "\<c-n>"			: "\<tab>"
inoremap <silent><expr> <s-tab>	pumvisible() ? "\<c-p>"			: "\<s-tab>"
inoremap <silent><expr> <up>	pumvisible() ? "<c-e><up>"		: "<up>"
inoremap <silent><expr> <down>	pumvisible() ? "<c-e><down>"	: "<down>"
" inoremap <expr><Down>			pumvisible() ? "\<C-n>"			: "\<Down>"
" inoremap <expr><Up>			pumvisible() ? "\<C-p>"			: "\<Up>"

" NCM2
" ----
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a newline.
		inoremap <silent><expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
		augroup enable_ncm2
			au!
			autocmd BufEnter * call timer_start(0, {id->execute("call ncm2#enable_for_buffer()")})
		augroup end
" IMPORTANT: :help Ncm2PopupOpen for more information
		set completeopt=noinsert,menuone,noselect
" Disable syntax hint after completion in python
"	let g:ncm2_jedi#call_sig_hint = 0

" Gabrielana markdown
" -------------------
let g:markdown_enable_insert_mode_mappings = 0
let g:markdown_enable_spell_checking = 1
let g:markdown_enable_mappings = 1

" Indentline
" ----------
let g:indentLine_enabled = 0
let g:indentLine_char = '│'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0
" nnoremap <silent> <C-i> :IndentLinesToggle <CR>

" vim-yoink
" ---------
" Alt+P and Alt+Shift+P
nmap <a-p> <plug>(YoinkPostPasteSwapBack)
nmap <a-s-p> <plug>(YoinkPostPasteSwapForward)
" Do not change cursor position after yanking
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)
" Remap p and P to yoink, but not if macro is being recorded
" nmap <expr> p ((len(reg_recording()) == 0) ? '<plug>(YoinkPaste_p)' : 'p' )
" nmap <expr> P ((len(reg_recording()) == 0) ? '<Plug>(YoinkPaste_P)' : 'P' )
nmap p <plug>(YoinkPaste_p)
nmap P <Plug>(YoinkPaste_P)
let g:yoinkIncludeDeleteOperations = 1
let g:yoinkMoveCursorToEndOfPaste = 1		" ... after pasting
let g:yoinkSwapClampAtEnds = 0				" Cycle thru the list while swapping

" vim-localsearch
" ---------------
" Toggle local search (leader is backlash \, the one beneath Backspace)
" i.e. press \ /
nmap <leader>/ <Plug>localsearch_toggle
call localsearch#Toggle()	" Turn on by default
command! LocalSearch call localsearch#Toggle()


" Workaround for correctly switching colorschemes	" {{{1
" https://github.com/altercation/solarized/issues/102#issuecomment-275269574
" https://github.com/altercation/solarized/issues/102#issuecomment-352329521
" https://opensource.stackexchange.com/questions/2187/how-much-is-substantial-portion-in-mit-licence/2188#2188
" -------------------------------------------------------------------------------------------------------------------------
if !exists('s:known_links')
	let s:known_links = {}
endif

function! s:Find_links() " {{{2
	" Find and remember links between highlighting groups.
	redir => listing
	try
		silent highlight
	finally
		redir END
	endtry
	for line in split(listing, "\n")
		let tokens = split(line)
		" We're looking for lines like "String xxx links to Constant" in the
		" output of the :highlight command.
		if len(tokens) ==# 5 && tokens[1] ==# 'xxx' && tokens[2] ==# 'links' && tokens[3] ==# 'to'
			let fromgroup = tokens[0]
			let togroup = tokens[4]
			let s:known_links[fromgroup] = togroup
		endif
	endfor
endfunction

function! s:Restore_links() " {{{2
	" Restore broken links between highlighting groups.
	redir => listing
	try
		silent highlight
	finally
		redir END
	endtry
	let num_restored = 0
	for line in split(listing, "\n")
		let tokens = split(line)
		" We're looking for lines like "String xxx cleared" in the
		" output of the :highlight command.
		if len(tokens) ==# 3 && tokens[1] ==# 'xxx' && tokens[2] ==# 'cleared'
			let fromgroup = tokens[0]
			let togroup = get(s:known_links, fromgroup, '')
			if !empty(togroup)
				execute 'hi link' fromgroup togroup
				let num_restored += 1
			endif
		endif
	endfor
endfunction	" }}}

function! s:AccurateColorscheme(colo_name)
	call <SID>Find_links()
	exec 'colorscheme ' a:colo_name
	call <SID>Restore_links()
endfunction

command! -nargs=1 -complete=color MyColorscheme call <SID>AccurateColorscheme(<q-args>)
" --------------------------------------------------------------------------------------------------------------	" }}}

" vim-iawriter
" ------------
" let g:iawriter_no_nospell = 0
" augroup Iawriter_autocmds
"	au!
"	au User IawriterPostPostEnter if !g:iawriter_no_nospell | set nospell | endif
"	au User IawriterPostLeave if &filetype ==# 'markdown' | set spell | endif
" augroup end
let g:iawriter_force_defaults = 1

" vim-illuminate
" --------------
augroup illuminate
	au!
	au ColorScheme * exec 'hi illuminatedWord  guibg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui')
	au ColorScheme * silent! exec 'hi illuminatedWord  ctermbg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'cterm')
	" au ColorScheme * exec 'hi illuminatedWord  gui=bold'
augroup end
exec 'hi illuminatedWord  guibg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui')
silent! exec 'hi illuminatedWord  ctermbg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'cterm')
" exec 'hi illuminatedWord  gui=bold'
let g:Illuminate_ftHighlightGroups = {
			\ '*:blacklist': ['Comment', 'String']
			\ }
let g:Illuminate_ftblacklist = ['nerdtree', 'CHADTree', 'markdown', 'help', 'vim-plug', '']
let g:Illuminate_delay = 250				" Time in milliseconds (default 250)
let g:Illuminate_highlightUnderCursor = 1	" Highlight the word under cursor (default: 1)
let g:Illuminate_insert_mode_highlight = 0	" Highlight in Insert mode too

" Trying to implement my own finding function
" -------------------------------------------
function! FindAll()
	call inputsave()
	let p = input('Enter pattern: ')
	call inputrestore()
	if get(g:,'my_findall_use_quickfix', 0)
		silent execute 'vimgrep "'.p.'" '.expand('%:p').' |copen'
	else " use location list
		silent execute 'lvimgrep "'.p.'" '.expand('%:p').' |lopen'
	endif
endfunction

" Automatically close if QuickFix is the only window
" -------------------------------------------------
aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END

" ShowTrailingWhitespace
" ----------------------
command! -bar ShowTrailingWhitespaceOn			call ShowTrailingWhitespace#Set(1,1)
command! -bar ShowTrailingWhitespaceOff			call ShowTrailingWhitespace#Set(0,1)
command! -bar ShowTrailingWhitespaceBufferOn	call ShowTrailingWhitespace#Set(1,0)
command! -bar ShowTrailingWhitespaceBufferOff	call ShowTrailingWhitespace#Set(0,0)
command! -bar ShowTrailingWhitespaceBufferReset call ShowTrailingWhitespace#Reset()

" vim-doge
" --------
" let g:doge_doc_standard_python = 'google'
let g:doge_parsers=['python']

" My SudoWrite
" -----------
func! MySudoRootWriter()
	if len(expand('%')) == 0
		echohl ErrorMsg
		echom 'No file name!'
		echohl None
		return
	endif
	if !&modified | return | endif
	let l:password = inputsecret('Enter password: ')
	echo
	redraw!
	silent! execute('!echo "' . l:password . '" | sudo -S -v')
	if v:shell_error != 0
		echohl ErrorMsg
		echom 'Wrong password'
		echohl None
		return
	endif
	let l:buftype = &buftype
	set buftype=acwrite
	let l:autoread = &autoread
	set noautoread
	execute('silent! w !echo "' . l:password . '\n$(cat -)" | sudo -S tee > /dev/null %')
	execute('set buftype=' . l:buftype)
	if l:autoread | set autoread | endif
	set nomodified
	" e!
	echo
	redraw!
endfun
com! SudoWrite call MySudoRootWriter()


" vim-lsp
" -------
let g:Illuminate_ftblacklist += ['markdown.lsp-hover']

" let g:lsp_diagnostics_float_cursor = 1
" let g:lsp_virtual_text_enabled = 0
let g:lsp_virtual_text_prefix = '     '
function! s:on_lsp_buffer_enabled() abort
	" setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer><silent> gd <plug>(lsp-definition)
	" nmap <buffer><silent> gr <plug>(lsp-references)
	" nmap <buffer><silent> gi <plug>(lsp-implementation)
	" nmap <buffer><silent> gt <plug>(lsp-type-definition)
	nmap <buffer><silent> <leader>rn <plug>(lsp-rename)
	" nmap <buffer><silent> [g <Plug>(lsp-previous-diagnostic)
	" nmap <buffer><silent> ]g <Plug>(lsp-next-diagnostic)
	nmap <buffer><silent> K <plug>(lsp-hover)

	" refer to doc to add more commands
endfunction

augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" Python

" if executable('pyls')
" 	" pip install python-language-server
" 	augroup vim_lsp_pyls
" 	au!
" 	au User lsp_setup call lsp#register_server({
" 		\ 'name': 'pyls',
" 		\ 'cmd': {server_info->['pyls']},
" 		\ 'allowlist': ['python'],
" 		\ 'config': {'configurationSources': ['flake8']},
" 		\ 'workspace_config': {'pyls': {'configurationSources': ['flake8'] }}
" 		\ })
" 	augroup end
" endif
let g:Illuminate_ftblacklist += ['python']
" let g:lsp_settings = {
" \   'pyls': {
" \     'workspace_config': {
" \       'pyls': {
" \         'configurationSources': ['flake8']
" \       }
" \     }
" \   },
" \}


" vim-sneak
" ---------
fun! SneakOmapOverride()
	for mapping in getcompletion('ounmap z.','cmdline')
		execute('ounmap ' . mapping)
	endfor
	omap <silent> z <Plug>Sneak_s
endfun
augroup SneakOmapOverride
	au BufWinEnter * ++once call SneakOmapOverride()
augroup end

" vim-dadbod
" ----------
" First create user in MariaDB -
" 	create user 'dadbod-user'@'localhost';
" 	revoke all on *.* from 'dadbod-user'@'localhost';
" 	grant usage,select on *.* to 'dadbod-user'@'localhost';
"
" Then define "g:db"
" 	let g:db = 'mysql://dadbod-user@localhost/database'
" Set completefunc
" 	set completefunc=vim_dadbod_completion#omni
" Now, you can trigger completions (of tables and columns only)
" by pressing <C-x><C-u>

" Not ready yet, was just testing, but was unsuccessful
"	 au User Ncm2Plugin call ncm2#register_source({
" 			\ 'name' : 'dadbod-omifunc',
" 			\ 'priority': 9,
" 			\ 'subscope_enable': 1,
" 			\ 'scope': ['sql'],
" 			\ 'mark': '',
" 			\ 'word_pattern': '\w\ ',
" 			\ 'complete_pattern': '',
" 			\ 'on_complete': ['ncm2#on_complete#delay', 180,
" 					\'ncm2#on_complete#omni', 'vim_dadbod_completion#omni'],
" 			\ })


" treesitter
" ----------
" lua << EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "python", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"   },
" }
" EOF

" transparent background
" ----------------------
let g:my_transparent_background = get(g:, 'my_transparent_background', 0)
if !exists('$MY_NVIM_BG')
	let g:my_transparent_background = 1
endif
if g:my_transparent_background
	augroup my_transparent_background
		au!
		au ColorScheme * hi Normal guibg=none ctermbg=none
		au ColorScheme * hi CursorLineNr guibg=none ctermbg=none
		au ColorScheme * hi LineNr guibg=none ctermbg=none
		au ColorScheme * set nocursorline
		au ColorScheme * hi clear ALEWarningSign | hi link ALEWarningSign NONE | hi clear ALEErrorSign | hi link ALEErrorSign NONE | hi clear ALEInfoSign | hi link ALEInfoSign NONE
	augroup end
hi Normal guibg=none ctermbg=none
hi CursorLineNr guibg=none ctermbg=none
hi LineNr guibg=none ctermbg=none
set nocursorline
hi clear ALEWarningSign | hi link ALEWarningSign NONE | hi clear ALEErrorSign | hi link ALEErrorSign NONE | hi clear ALEInfoSign | hi link ALEInfoSign NONE
endif
