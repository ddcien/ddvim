set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

" Quickly open files, buffers and MRU
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'


" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Undotree management
Plug 'mbbill/undotree'

" File Browser
Plug 'scrooloose/nerdtree'

" Tag view for current buffer
Plug 'majutsushi/tagbar'

" Easy Comment
Plug 'scrooloose/nerdcommenter'
Plug 'DoxygenToolkit.vim'

" Code Complete
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator'

" Code Snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Syntax Check
"Plug 'vim-syntastic/syntastic'

" Encoding Detection
" TODO:
" 

" Easy test editing
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'matchit.zip'
Plug 'godlygeek/tabular'
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/LargeFile'

" Color
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'

" UI
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'

"Searching
Plug 'dkprice/vim-easygrep'

" Session management
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Utils
Plug 'ddcien/vim-gtags'
Plug 'Chiel92/vim-autoformat'
Plug 'derekwyatt/vim-fswitch'


"Eclim
Plug 'ddcien/eclim'

call plug#end()

filetype plugin indent on

set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
let g:molokai_original = 1
"colorscheme molokai
colorscheme solarized
syntax on
syntax enable

" General
set mouse=a
set mousehide
set clipboard=unnamed,unnamedplus

" UI
set showmode
set cursorline
set colorcolumn=110

set number
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

set wildmenu
set wildmode=list:longest,full

" command line
set ruler
set showcmd

" status line
set laststatus=2

" formatting
set nowrap
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nojoinspaces


" Backups
set backupdir=~/.vim/backupdir
set backup

set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

set foldmethod=syntax
set nofoldenable


nnoremap <ESC> :nohl<CR>
nnoremap Y y$

if isdirectory(expand("~/.vim/plugged/vim-session")) 
    let g:session_autoload = 'no'
endif

if isdirectory(expand("~/.vim/plugged/vim-indent-guides")) 
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
endif

if isdirectory(expand("~/.vim/plugged/vim-protodef"))
    let g:disable_protodef_sorting = 1
    let g:protodefprotogetter = '~/.vim/plugged/vim-protodef/pullproto.pl'
endif

if isdirectory(expand("~/.vim/plugged/DoxygenToolkit.vim"))
    let g:DoxygenToolkit_authorName   = "Richard Lu <luqifeng@byhx-china.com>" 
    let g:DoxygenToolkit_versionString = "v1.0.0"
endif
if isdirectory(expand("~/.vim/plugged/eclim"))
    "let g:EclimCompletionMethod = 'omnifunc'
endif

" Key (re)Mappings
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif

if isdirectory(expand("~/.vim/plugged/vim-gtags")) 
    let g:Gtags_Auto_Update = 1
endif

if isdirectory(expand("~/.vim/plugged/ctrlp.vim"))
endif

if isdirectory(expand("~/.vim/plugged/vim-easygrep"))
    let g:EasyGrepCommand = 1
endif

if isdirectory(expand("~/.vim/plugged/vim-airline-themes"))
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'solarized'
endif

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.[ch] set filetype=c.doxygen
augroup END

if isdirectory(expand("~/.vim/plugged/nerdtree"))
    let g:NERDShutUp = 1
    map <C-e> :NERDTreeToggle<CR>
endif
if isdirectory(expand("~/.vim/plugged/matchit.zip"))
    let b:match_ignorecase = 1
endif


if isdirectory(expand("~/.vim/plugged/tagbar"))
    let g:tagbar_sort = 0
    let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
    let g:tagbar_compact = 1
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
endif

if isdirectory(expand("~/.vim/plugged/rainbow"))
    let g:rainbow_active = 1
endif

if isdirectory(expand("~/.vim/plugged/vim-fugitive"))
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    nnoremap <silent> <leader>gi :Git add -p %<CR>
endif

if isdirectory(expand("~/.vim/plugged/YouCompleteMe"))
    set completeopt-=preview

    " UltiSnips
    let g:ycm_use_ultisnips_completer = 1
    let g:UltiSnipsExpandTrigger = '<C-j>'
    let g:UltiSnipsJumpForwardTrigger = '<C-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 0
    let g:ycm_collect_identifiers_from_tags_files = 0
    let g:ycm_seed_identifiers_with_syntax = 1

    let g:ycm_add_preview_to_completeopt = 1
    let g:ycm_autoclose_preview_window_after_completion = 0
    let g:ycm_autoclose_preview_window_after_insertion = 1

    let g:ycm_goto_buffer_command = 'vertical-split'
    nnoremap <silent> <leader>gg :YcmCompleter GoTo<CR>
endif

if isdirectory(expand("~/.vim/plugged/undotree"))
    let g:undotree_SetFocusWhenToggle = 1
    nnoremap <silent> <leader>uu :UndotreeToggle<CR>
endif


" GUI
if has('gui_running')
    set guioptions=aiA
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Light\ 13
endif

function! ResCur()
    if line("'\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END
