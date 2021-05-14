

" Use color syntax highlighting.
syntax enable
let mapleader = ","
set encoding=UTF-8
set updatetime=1000

"Plugins for Vim-Plug

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'joshhartigan/vim-reddit'

Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/Vimchant'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'terryma/vim-multiple-cursors'
"Latex funness
Plug 'https://github.com/vim-latex/vim-latex'

Plug 'aserebryakov/vim-todo-lists'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf.vim'
"Plug 'majutsushi/tagbar'

"Async Shell commands
Plug 'skywind3000/asyncrun.vim'

Plug 'moll/vim-node', {'for' : 'javascript'}

Plug 'sjl/badwolf'

Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

Plug 'mhinz/vim-startify'

Plug 'https://github.com/sbdchd/neoformat'

Plug 'godlygeek/tabular'

Plug 'junegunn/vim-easy-align', { 'for': [ 'markdown', 'tex', 'python', 'ocaml', 'perl' ] }

"Writing
Plug 'junegunn/limelight.vim', { 'for': [ 'markdown', 'tex' ] }
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'tex'] }
Plug 'reedes/vim-pencil', { 'for': [ 'markdown', 'tex' ] }
Plug 'dbmrq/vim-ditto', { 'for': [ 'markdown', 'tex' ] }
Plug 'reedes/vim-wordy', { 'for': ['markdown', 'tex'] }
Plug 'reedes/vim-litecorrect', { 'for': ['markdown', 'tex'] }
"Plug 'reedes/vim-wheel', { 'for': ['markdown', 'tex'] }

Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'rhysd/vim-gfm-syntax', { 'for': 'markdown' }


Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'

Plug 'Shougo/deoplete.nvim' , { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/copy/deoplete-ocaml', {'for' : 'ocaml'}
Plug 'deathlyfrantic/deoplete-spell', {'for' : [ 'tex', 'markdown' ]}
Plug 'https://github.com/w0rp/ale.git', {'for' : 'ocaml'}
Plug 'roxma/nvim-yarp'
"Plug 'vim-syntastic/syntastic', {'for' : 'ocaml'}

"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ 'for' : [ 'c',  'python', 'javascript', 'cpp']
    "\ }
"Plug 'reasonml-editor/vim-reason-plus', { 'for' : 'ocaml'}
Plug 'deoplete-plugins/deoplete-jedi'

Plug 'Olical/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }

" You'll need vim-sexp too for selecting forms.
Plug 'guns/vim-sexp'

" And while you're here, tpope's bindings make vim-sexp a little nicer to use.
Plug 'tpope/vim-sexp-mappings-for-regular-people'

"Parenthesis
Plug 'luochen1990/rainbow', {'for': 'ocaml'}
Plug 'eraserhd/parinfer-rust', {'for' : 'scheme'}

Plug 'ryanoasis/vim-devicons'


Plug 'mbbill/undotree'
Plug 'vim-scripts/c.vim', {'for' : 'c'}

call plug#end()
filetype plugin on "needed for vim plugin

set hidden
set undofile   " Maintain undo history between sessions

set undodir=~/.vim/undo/

"Vimchant spellcheck
nmap <F7> <Plug>VimchantSpellCheckSwitch
nmap <F8> <Plug>VimchantChangeLanguage


"Undotree
nnoremap <F5> :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle=1
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 1
endif
" auto open diff window
if !exists('g:undotree_DiffAutoOpen')
    let g:undotree_DiffAutoOpen = 1
endif
" Highlight changed text
if !exists('g:undotree_HighlightChangedText')
    let g:undotree_HighlightChangedText = 1
endif
" Highlight changed text using signs in the gutter
if !exists('g:undotree_HighlightChangedWithSign')
    let g:undotree_HighlightChangedWithSign = 1
endif

"S


" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set
au BufRead,BufNewFile *.prt set filetype=perl

"Latex config
let g:tex_flavor='latex'
let g:Tex_IgnoredWarnings=
      \"Underfull\n".
      \"Overfull\n".
      \"specifier changed to\ng:AutoPairsShortcutToggle".
      \"You have requested\n".
      \"Missing number, treated as zero.\n".
      \"There were undefined references\n"
      \"Citation %.%# undefined\n"
      \"Package biblatex Warning: '\mkdatezeros' is deprecated. Please use '\mkyearzeros', '\mkmonthzeros' or '\mkdayzeros' as appropriate.  Falling back to '\mkmonthzeros'."
map \gq ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>gq//-1<CR>
omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='zathura'
let g:Tex_CompileRule_pdf = "pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style --shell-escape $*"
autocmd Filetype tex        nnoremap <leader>m <esc>:w<cr>:!make<cr>

"Markdown Config
autocmd FileType markdown         nnoremap <localleader>m  <esc>:AsyncRun pandoc % -o %:r.pdf --from markdown --template eisvogel --listings<CR>



"Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}
"if !exists('g:deoplete#omni_patterns')
"let g:deoplete#omni#input_patterns = {}
"endif
"let g:deoplete#omni#input_patterns.ocaml = '[^. *\t]\.\w*|\s\w*|#'

"FZF config
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)



