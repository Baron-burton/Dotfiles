set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-sleuth'
Plugin 'shougo/denite.nvim'
Plugin 'vim-scripts/Auto-Pairs'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

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

let g:mapleader = "\<space>"
let g:maplocalleader = "\<nul>"
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
colorscheme apprentice

"----------------------------------
"---------- Vim Settings ----------
syntax on
set laststatus=2
set tabstop=4
set expandtab
set nu
set relativenumber
set listchars=tab:>#,nbsp:_
set list
set incsearch
inoremap jj <Esc>
" Trim whitespace
autocmd BufWritePre *.* :%s/\s\+$//e
set nowrap
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
call matchadd('Error', '\%121v', 100)

"----------------------------
"---------- Denite ----------
nnoremap <silent><leader>uu               :Denite -buffer-name=file_rec
    \ file_rec<cr>
nnoremap <silent><leader>um               :Denite -buffer-name=models
    \ -path=`getcwd()`/app/models
    \ file_rec<cr>
nnoremap <silent><leader>uc               :Denite -buffer-name=controllers
    \ -path=`getcwd()`/app/controllers
    \ file_rec<cr>
nnoremap <silent><leader>uv               :Denite -buffer-name=views
    \ -path=`getcwd()`/app/views
    \ file_rec<cr>
nnoremap <silent><leader>uj               :Denite -buffer-name=javascripts
    \ -path=`getcwd()`/app/assets/javascripts
    \ file_rec<cr>
nnoremap <silent><leader>us               :Denite -buffer-name=specs
    \ -path=`getcwd()`/spec
    \ file_rec<cr>

call denite#custom#map('insert', '<tab>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<s-tab>', '<denite:move_to_previous_line>', 'noremap')

"-----------------------------
"------ Silver Searcher ------
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
noremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
