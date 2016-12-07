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
    set foldenable
    set foldmethod=syntax
    set foldcolumn=0
    nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')


" Search selected text with //
    vnoremap // y/<C-R>"<CR>


" Plugins
    call plug#begin('~/.vim/plugged')

    " status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        set laststatus=2
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        set noshowmode

    " syntax check
    Plug 'scrooloose/syntastic'
        nmap <Leader>r :SyntasticCheck <CR>
        nmap <Leader>e :Errors <CR>
        " let g:syntastic_check_on_open = 1
        " let g:syntastic_check_on_wq = 0

    " mako syntax support
    Plug 'sophacles/vim-bundle-mako'

    " solarized theme
    Plug 'altercation/vim-colors-solarized'
        syntax enable
        set background=dark
        colorscheme solarized
        let g:solarized_termtrans = 1

    " highlight html tag
    Plug 'gregsexton/MatchTag'

    " use % to travel Python's if, elif, etc.
    Plug 'python_match.vim'

    " ctags and taglist
    Plug 'taglist.vim'
        map <Leader>2  :Tlist <CR>
        let Tlist_Ctags_Cmd='ctags'
        let Tlist_Show_One_File=1               " only display the tags of current file
        let Tlist_WinWidt =40                   " window width
        let Tlist_Exit_OnlyWindow=1             " auto-exit when no other window
        let Tlist_Use_Right_Window=1            " right
        " let Tlist_Use_Left_Windo =1
        " let Tlist_Auto_Open=1
        set tags=tags;
        set autochdir

    " Ctrl-P to search file
    Plug 'kien/ctrlp.vim'

    " Highlight trailing whitespaces and can fix it
    Plug 'bronson/vim-trailing-whitespace'
        nmap <Leader>t :FixWhitespace <CR>

    " Insert mode auto-completion for quotes, parens, brackets, etc.
    Plug 'Raimondi/delimitMate'

    " plugin manager
    " Plug 'gmarik/vundle'

    " directory explorer
    " Plug 'scrooloose/nerdtree'
        " map <Leader>1  :NERDTreeToggle <CR>
        " let g:NERDTreeWinSize = 40

    " autocompletion
    " Plug 'Valloric/YouCompleteMe'
    " Plug 'davidhalter/jedi-vim'

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

" Python utf-8 header
    function PyHeader()
        if getfsize(@%) <= 0
            execute "norm i# -*- coding: utf-8 -*-"
        endif
    endfunction
    au BufRead,BufNewFile *.py call PyHeader()


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