"Keybindings for Vim multiple cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'



"Keybindings
noremap <S-tab> :TagbarToggle<cr>

"BufOnly plugin

nmap <leader>ba :BufOnly <CR>


inoremap <f1> <esc>:bp<cr>
nnoremap <f1> :bp<cr>
inoremap <f2> <esc>:bn<cr>
nnoremap <f2> :bn<cr>
"nnoremap <leader><leader> :w<cr>
"inoremap <leader><leader> <esc>:w<cr>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>


"Help enhancement
command -nargs=? Help help <args> | only

"Man enhancement
command -nargs=? Mann Man <args> | only



"Makes Cursor straight line
"set guicursor=i:ver25-iCursor
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
"Vim Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowIgnoredStatus = 1

"Vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#languageclient#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'




"tags
"set tags=~/.vim/tags/java

"tagbar
noremap <S-tab> :TagbarToggle<cr>

" Language Client
"let g:LanguageClient_serverCommands = {
            "\'python': ['/usr/bin/pyls'],
            "\'ocaml': ['/home/ian/.nvm/versions/node/v10.10.0/bin/ocaml-language-server', '--stdio'],
            "\ 'c': ['ccls', '--log-file=/tmp/cc.log'],
            "\ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
            "\ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
            "\ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
            "\ 'javascript': ['/home/ian/.nvm/versions/node/v10.10.0/bin/node', '/home/ian/build/javascript-typescript-langserver/lib/language-server-stdio'],
            "\ 'rust': ['rls']
            "\ }
"
"let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
"let g:LanguageClient_settingsPath = '/home/ian/.config/nvim/settings.json'
"" https://github.com/autozimu/LanguageClient-neovim/issues/379 LSP snippet is not supported
"let g:LanguageClient_hasSnippetSupport = 0
""autocmd FileType ocaml au VimEnter * LanguageClientStart
""
""
"let g:LanguageClient_rootMarkers = ['.root', 'project.*', '.ccls-root']
"nn <silent> <M-j> :call LanguageClient#textDocument_definition()<cr>
"nn <silent> <M-h> :call LanguageClient#textDocument_documentHighlight()<cr>
"nn <silent> <M-,> :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<cr>
"nn <silent> K :call LanguageClient#textDocument_hover()<cr>
"augroup LanguageClient_config
  "au!
  "au BufEnter * let b:Plugin_LanguageClient_started = 0
  "au User LanguageClientStarted setl signcolumn=yes
  "au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
  "au User LanguageClientStopped setl signcolumn=auto
  "au User LanguageClientStopped let b:Plugin_LanguageClient_stopped = 0
  "au CursorMoved * if b:Plugin_LanguageClient_started | sil call LanguageClient#textDocument_documentHighlight() | endif
"augroup END
"
"nn <silent> xh :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'L'})<cr>
"nn <silent> xj :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'D'})<cr>
"nn <silent> xk :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'U'})<cr>
"nn <silent> xl :call LanguageClient#findLocations({'method':'$ccls/navigate','direction':'R'})<cr>
"
"" bases
"nn <silent> xb :call LanguageClient#findLocations({'method':'$ccls/inheritance'})<cr>
"" bases of up to 3 levels
"nn <silent> xB :call LanguageClient#findLocations({'method':'$ccls/inheritance','levels':3})<cr>
"" derived
"nn <silent> xd :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true})<cr>
"" derived of up to 3 levels
"nn <silent> xD :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true,'levels':3})<cr>
"
"" caller
"nn <silent> xc :call LanguageClient#findLocations({'method':'$ccls/call'})<cr>
"" callee
"nn <silent> xC :call LanguageClient#findLocations({'method':'$ccls/call','callee':v:true})<cr>

