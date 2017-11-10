" vim: set foldmethod=marker foldlevel=0 nomodeline:

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

" VCS {{{
Plug 'mhinz/vim-signify'
" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/gitignore'     " Set 'wildignore' from ./.gitignore
Plug 'vim-scripts/gitignore.vim' " Gitignore files support
Plug 'junegunn/gv.vim', {'on': ['GV', 'GV!']}
" }}}
" }}}
"
" Edit {{{
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'ddcien/ici.vim'
" }}}

" Browsing {{{
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'junegunn/rainbow_parentheses.vim'
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
let g:tagbar_sort      = 0
let g:tagbar_compact   = 1
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nnoremap <silent> <leader>tt :TagbarToggle<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
let g:NERDShutUp=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeQuitOnOpen=1
map <C-e> :NERDTreeToggle<CR>
" }}}

" Status line {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
" }}}

" Auto complete {{{
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger       = '<C-j>'
let g:UltiSnipsJumpForwardTrigger  = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --clang-completer --system-boost  --system-libclang
    endif
endfunction
Plug 'Valloric/YouCompleteMe', {'do': function('BuildYCM')}
let g:ycm_filetype_blacklist = {'tagbar': 1, 'qf': 1, 'notes': 1, 'netrw': 1, 'unite': 1, 'vimwiki': 1, 'pandoc': 1,  'infolog': 1,  'mail': 1 }
let g:ycm_use_ultisnips_completer  = 1
let g:ycm_complete_in_comments                          = 1
let g:ycm_complete_in_strings                           = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files           = 0
let g:ycm_seed_identifiers_with_syntax                  = 1
let g:ycm_add_preview_to_completeopt                = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion  = 0
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_auto_start_csharp_server = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_show_diagnostics_ui = 1
let g:ycm_cache_omnifunc      = 1
let g:ycm_confirm_extra_conf  = 0
nnoremap <silent> <leader>gg :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>ff :YcmCompleter FixIt<CR>
Plug 'rdnetto/YCM-Generator', {'branch': 'stable', 'on': 'YcmGenerateConfig'}
" }}}

" Searching {{{
let g:ackprg = 'ag --vimgrep'
Plug 'junegunn/vim-slash'
Plug 'mhinz/vim-grepper', {'on': ['Grepper', '<plug>(GrepperOperator)'] }
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
" }}}

" Colors {{{
" Plug 'altercation/vim-colors-solarized'
Plug 'icymind/NeoSolarized'
Plug 'MaxSt/FlatColor'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-janah'

Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
" }}}

" Comment {{{
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_briefTag_pre ='@Synopsis  '
let g:DoxygenToolkit_paramTag_pre ='@Param '
let g:DoxygenToolkit_returnTag ='@Returns   '
let g:DoxygenToolkit_authorName = 'Richard Lu <luqifeng@byhx-china.com>'
let g:DoxygenToolkit_licenseTag ='BYHX license'
" }}}

" Motion {{{
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/matchit.zip'
" }}}

" Format & Lint {{{
Plug 'Chiel92/vim-autoformat'
let g:formatters_python = ['autopep8']

Plug 'w0rp/ale'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 0
let g:ale_linters = {
            \ 'asm': [],
            \ 'c': ['cppcheck'],
            \ 'cpp': ['cppcheck'],
            \ 'vim': ['vint'],
            \ 'cmake': ['cmakelint'],
            \ 'python': ['pycodestyle'],
            \ 'markdown': ['proselint', 'remark-lint', 'vale', 'write-good']
            \}
" }}}

" Languages {{{
" markdown {{{
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'tyru/open-browser.vim', {'for': 'markdown'}
Plug 'kannokanno/previm', {'for': 'markdown'}
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}
Plug 'reedes/vim-pencil', {'on': 'PencilSoft'}
function! s:goyo_enter()
    PencilSoft
    Limelight
endfunction
function! s:goyo_leave()
    Limelight!
    PencilOff
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
nnoremap <Leader>G :Goyo<CR>
augroup Markdown
    autocmd!
    autocmd FileType markdown,text set spell
augroup END
" }}}

" armasm {{{
augroup armasm
    autocmd!
    autocmd BufRead,BufNewFile *.[sS] set filetype=armasm
augroup END
Plug 'alisdair/vim-armasm', {'for': 'armasm'}
" }}}

" C/CPP  {{{
augroup C
    autocmd!
    autocmd BufRead,BufNewFile *.[ch] set filetype=c
augroup END
Plug 'vim-scripts/a.vim', {'for': ['c', 'cpp']}
Plug 'vim-jp/vim-cpp', {'for': ['c', 'cpp']}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
Plug 'ddcien/vim-gtags', {'for': ['c', 'cpp']}
if has_key(g:plugs, 'vim-gtags')
    let g:Gtags_Auto_Update       = 1
    let g:Gtags_Close_When_Single = 1
    nmap <C-]> :Gtags<CR><CR>
endif
" }}}

" Python {{{
Plug 'tweekmonster/impsort.vim', {'for': 'python'}
Plug 'tweekmonster/braceless.vim'
augroup PYTHON
    autocmd!
    autocmd FileType python BracelessEnable +indent
augroup END

Plug 'python-mode/python-mode', {'for': 'python' }
let g:pymode_python = 'python3'
let g:pymode = 1
let g:pymode_lint = 0  " Using ALE instead
let g:pymode_rope_autoimport = 1

Plug 'mitsuhiko/vim-python-combined', {'for': 'python'}
" }}}

" Cmake {{{
Plug 'ddcien/cmake.vim'
" }}}

" Other all {{{
Plug 'sheerun/vim-polyglot'
" }}}
" }}}

Plug 'wikitopian/hardmode'
let g:HardMode_level = 'wannabe'
augroup HARDMODE
    autocmd!
    autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
augroup END

Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-sensible'

" Quickly open files, buffers and MRU
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup -g ""'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_OPTS .= ' --inline-info'
let $FZF_DEFAULT_COMMAND = 'ag -l --nocolor --nogroup -g ""'
let g:fzf_layout = { 'down': '~30%' }

Plug 'wakatime/vim-wakatime'
call plug#end()
" }}}

" Setting  {{{
set number
set numberwidth=4
set mouse-=a
set mousehide
set smartindent
set lazyredraw
set showcmd
set visualbell
set timeoutlen=500
set whichwrap=b,s
set shortmess=aIT
set hlsearch
set incsearch
set hidden
set ignorecase smartcase
set wildmode=list:longest,full
set tabstop=4
set shiftwidth=4
set expandtab smarttab
set scrolloff=5
set encoding=utf-8
set fileencodings=utf-8,gbk
set list
set virtualedit=block
set nojoinspaces
set diffopt=filler,vertical
set autoread
set clipboard=unnamed,unnamedplus
set foldlevelstart=99
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menuone,preview
set cursorline
set nrformats=hex
silent! set cryptmethod=blowfish2
set formatoptions+=1
set formatoptions+=j
let &showbreak = '↳ '
set breakindent
set breakindentopt=sbr
set nostartofline
set textwidth=0
set colorcolumn=80
set termguicolors

set undodir=~/.vim/undodir/
set undofile

set directory=/tmp
set backupdir=~/.vim/backupdir
set backup
" }}}

" Key bindings {{{
nnoremap Y y$
" }}}

" GUI {{{
if has('gui_running')
    set guioptions=a
    set guifont=Anonymous\ Pro\ for\ Powerline\ Regular\ 12
endif
" }}}
set background=dark
let g:neosolarized_italic = 1
colorschem NeoSolarized
