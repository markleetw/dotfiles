" General settings
    set nocompatible                   " be iMproved
    filetype off                       " required!
    set number                         " display line numbers
    set hlsearch                       " highlight search results
    set backspace=2                    " enable backspace in insert mode
    set cursorline                     " highlight the cursor line
    set nobackup                       " won't save backup file anymore
    set noswapfile                     " won't save swap file anymore

" Encoding settings
    set encoding=utf-8                 " for Vim execution
    set fileencoding=utf-8             " for saving new files
    set fileencodings=utf-8            " for opening files

" Programming settings
    set expandtab                      " expand TABs to spaces
    set tabstop=4                      " the width of a TAB
    set shiftwidth=4                   " the width of a indent
    set softtabstop=4                  " the numbers of columns for a TAB
    set smarttab                       " uses shiftwidth instead of tabstop at start of lines
    set tabpagemax=100                 " change the limit of tabs

" Theme settings
    syntax enable
    set background=dark
    colorscheme solarized

" Keymap settings
    " set <Leader> to <Space>
    let mapleader = "\<Space>"

    " frequently used commands
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>q :q<CR>
    nnoremap <Leader>wq :wq<CR>

    " buffer switch
    nnoremap <Tab> :bn<CR>
    nnoremap <S-Tab> :bp<CR>

    " buffer creation and exit
    nnoremap <silent> <S-t> :enew<CR>
    nnoremap <silent> <S-q> :bw<CR>

    " search selected text with //
    vnoremap // y/<C-R>"<CR>

    " Make a simple search text object
    " (just search something and hit 'cs' to replace and insert)
    vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
        \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
    omap s :normal vs<CR>

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
        nnoremap <Leader>c :SyntasticCheck<CR>
        nnoremap <Leader>e :SyntasticCheck<CR>:Errors<CR>
        " let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
        let g:syntastic_python_checkers=['flake8']
        let g:syntastic_python_flake8_args = "--ignore=E203,E221,E501"
        let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

    " mako syntax support
    " Plug 'sophacles/vim-bundle-mako'
    Plug 'vim-scripts/mako.vim'
        au BufRead,BufNewFile *.mako     set filetype=mako

    " Highlight HTML tags
    Plug 'gregsexton/MatchTag'

    " Ctrl-P to search file
    Plug 'kien/ctrlp.vim'
        let g:ctrlp_map = '<Leader>o'
        let g:ctrlp_cmd = 'CtrlP'
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip
        let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

    " Autocompletion
    Plug 'davidhalter/jedi-vim'
        let g:jedi#completions_command = "<C-N>"
        let g:jedi#popup_on_dot = 0
        let g:jedi#smart_auto_mappings = 0

    " Display tags in a window
    Plug 'majutsushi/tagbar'
        let g:tagbar_autofocus = 1
        let g:tagbar_silent = 1
        let g:tagbar_sort = 0
        nnoremap <Leader>t  :TagbarToggle<CR>

    " Display the indention levels
    Plug 'Yggdroot/indentLine'
        let g:indentLine_char = '¦'

    " Insert mode auto-completion for quotes, parens, brackets, etc.
    " Plug 'Raimondi/delimitMate'

    " Python docstring generator
    " Plug 'marksylee/vim-pydocstring'

    " Use % to travel Python's if, elif, etc.
    " Plug 'python_match.vim'

    " Track the engine.
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'

    " Directory explorer
    " Plug 'scrooloose/nerdtree'
        " map <Leader>1  :NERDTreeToggle <CR>
        " let g:NERDTreeWinSize = 40

    call plug#end()

" Remove trailing spaces when saving files
autocmd BufWritePre * :%s/\s\+$//e

" Hand-made snippets
autocmd FileType python
\ nnoremap <Leader>ih i#!/usr/bin/env python<CR># -*- coding: utf-8 -*-<CR><CR><CR>|
\ nnoremap <Leader>im iif __name__ == '__main__':<CR>

autocmd FileType html
\ nnoremap <Leader>ih i<!DOCTYPE html><CR><CR>
