set nocompatible              " be iMproved, required
filetype off                  " required

set runtimepath^=~/.vim/bundle/ctrlp.vim
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
Plugin 'vim-scripts/Auto-Pairs'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-unimpaired'

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


"-------------------------
"---------- ALE ----------
scriptencoding utf-32

let g:ale_linters = {
      \   'Dockerfile': ['hadolint'],
      \   'haml': ['haml_lint'],
      \   'javascript': ['eslint', 'flow'],
      \   'jsx': ['eslint', 'flow'],
      \   'ruby': ['rubocop'],
      \   'vim': ['vint'],
      \   'yaml': ['yamllint'],
      \ }

let g:ale_fixers = {
      \   'ruby': ['rubocop'],
      \ }

nnoremap <silent><C-n> :ALENext<cr>
nnoremap <silent><C-p> :ALEPrevious<cr>
nnoremap <silent><localleader>f   :ALEFix<cr>

let g:ale_sign_column_always = 1
let g:ale_sign_error = '••'
let g:ale_sign_warning = '••'

highlight link ALEErrorSign DiffDelete
highlight link ALEError DiffDelete

highlight link ALEWarningSign Todo
highlight link ALEWarning Todo

let g:ale_echo_msg_format = '%linter%: %s'

"----------------------------
"-------- Emmet-Vim ---------
let g:user_emmet_leader_key='<c-e>'

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

"----------------------------
"----- VIM-JSX Settings -----
let g:jsx_ext_required = 0

"---------------------------
let g:mapleader = "\<space>"
let g:maplocalleader = "\<nul>"
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
colorscheme apprentice

"----------------------------------
"---------- Vim Settings ----------
syntax on
set laststatus=2
set expandtab
set nu
set relativenumber
set listchars=tab:>#,nbsp:_
set list
set incsearch
inoremap jj <Esc>

" Set indentation based on file type
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" Trim whitespace
autocmd BufWritePre *.* :%s/\s\+$//e
set nowrap
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
call matchadd('Error', '\%121v', 100)

"-----------------------------
"------ Silver Searcher ------
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
noremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"-----------------------------
"---------- Crtl P -----------
nnoremap <silent><leader>p :CtrlP<CR>
