" Use color syntax highlighting.
syntax enable
let mapleader = ","
"Plugins for Vim-Plug

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}


Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

Plug 'sjl/badwolf'

Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'
Plug 'Chiel92/vim-autoformat'

Plug 'https://github.com/vim-syntastic/syntastic'


Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'metakirby5/codi.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim'

Plug 'mbbill/undotree'
Plug 'vim-scripts/c.vim'
Plug 'Shougo/echodoc.vim'

call plug#end()
filetype plugin on "needed for vim plugin

set undofile   " Maintain undo history between sessions

set undodir=~/.vim/undo/
"Undotree
nnoremap <F5> :UndotreeToggle<cr>


"Badwolf plugin
colorscheme badwolf

"Makes Cursor straight line
set guicursor=i:ver25-iCursor

"Vim Nerdtree
map <C-n> :NERDTreeToggle<CR>

"Vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'



"Vim-Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Vim exchange stuff
let g:exchange_no_mappings=1
nmap cx <Plug>(Exchange)
vmap X <Plug>(Exchange)
nmap cxc <Plug>(ExchangeClear)
nmap cxx <Plug>(ExchangeLine)


" Clipboard implementation
vnoremap y "+y
vnoremap p "+p


"Needed for Ocp-indent
set rtp^="/home/ian/.opam/system/share/ocp-indent/vim"

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1


let g:formatdef_my_custom_ocaml = '"ocp-indent"'
let g:formatters_ocaml = ['my_custom_ocaml']



let b:formatdef_custom_c='"astyle -A2Efk1t8pUxbxC80xexjW3 --style=ansi -nq "'
let b:formatters_c = ['custom_c']


"Formatting - Autoformat plugin
noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat

"Nerd comment plugin options

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

imap <C-c> <plug>NERDCommenterInsert
"Syntastic Options --Default

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Syntastic Checkers

let g:syntastic_ocaml_checkers = ['syntastic-ocaml-camlp4o']

let g:syntastic_c_checkers = ['syntastic-c-gcc']




" Options.
"Disable autowrap in vim
set tw=0
set textwidth=0 wrapmargin=0

set relativenumber
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set smartcase
set laststatus=2
set relativenumber
set number
set autoindent
set backspace=2     " Allows insert-mode backspace to work as one expects
set cindent
set cinkeys=0{,0},:,!^F,o,O,e   " See "cinkeys"; this stops "#" from indenting
set fileformat=unix " No crazy CR/LF
set listchars=tab:\ \ ,trail:· " If you do ":set list", shows trailing spaces
set mouse=      " I don't like the mouse in VIM
set nohlsearch      " Don't highlight search terms
set nojoinspaces    " One space after a "." rather than 2
set ruler       " Show the line position at the bottom of the window
set scrolloff=1     " Minimum lines between cursor and window edge
set shiftwidth=4    " Indent by 4 columns (for C functions, etc).
set showcmd     " Show partially typed commands
set showmatch       " Show parentheses matching
set smartindent     " Indent settings (really only the cindent matters)
set viminfo='0,\"100,   " Stay at the start of a file when opening it
set writebackup     " Write temporary backup files in case we crash

"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark




set guifont=-Schumacher-Clean-Medium-R-Normal--16-160-75-75-C-80-ISO646.1991-IRV

map <Del> <BS>
imap <Del> <BS>

" My file types. ufNewFile,BufRead *.cls set syn=tex
au BufNewFile,BufRead *.R set syn=r
au BufNewFile,BufRead *.R syn sync fromstart

" On plain text files, no keyword chars, because we don't want tab completion
au BufNewFile,BufRead *.txt set iskeyword=

" NOTE: Sweave syntax is my own file...
au BufNewFile,BufRead *.Snw set syn=sweave

" On LaTeX files don't use indenting.
au BufNewFile,BufRead *.tex,*.Snw set noautoindent nosmartindent nocindent
" On HTML files don't use indenting.
au BufNewFile,BufRead *.html set noautoindent nosmartindent nocindent

" On CGI files, determine type by reading in a line.
fun! CGICheck()
    let l = getline(nextnonblank(1))
    if l =~ 'php'
        set syn=php
    elseif l =~ 'perl'
        set syn=perl
    endif
endfun

au BufRead *.cgi    call CGICheck()

" On reading TeX files, don't wrap to eighty characters. I know this is
" horrible, but it makes formatting and parsing much easier for me.
" TODO Figure out how to make the scrolling work properly with line wrapping.
fun! TeXformat()
    set noautoindent nosmartindent nocindent
    set textwidth=0
    set linebreak
    set display=lastline
    noremap j gj
    noremap k gk
    noremap $ g$
    noremap ^ g^
    noremap 0 g0
    noremap A g$a
    noremap I g^i
    noremap C cg$
    noremap D dg$
endfun

"au BufNewFile,BufRead *.tex call TeXformat()

" Set expandtab for Fortran files
au BufNewFile,BufRead *.f,*.for set expandtab

" I don't know why I need this...
augroup cprog
    au!
augroup end

    " Based on VIM tip 102: automatic tab completion of keywords
    function InsertTabWrapper(dir)
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k'
            return "\<tab>"
        elseif "back" == a:dir
            return "\<c-p>"
        else
            return "\<c-n>"
        endif
    endfunction

    inoremap <tab> <c-r>=InsertTabWrapper("fwd")<cr>
    inoremap <s-tab> <c-r>=InsertTabWrapper("back")<cr>

    set encoding=utf-8
