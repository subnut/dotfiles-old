" vim: fdm=marker noet ts=4
scriptencoding utf-8

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
Plug 'ncm2/float-preview.nvim'

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
Plug 'subnut/ncm2-github-emoji', { 'do': 'python install.py' }
" -----------------------------------------------------------------------

" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'reedes/vim-colors-pencil'
Plug 'sonph/onehalf', {'rtp': 'vim'}

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'


" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
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
Plug 'subnut/vim-airline', { 'on': [] }

" Python
" -------
Plug 'nvie/vim-flake8', { 'for': 'python' }					" Python linter
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }	" Python PEP8 autoindent
Plug 'kalekundert/vim-coiled-snake', { 'for': 'python' }	" Python folding
Plug 'dense-analysis/ale'									" Auto-linter
Plug 'psf/black', { 'branch': 'stable', 'on': [] }			" Auto-formatter
Plug 'Yggdroot/indentLine'

" Misc
" ----
Plug 'reedes/vim-pencil'
Plug 'majutsushi/tagbar'
Plug 'Shougo/echodoc.vim'					" Echo function usage
Plug 'alok/notational-fzf-vim'
Plug 'mbbill/undotree'
Plug 'simnalamburt/vim-mundo'
let g:mundo_preview_bottom = 1
Plug 'airblade/vim-rooter'					" Change root dir
Plug 'airblade/vim-gitgutter'				" Git diff
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'					" (c)oe(rc)e to case-change
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'					" gc<motion> = toggle comment
Plug 'svermeulen/vim-yoink'					" Clipboard
Plug 'Konfekt/FastFold'						" Better folding
Plug 'inkarkat/vim-ShowTrailingWhitespace'	" Trailing whitespace
Plug 'psliwka/vim-smoothie'					" Smooth-scroll
Plug 'mox-mox/vim-localsearch'
Plug 'mtth/scratch.vim'
Plug 'AndrewRadev/bufferize.vim'
Plug 'sheerun/vim-polyglot'					" Polyglot => one who knows many languages
Plug 'norcalli/nvim-colorizer.lua'			" :ColorizerAttachToBuffer
Plug 'subnut/vim-iawriter'
Plug 'kkoomen/vim-doge'						" (DO)cumentation (GE)nerator
let g:doge_doc_standard_python = 'google'
Plug 'RRethy/vim-illuminate'
Plug 'justinmk/vim-sneak'					" s<char><char>
Plug 'romainl/vim-cool'						" Remove search highlight automatically

" Vanity
" ------
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
augroup end
" hi Comment gui=italic
hi clear SignColumn
hi CursorLine gui=underline
call s:kitty_term_custom()
set guicursor=n-v-c-sm:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr-o:hor20-Cursor/lCursor
hi clear ALEWarningSign
hi clear ALEErrorSign

" Get the higlight group of the character under cursor
" ----------------------------------------------------
fun Get_hi_group()
	echo synIDattr(synID(line('.'), col('.'), 1), 'name')
endfun
command! GetHiGroup call Get_hi_group()

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
set number relativenumber
" nnoremap <silent> <C-n> :set number!<CR>
" nnoremap <silent> <C-A-n> :set relativenumber!<CR>
nnoremap <silent> gB :bprev<CR>
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> <C-g> :Goyo<CR>
nnoremap <silent> <C-l> :set list!<CR>
nnoremap <silent> <C-n> :call ToggleLineNrCustom()<CR>
nnoremap <silent> <C-A-n> :call ToggleLineNrCustomLocal()<CR>
" nnoremap <silent> <C-N> :bnext<CR>
" nnoremap <silent> <C-P> :bprev<CR>

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
	au BufEnter,FileType * if &ft ==# 'markdown' | execute("inoremap <silent><buffer><expr> ` ((col('.') >= col('$') - 1) ? '``<C-o>i' : '``<C-o>h')") | endif
	au BufEnter,FileType * if &ft ==# 'markdown' | execute("inoremap <buffer><silent> ``` ```<Enter>```<C-o>k<C-o>A") | endif
	au BufEnter,FileType * if &ft ==# 'html' | execute("imap <buffer><silent><expr> <CR> ((getline('.')[col('.') - 2] == '<') ? '/' : ((getline('.')[col('.') - 1] == '>') ? '<C-o>A<CR>' : '<CR>'))") | endif
	au BufEnter,FileType * if &ft ==# 'markdown' | execute("imap <buffer><silent><expr> <CR> ((getline('.')[col('.') - 2] == '<') ? '/' : ((getline('.')[col('.') - 1] == '>') ? '<C-o>A<CR>' : '<CR>'))") | endif
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
let g:ale_python_flake8_options='--extend-ignore E231,E252,E501'

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
let g:bufferline_solo_highlight = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols.readonly = '[RO]'
let g:airline_symbols.whitespace = ' '
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline#extensions#localsearch#inverted = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#alt_sep = 1
function! s:airline_custom_sections()
call airline#parts#define_accent('mode', 'none')
fun! CustomAirlineCursorPos()	" {{{1
	return line('.') . ':' . col('.') . ' | '
