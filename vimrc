" For Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'flazz/vim-colorschemes'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'jelera/vim-javascript-syntax'

" Filetype indentations
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2

" General
set background=dark            " Assume dark background
filetype plugin indent on      " Automatically detect file types
syntax on                      " Syntax highlighting
scriptencoding utf-8
set history=1000               " Store a ton of history
set hidden                     " Allow buffer switching without saving
set nofoldenable               " Don't fold by default
set backspace=indent,eol,start " Backspace for dummies
set linespace=0                " No extra spaces between rows
set nu                         " Line numbers on
set showmatch                  " Show matching brackets/parentheses
set incsearch                  " Find as you type search
set hlsearch                   " Highlight search terms
set ignorecase                 " Case insensitive search
set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap too
set scrolloff=3                " Minimum lines to keep above and below cursor
set showmode                   " Display the current mode
set cursorline                 " Highlight current line
highlight clear SignColumn     " SignColumn should match background
highlight clear LineNr         " Current line number row will have same background
set laststatus=2
set list
set listchars=tab:>\ ,trail:*,extends:#,nbsp:. " Highlight problematic whitespace

" Default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Key Remappings
let mapleader = ','
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Colorscheme settings
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:airline_theme = 'zenburn'
colorscheme Monokai

" nerdtree settings
map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeMouseMode=2
let NERDTreeWinSize=40
let NERDTreeKeepInNewTab=1

" ctrlp settings
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <C-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" Fugitive settings
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