"" $ccls/member
"" nested classes / types in a namespace
"nn <silent> xs :call LanguageClient#findLocations({'method':'$ccls/member','kind':2})<cr>
"" member functions / functions in a namespace
"nn <silent> xf :call LanguageClient#findLocations({'method':'$ccls/member','kind':3})<cr>
"" member variables / variables in a namespace
"nn <silent> xm :call LanguageClient#findLocations({'method':'$ccls/member'})<cr>
"
"nn xx x

"fu! C_init()
  "setl formatexpr=LanguageClient#textDocument_rangeFormatting()
"endf
"au FileType c,cpp,cuda,objc :call C_init()


" Vim exchange stuff
let g:exchange_no_mappings=1
nmap cx <Plug>(Exchange)
vmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)

"Lisp Plugin Config
" Starts the REPL.
autocmd FileType scheme nnoremap <buffer> <localleader>rc :SchemeConnect<cr>

" Evaluates the outer most / top level form and jumps the cursor back to where it was.
autocmd FileType scheme nnoremap <buffer> <localleader>re :normal mscpaF<cr>`s

" Evaluates the entire file.
autocmd FileType scheme nnoremap <buffer> <localleader>rf :normal msggcpG<cr>`s

" Clipboard implementation
vnoremap y "+y
vnoremap p "+p

"Needed for Ocp-indent
set rtp^="/home/ian/.opam/system/share/ocp-indent/vim"

"Rainbow Parenthesis
let g:rainbow_conf = {
	\	'separately': {
	\		'ocaml': {
	\			'parentheses': ['start=/(\*\@!/ end=/)/ fold'],
	\		}
	\	}
	\}
let g:rainbow_active=1

" Merlin stuff
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:merlin_split_method = "never"
let g:merlin_completion_arg_type = "always"
let g:merlin_textobject_grow   = 'm'
let g:merlin_textobject_shrink = 'M'
let g:merlin_type_history_height = 5
let g:merlin_type_history_auto_open = 0
let g:merlin_ignore_warnings = "true"
autocmd FileType ocaml nmap <silent><Leader>ds  :MerlinDestruct<CR>
autocmd FileType ocaml nmap <Leader>t :MerlinTypeOf<CR>
autocmd FileType ocaml vnoremap <Leader>t :MerlinTypeOfSel<CR>
autocmd FileType ocaml nmap <silent><Leader>n :MerlinGrowEnclosing<CR>
autocmd FileType ocaml nmap <silent><Leader>p :MerlinShrinkEnclosing<CR>
"nnoremap <silent><esc> :noh<CR><Esc>
autocmd FileType ocaml nnoremap <silent><esc> :noh<CR>:MerlinClearEnclosing<CR><Esc>
"Syntastic
"let g:syntastic_ocaml_checkers = ['merlin']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
" Deoplete-merlin
let g:deoplete#enable_at_startup = 1

" this is the default, make sure it is not set to "omnifunc" somewhere else in your vimrc
let g:deoplete#complete_method = "complete"

" other completion sources suggested to disable
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around', 'member', 'tag']

" no delay before completion
let g:deoplete#auto_complete_delay = 0

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1
autocmd FileType python let b:autoformat_autoindent=1
autocmd FileType python let b:autoformat_retab=1
autocmd FileType python let b:autoformat_remove_trailing_spaces=1
autocmd FileType c let b:autoformat_autoindent=1
autocmd FileType c let b:autoformat_retab=0
autocmd FileType c let b:autoformat_remove_trailing_spaces=1


"let g:formatdef_my_custom_ocaml = '"ocp-indent"'
"let g:formatters_ocaml = ['my_custom_ocaml']
"
"
"
"let b:formatdef_custom_c='"astyle -A2Efk1t8pUxbxC80xexjW3 style=ansi -nq "'
"let b:formatters_c = ['custom_c']
"
"let b:formatdef_custom_cpp='"clang-format -style=Google"'
"let b:formatters_cpp = ['custom_cpp']


