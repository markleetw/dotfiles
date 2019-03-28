" General settings
    set nocompatible                   " be iMproved
    filetype off                       " required!
    set relativenumber                 " display relative line numbers
    set number                         " display line numbers
    set hlsearch                       " highlight search results
    set backspace=2                    " enable backspace in insert mode
    set cursorline                     " highlight the cursor line
    set cursorcolumn                   " highlight the cursor column
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
    set mouse=a                        " enable mouse mode
    set completeopt+=noinsert,menuone
    " set clipboard=unnamed              " +y to copy text to clipboard

" Theme settings
    " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    syntax enable
    set background=dark

" Keymap settings
    " set <Leader> to <Space>
    let mapleader = "\<Space>"

    " frequently used commands
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>q :qa<CR>
    nnoremap <Leader>wq :wq<CR>

    " buffer switch
    nnoremap <Tab> :bn<CR>
    nnoremap <S-Tab> :bp<CR>

    " buffer creation and exit
    nnoremap <silent> <S-t> :enew<CR>
    nnoremap <silent> <S-q> :bw<CR>

    " search selected text with //
    vnoremap // y/<C-R>"<CR>

" Plugins
    call plug#begin('~/.local/share/nvim/plugged')

    " Theme
    Plug 'altercation/vim-colors-solarized'

    " Git
    Plug 'tpope/vim-fugitive'

    " Status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        set laststatus=2
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        set noshowmode

    Plug 'w0rp/ale'
        let g:ale_linters = {
        \    'python': ['flake8'],
        \}
        let g:ale_python_flake8_options = "--ignore=E203,E221,E251,E402,E501"
        let g:ale_enabled = 0
        let g:airline#extensions#ale#enabled = 1
        let g:ale_echo_msg_error_str = 'E'
        let g:ale_echo_msg_warning_str = 'W'
        let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
        let g:ale_open_list = 1
        nmap <silent> <leader>e :ALEToggle<CR>: echom "ALE Checking"<CR>
        nmap <silent> <C-k> <Plug>(ale_previous_wrap)
        nmap <silent> <C-j> <Plug>(ale_next_wrap)

    " mako syntax support
    Plug 'marksylee/vim-bundle-mako'

    " Highlight HTML tags
    Plug 'gregsexton/MatchTag'

    " Ctrl-P to search file
    Plug 'kien/ctrlp.vim'
        let g:ctrlp_map = '<Leader>o'
        let g:ctrlp_cmd = 'CtrlP'
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|pyc)$',
        \ }

    " Display tags in a window
    Plug 'majutsushi/tagbar'
        let g:tagbar_autofocus = 1
        let g:tagbar_silent = 1
        let g:tagbar_sort = 0
        nnoremap <Leader>t  :TagbarToggle<CR>

    " Display the indention levels
    Plug 'Yggdroot/indentLine'
        let g:indentLine_char = '¦'
        " let g:indentLine_setConceal = 0

    " Easymotion
    Plug 'easymotion/vim-easymotion'

    " Nerd
    Plug 'scrooloose/nerdtree'
        map <Leader>r :NERDTreeToggle<CR>
        let NERDTreeIgnore=['\.pyc$']
        let g:NERDTreeWinSize = 40

    " dark powered neo-completion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
        let g:deoplete#enable_smart_case = 1
        let g:deoplete#enable_at_startup = 1
        let g:deoplete#sources#jedi#show_docstring = 1
        let g:deoplete#auto_complete_delay = 500
        " let g:deoplete#disable_auto_complete = 1
        inoremap <expr><C-n> deoplete#mappings#manual_complete()
        inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
        inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
        let g:python_host_prog = '/home/marklee/dev/virtualenv/neovim2/bin/python2.7'
        let g:python3_host_prog = '/home/marklee/dev/virtualenv/neovim3/bin/python3.6'

    " only for go-to-definition
    Plug 'davidhalter/jedi-vim'
        let g:jedi#auto_vim_configuration = 0
        let g:jedi#use_tabs_not_buffers = 0
        let g:jedi#goto_command = '<leader>d'
        let g:jedi#usages_command = '<leader>g'
        let g:jedi#completions_enabled = 0
        let g:jedi#smart_auto_mappings = 0

    call plug#end()

" Remove trailing spaces when saving files
autocmd BufWritePre * :%s/\s\+$//e

" Hand-made snippets
autocmd FileType python
\ nnoremap <Leader>ih i#!/usr/bin/env python<CR># -*- coding: utf-8 -*-<CR>from __future__ import division<CR>from __future__ import print_function<CR>from __future__ import unicode_literals<CR><CR>|
\ nnoremap <Leader>im iif __name__ == '__main__':<CR>

" Copy/Paste Mode for SSH to remote Vim
nnoremap <Leader>c :call ToggleCopyMode()<CR>
function ToggleCopyMode()
    " Buffer-local variable
    if !exists('b:copy_mode_is_enabled')
        let b:copy_mode_is_enabled = 0
    endif

    if b:copy_mode_is_enabled
        echom 'Disable Copy Mode'
        set mouse=a
        IndentLinesEnable
        set number
        set relativenumber
        let b:copy_mode_is_enabled = 0
    else
        echom 'Enable Copy Mode'
        set mouse=
        ALEDisable
        IndentLinesDisable
        set number!
        set relativenumber!
        let b:copy_mode_is_enabled = 1
    endif
endfunction

" Enable theme
colorscheme solarized
