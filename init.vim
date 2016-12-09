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
    Plug 'neomake/neomake'
        map <Leader>c :Neomake<CR>
        let g:neomake_python_flake8_maker = {'args': ['--ignore=E501']}
        let g:neomake_python_enabled_makers = ['flake8']
        autocmd! BufWritePost * Neomake
        hi NeomakeErrorSign ctermfg=203 guifg=#ff5f5f
        hi NeomakeWarningSign ctermfg=209 guifg=#ffaf00
        hi NeomakeInfoSign ctermfg=183 guifg=#dfafff
        hi NeomakeMessageSign ctermfg=27 guifg=#0087ff

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

    " Track the engine.
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Display tags in a window
    Plug 'majutsushi/tagbar'
        map <Leader>t  :TagbarToggle <CR>

    " Display the indention levels
    Plug 'Yggdroot/indentLine'
        let g:indentLine_char = '¦'

    " Autocompletion
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        " let g:deoplete#enable_at_startup = 1

    call plug#end()

" Remove trailing spaces when saving files
autocmd BufWritePre * :%s/\s\+$//e