"Formatting - Autoformat plugin
noremap <F3> :Neoformat<CR>
"au BufWrite * :Autoformat
let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': 'ocamlformat',
            \ 'args': ['--profile=compact']
            \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']


let g:neoformat_cpp_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style=Google']
            \ }

let g:neoformat_enabled_cpp = ['clangformat']
"Nerd comment plugin options

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

imap <C-c> <plug>NERDCommenterInsert

"Ditto
"
nmap <leader>di <Plug>ToggleDitto

"Goyo
function! s:goyo_enter()
    call litecorrect#init()
	Limelight
	PencilSoft
	setlocal spell
endfunction

function! s:goyo_leave()
	Limelight!
	PencilOff
	setlocal nospell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
autocmd BufRead *.md PencilSoft
autocmd BufRead * normal zR
autocmd BufWritePre * :%s/\s\+$//e

au FileType tex setlocal nocursorline
"au FileType tex :NoMatchParen
au FileType tex setlocal nornu

let g:pencil#cursorwrap = 0     " 0=disable, 1=enable (def)

"CtrlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"Wheel
"let g:wheel#map#up   = '<c-k>'
"let g:wheel#map#down = '<c-j>'

"vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Options.
set clipboard=unnamedplus
"Disable autowrap in vim
set tw=0
set textwidth=0 wrapmargin=0
"set spell
set relativenumber
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set smartcase
set laststatus=2
set relativenumber
set foldmethod=syntax
set foldnestmax=2
set number
set autoindent
set backspace=2     " Allows insert-mode backspace to work as one expects
set cindent
set cinkeys=0{,0},:,!^F,o,O,e   " See "cinkeys"; this stops "#" from indenting
set fileformat=unix " No crazy CR/LF
"set listchars=tab:\ \ ,trail:·  If you do :set list", shows trailing spaces
set mouse=      " I don't like the mouse in VIM
set nohlsearch      " Don't highlight search terms
set nojoinspaces    " One space after a "." rather than 2
set ruler       " Show the line position at the bottom of the window
set scrolloff=1     " Minimum lines between cursor and window edge
set showcmd     " Show partially typed commands
set showmatch       " Show parentheses matching
set showmode
set nofoldenable    " disable folding
set smartindent     " Indent settings (really only the cindent matters)
"set viminfo=/home/ian/.local/share/nvim/shada/main.shada
set writebackup     " Write temporary backup files in case we crash

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark




set guifont=-Schumacher-Clean-Medium-R-Normal--16-160-75-75-C-80-ISO646.1991-IRV

map <Del> <BS>
imap <Del> <BS>

vnoremap < <gv
vnoremap > >gv
nnoremap H gT
nnoremap L gt

" My file types. ufNewFile,BufRead *.cls set syn=tex
au BufNewFile,BufRead *.R set syn=r
au BufNewFile,BufRead *.R syn sync fromstart

" On plain text files, no keyword chars, because we don't want tab completion
au BufNewFile,BufRead *.txt set iskeyword=

" NOTE: Sweave syntax is my own file...
au BufNewFile,BufRead *.Snw set syn=sweave

" On HTML files don't use indenting.
au BufNewFile,BufRead *.html set noautoindent nosmartindent nocindent




" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
"let s:opam_share_dir = system("opam config var share")
"let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

"let s:opam_configuration = {}
"
"function! OpamConfOcpIndent()
  "execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
"endfunction
"let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')
"
"function! OpamConfOcpIndex()
  "execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
"endfunction
"let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')
"
""function! OpamConfMerlin()
  ""let l:dir = s:opam_share_dir . "/merlin/vim"
  ""execute "set rtp+=" . l:dir
""endfunction
""let s:opam_configuration['merlin'] = function('OpamConfMerlin')
"
"let s:opam_packages = ["ocp-indent", "ocp-index"]
"let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
"let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
"for tool in s:opam_packages
  "" Respect package order (merlin should be after ocp-index)
  "if count(s:opam_available_tools, tool) > 0
    "call s:opam_configuration[tool]()
  "endif
"endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 36c66047ddab05c15ab18b407bbc950a ## you can edit, but keep this line
"if count(s:opam_available_tools,"ocp-indent") == 0
"  source "/home/ian/.opam/system/share/ocp-indent/vim/indent/ocaml.vim"
"endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line

"Badwolf plugin
colorscheme badwolf