endfun
call airline#parts#define_function('CustomCurPos', 'CustomAirlineCursorPos')
call airline#parts#define_condition('CustomCurPos', 'mode() =~? "v"')	" }}}
" g:airline_section_x	" {{{1
let g:airline_section_x = airline#section#create_right(['bookmark', 'tagbar', 'vista', 'gutentags', 'omnisharp', 'grepper'])
" i.e. defaults with 'filetype' removed
" g:airline_section_y	{{{1
" let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}%#__accent_bold#%{len(airline#util#prepend(airline#parts#ffenc(),0)) && len(airline#util#wrap(airline#parts#filetype(),0)) ? "  | " : ""}%#__restore__#%{trim(airline#util#prepend(airline#parts#ffenc(),0))}'
let g:airline_section_y = "%{airline#util#wrap(airline#parts#filetype(),0)}%#__accent_bold#%{len(airline#util#prepend(airline#parts#ffenc(),0)) && len(airline#util#wrap(airline#parts#filetype(),0)) ? ' ' : ''}%#__restore__#%{trim(airline#util#prepend(airline#parts#ffenc(),0))}"
" g:airline_section_z	{{{1
let g:airline_section_z = airline#section#create(['windowswap', 'obsession', 'CustomCurPos']) . '%p%%%#__accent_bold# | %#__restore__#%L% '
" i.e. default  minus  [ '%p%%'.spc, 'linenr', 'maxlinenr', ':%v' ]
" g:airline_section_warning		{{{1
let g:airline_section_warning = airline#section#create(['ycm_warning_count',  'syntastic-warn', 'neomake_warning_count', 'ale_warning_count', 'lsp_warning_count', 'nvimlsp_warning_count', 'languageclient_warning_count', 'coc_warning_count']) . trim(airline#extensions#whitespace#check())
" ie default minus 'whitespace', with trimmed whitespace at the end
" }}}
AirlineRefresh!
endfun
augroup airline_customization
	au!
	au User AirlineAfterInit ++once call s:airline_custom_sections()
augroup end

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
inoremap <silent><expr><tab>	pumvisible() ? "\<c-n>"			: "\<tab>"
inoremap <silent><expr><s-tab>	pumvisible() ? "\<c-p>"			: "\<s-tab>"
inoremap <expr> <up>			pumvisible() ? "<c-e><up>"		: "<up>"
inoremap <expr> <down>			pumvisible() ? "<c-e><down>"	: "<down>"
" inoremap <expr><Down>			pumvisible() ? "\<C-n>"			: "\<Down>"
" inoremap <expr><Up>			pumvisible() ? "\<C-p>"			: "\<Up>"

" NCM2
" ----
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a newline.
		inoremap <expr><CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
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
nnoremap <silent> <C-i> :IndentLinesToggle <CR>

" vim-yoink
" ---------
" Alt+P and Alt+Shift+P
nmap <a-p> <plug>(YoinkPostPasteSwapBack)
nmap <a-s-p> <plug>(YoinkPostPasteSwapForward)
" Do not change cursor position after yanking
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)
" Remap p and P to yoink, but not if macro is being recorded
nmap <expr> p ((len(reg_recording()) == 0) ? '<plug>(YoinkPaste_p)' :  'p')
nmap <expr> P ((len(reg_recording()) == 0) ? '<Plug>(YoinkPaste_P)' : 'P' )
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
let g:iawriter_no_nospell = 0
augroup Iawriter_autocmds
	au!
	au User IawriterPostPostEnter if !g:iawriter_no_nospell | set nospell | endif
	au User IawriterPostLeave if &filetype ==# 'markdown' | set spell | endif
augroup end
let g:iawriter_force_defaults = 1

" vim-illuminate
" --------------
exec 'hi illuminatedWord ' .
			\ ' guibg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'gui') .
			\ ' ctermbg=' . synIDattr(synIDtrans(hlID('CursorLine')), 'bg', 'cterm') .
			\ ' gui=bold'
let g:Illuminate_ftHighlightGroups = {
			\ '*:blacklist': ['Comment', 'String']
			\ }
let g:Illuminate_ftblacklist = ['nerdtree', 'markdown', 'help']
let g:Illuminate_delay = 250				" Time in milliseconds (default 250)
let g:Illuminate_highlightUnderCursor = 1	" Highlight the word under cursor (default: 1)
let g:Illuminate_insert_mode_highlight = 0	" Highlight in Insert mode too

" Trying to implement my own finding function
" -------------------------------------------
function! FindAll()
	call inputsave()
	let p = input('Enter pattern: ')
	call inputrestore()
	silent execute 'lvimgrep "'.p.'" % |lopen'
endfunction

" Automatically close if QuickFix is the only window
" -------------------------------------------------
aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END
