" Use color syntax highlighting.
syntax enable
let mapleader = ","
set encoding=UTF-8


"Plugins for Vim-Plug

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'https://github.com/altercation/vim-colors-solarized'

"Latex funness
Plug 'https://github.com/vim-latex/vim-latex'


Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

Plug 'moll/vim-node', {'for' : 'javascript'}

Plug 'sjl/badwolf'

Plug 'tpope/vim-fugitive'

Plug 'mhinz/vim-startify'


Plug 'Chiel92/vim-autoformat'

Plug 'godlygeek/tabular'

Plug 'junegunn/vim-easy-align', { 'for': [ 'markdown', 'tex', 'python', 'ocaml' ] }

Plug 'junegunn/limelight.vim', { 'for': [ 'markdown', 'tex' ] }
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'tex'] }
Plug 'reedes/vim-pencil', { 'for': [ 'markdown', 'tex' ] }
Plug 'reedes/vim-wordy', { 'for': ['markdown', 'tex'] }
Plug 'reedes/vim-litecorrect', { 'for': ['markdown', 'tex'] }
"Plug 'reedes/vim-wheel', { 'for': ['markdown', 'tex'] }

Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'rhysd/vim-gfm-syntax', { 'for': 'markdown' }


Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'

Plug 'Shougo/deoplete.nvim' , { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ 'for' : [ 'ocaml', 'c', 'python', 'javascript' ]
    \ }
Plug 'reasonml-editor/vim-reason-plus', { 'for' : 'ocaml'}
Plug 'zchee/deoplete-jedi'

Plug 'Olical/vim-scheme', { 'for': 'scheme', 'on': 'SchemeConnect' }

" You'll need vim-sexp too for selecting forms.
Plug 'guns/vim-sexp'

" And while you're here, tpope's bindings make vim-sexp a little nicer to use.
Plug 'tpope/vim-sexp-mappings-for-regular-people'

"Parenthesis
Plug 'kien/rainbow_parentheses.vim'
Plug 'bhurlow/vim-parinfer'

Plug 'ryanoasis/vim-devicons'


Plug 'mbbill/undotree'
Plug 'vim-scripts/c.vim', {'for' : 'c'}

call plug#end()
filetype plugin on "needed for vim plugin

set hidden
set undofile   " Maintain undo history between sessions

set undodir=~/.vim/undo/

"Undotree
nnoremap <F5> :UndotreeToggle<cr>


"Latex config
let g:tex_flavor='latex'
let g:Tex_IgnoredWarnings=
      \"Underfull\n".
      \"Overfull\n".
      \"specifier changed to\n".
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
nnoremap <leader>m <esc>:w<cr>:!make<cr>

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


"Keybindings
noremap <S-tab> :TagbarToggle<cr>

inoremap <f1> <esc>:bp<cr>
nnoremap <f1> :bp<cr>
inoremap <f2> <esc>:bn<cr>
nnoremap <f2> :bn<cr>
nnoremap <leader><leader> :w<cr>
inoremap <leader><leader> <esc>:w<cr>

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
set guicursor=i:ver25-iCursor

"Vim Nerdtree
map <C-n> :NERDTreeToggle<CR>

"Vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#languageclient#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <leader>. :CtrlPTag<cr>



"tags
"set tags=~/.vim/tags/java

"tagbar
noremap <S-tab> :TagbarToggle<cr>

" Language Client
let g:LanguageClient_serverCommands = {
            \'python': ['/usr/bin/pyls'],
            \'ocaml': ['/home/ian/.nvm/versions/node/v10.10.0/bin/ocaml-language-server', '--stdio'],
            \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
            \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
            \ 'javascript': ['/home/ian/.nvm/versions/node/v10.10.0/bin/node', '/home/ian/build/javascript-typescript-langserver/lib/language-server-stdio']
            \ }

"autocmd FileType ocaml au VimEnter * LanguageClientStart
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

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

autocmd FileType scheme au VimEnter * RainbowParenthesesToggle
autocmd FileType scheme au Syntax * RainbowParenthesesLoadRound
autocmd FileType scheme au Syntax * RainbowParenthesesLoadSquare
autocmd FileType scheme au Syntax * RainbowParenthesesLoadBraces

" Clipboard implementation
vnoremap y "+y
vnoremap p "+p

"Needed for Ocp-indent
set rtp^="/home/ian/.opam/system/share/ocp-indent/vim"


let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1
autocmd FileType python let b:autoformat_autoindent=1
autocmd FileType python let b:autoformat_retab=1
autocmd FileType python let b:autoformat_remove_trailing_spaces=1
autocmd FileType c let b:autoformat_autoindent=1
autocmd FileType c let b:autoformat_retab=0
autocmd FileType c let b:autoformat_remove_trailing_spaces=1


let g:formatdef_my_custom_ocaml = '"ocp-indent"'
let g:formatters_ocaml = ['my_custom_ocaml']



let b:formatdef_custom_c='"astyle -A2Efk1t8pUxbxC80xexjW3 style=ansi -nq "'
let b:formatters_c = ['custom_c']


"Formatting - Autoformat plugin
noremap <F3> :Autoformat<CR>
"au BufWrite * :Autoformat

"Nerd comment plugin options

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

imap <C-c> <plug>NERDCommenterInsert


"Goyo
function! s:goyo_enter()
    call litecorrect#init()
	Limelight
	PencilHard
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
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

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
