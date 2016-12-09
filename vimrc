" Standard settings
    set fileencodings=utf8,big5,gbk,latin1
    set nocompatible               " be iMproved
    filetype off                   " required!
    set number
    set hlsearch
    set backspace=2
    set cursorline


" Programming settings
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set smarttab
    set expandtab
    " Folding
    " set foldenable
    " set foldmethod=syntax
    " set foldcolumn=0
    " nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')


" Search selected text with //
    vnoremap // y/<C-R>"<CR>


" Set <Leader> to <Space>
    let mapleader = "\<Space>"


" Boost frequently used commands
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>q :q<CR>
    nnoremap <Leader>wq :wq<CR>
    nnoremap <Leader>bw :bw<CR>


" Copy & paste to system clipboard with <Space>p and <Space>y:
    " vmap <Leader>y "+y
    " vmap <Leader>d "+d
    " nmap <Leader>p "+p
    " nmap <Leader>P "+P
    " vmap <Leader>p "+p
    " vmap <Leader>P "+P

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

    " Solarized theme
    Plug 'altercation/vim-colors-solarized'
        syntax enable
        set background=dark
        colorscheme solarized
        let g:solarized_termtrans = 1

    " Highlight HTML tags
    Plug 'gregsexton/MatchTag'

    " Use % to travel Python's if, elif, etc.
    Plug 'python_match.vim'

    " Ctrl-P to search file
    Plug 'kien/ctrlp.vim'

    " Insert mode auto-completion for quotes, parens, brackets, etc.
    Plug 'Raimondi/delimitMate'

    " Autocompletion
    " Plug 'Valloric/YouCompleteMe'
    Plug 'davidhalter/jedi-vim'
        let g:jedi#completions_command = "<C-N>"
        let g:jedi#popup_on_dot = 0
        let g:jedi#smart_auto_mappings = 0

    " Track the engine.
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Display tags in a window
    Plug 'majutsushi/tagbar'
        map <Leader>t  :TagbarToggle <CR>

    " ctags and taglist
    " Plug 'taglist.vim'
        " map <Leader>2  :Tlist <CR>
        " let Tlist_Ctags_Cmd='ctags'
        " let Tlist_Show_One_File=1               " only display the tags of current file
        " let Tlist_WinWidt =40                   " window width
        " let Tlist_Exit_OnlyWindow=1             " auto-exit when no other window
        " let Tlist_Use_Right_Window=1            " right
        " let Tlist_Use_Left_Windo =1
        " let Tlist_Auto_Open=1
        " set tags=tags;
        " set autochdir

    " plugin manager
    " Plug 'gmarik/vundle'

    " directory explorer
    " Plug 'scrooloose/nerdtree'
        " map <Leader>1  :NERDTreeToggle <CR>
        " let g:NERDTreeWinSize = 40

    " fzf
    " Plug 'junegunn/fzf'
    "     set rtp+=$HOME/.fzf

    " goto mached tag by %
    " runtime macros/matchit.vim

    " Python highlight
    " Plug 'vim-scripts/python.vim'

    " Display the indention levels
    " Plug 'Yggdroot/indentLine'
        " let g:indentLine_setColors = 0

    call plug#end()


" Remove trailing spaces when saving files
autocmd BufWritePre * :%s/\s\+$//e


" Python utf-8 header
    " function PyHeader()
    "     if getfsize(@%) <= 0
    "         execute "norm i# -*- coding: utf-8 -*-"
    "     endif
    " endfunction
    " au BufRead,BufNewFile *.py call PyHeader()


" Run settings
    " <F5> Run Python
    " map <F5> :w<cr>:!python %<cr>

    " <F5> Run Shell
    " map <F5> :call CompileRunSH()<CR>
    " func! CompileRunSH()
    " exec "w"
    " exec "!chmod a+x %"
    " exec "!./%"
    " endfunc
