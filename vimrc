" Standard settings
    set nocompatible               " be iMproved
    filetype off                   " required!
    set number
    set hlsearch
    set backspace=2
    set cursorline
    set nobackup
    set noswapfile

" Encoding
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8
    set bomb
    set binary

" Programming settings
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set smarttab
    set expandtab
    set tabpagemax=100

" Theme
    syntax enable
    set background=dark
    colorscheme solarized

" Set <Leader> to <Space>
    let mapleader = "\<Space>"

" Search selected text with //
    vnoremap // y/<C-R>"<CR>

" Boost frequently used commands
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>q :q<CR>
    nnoremap <Leader>wq :wq<CR>

" Buffers
    nnoremap <Tab> :bn<CR>
    nnoremap <S-Tab> :bp<CR>
    nnoremap <silent> <S-t> :enew<CR>
    nnoremap <silent> <S-q> :bw<CR>

" Plugins
    call plug#begin('~/.vim/plugged')

    " Status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        set laststatus=2
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        set noshowmode

    " Syntax check
    Plug 'scrooloose/syntastic'
        nmap <Leader>c :SyntasticCheck <CR>
        nmap <Leader>e :Errors <CR>
        " let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0

    " mako syntax support
    Plug 'sophacles/vim-bundle-mako'

    " Highlight HTML tags
    Plug 'gregsexton/MatchTag'

    " Use % to travel Python's if, elif, etc.
    Plug 'python_match.vim'

    " Ctrl-P to search file
    Plug 'kien/ctrlp.vim'

    " Insert mode auto-completion for quotes, parens, brackets, etc.
    Plug 'Raimondi/delimitMate'

    " Autocompletion
    Plug 'davidhalter/jedi-vim'
        let g:jedi#completions_command = "<C-N>"
        let g:jedi#popup_on_dot = 0
        let g:jedi#smart_auto_mappings = 0

    " Track the engine.
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'

    " Display tags in a window
    Plug 'majutsushi/tagbar'
        map <Leader>t  :TagbarToggle <CR>

    " Display the indention levels
    Plug 'Yggdroot/indentLine'
        let g:indentLine_char = '¦'

    " directory explorer
    " Plug 'scrooloose/nerdtree'
        " map <Leader>1  :NERDTreeToggle <CR>
        " let g:NERDTreeWinSize = 40

    call plug#end()

" Remove trailing spaces when saving files
autocmd BufWritePre * :%s/\s\+$//e

" hand-made snippets
autocmd FileType python
\ noremap <Leader>ih i#!/usr/bin/env python<CR># -*- coding: utf-8 -*-<CR><CR><CR>|
\ noremap <Leader>im iif __name__ == '__main__':<CR>

autocmd FileType html
\ noremap <Leader>ih i<!DOCTYPE html><CR><CR>
