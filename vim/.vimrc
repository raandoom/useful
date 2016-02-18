set nocompatible " be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vundle examples {{{
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
" }}}

" xoria256 theme
Plugin 'vim-scripts/xoria256.vim'
" molokai theme
Plugin 'vim-scripts/molokai'
" robokai theme
Plugin 'vim-scripts/robokai'
" holokai theme
Plugin 'vim-scripts/holokai'
" airline
Plugin 'bling/vim-airline'

" rust
" In insert mode use C-x-C-o to search for completions
" In normal mode type gd to go to a definition
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

" syntax checker
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on

" theme config
" set t_Co=256
" let g:molokai_original = 1
" let g:rehash256 = 1
colorscheme molokai

" airline
let g:airline_powerline_fonts=1
set laststatus=2

" rust
set hidden
let g:racer_cmd="/opt/rust/racer/target/release/racer"
let $RUST_SRC_PATH="/opt/rust/src"
let g:racer_experimental_completer=1
let g:rust_fold=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set number     " show line number

set nowrap     " dont wrap long lines
set autoindent " auto indentation

set confirm    " show dialog on exit, not error

set expandtab     " use spaces on tab
set shiftwidth=4  " indent width
set softtabstop=4 " tab width
set colorcolumn=81

set ignorecase " case insensitive search
set hlsearch   " highlight founded (use :noh for reset highlight)
set incsearch  " jump to founded

set showmatch  " jump to previous bracket

" undo
inoremap <C-Z> <Esc>ui

" add bracket with new line on enter
inoremap {<CR> {<CR>}<Esc>O

inoremap {} {}<Left>
inoremap "" ""<Left>
inoremap () ()<Left>
inoremap [] []<Left>
inoremap // //<Space>

nnoremap "" viw<Esc>a"<Esc><Left>bi"<Esc><Right>e<Right>
" edit vimrc
nnoremap <F2> :vs $MYVIMRC<CR>
nnoremap <F3> :source $MYVIMRC<CR>

" about autocmd
" augroup testgroup
"    autocmd!
"    autocmd BufWrite * :echom "Cats"
" augroup END

" improve completion menu
set completeopt=longest,menuone

" Folding method for rust {{{
augroup filetype_rust
    autocmd!
    autocmd FileType rust setlocal foldmethod=indent |
    nnoremap <F5> :RustRun<CR>
augroup END
" }}}

" Folding method for vim script {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" about variables
" :help internal-variables
