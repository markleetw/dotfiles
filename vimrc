" Standard settings
    set fileencodings=utf8,big5,gbk,latin1
    set nocompatible               " be iMproved
    filetype off                   " required!
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    set number
    set hlsearch
    set backspace=2


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


" Plugins
    " plugin manager
    Plugin 'gmarik/vundle'

    " directory explorer
    Plugin 'scrooloose/nerdtree'
        map <Leader>1  :NERDTreeToggle <CR>
        let g:NERDTreeWinSize = 40

    " autocompletion
    " Plugin 'Valloric/YouCompleteMe'
    Plugin 'davidhalter/jedi-vim'

    " status bar
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
        set laststatus=2
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        set noshowmode

    " syntax check
    Plugin 'scrooloose/syntastic'
        let g:syntastic_check_on_open = 1

    " mako syntax support
    Plugin 'sophacles/vim-bundle-mako'

    " solarized theme
    Plugin 'altercation/vim-colors-solarized'
        syntax enable
        set background=dark
        colorscheme solarized
        let g:solarized_termtrans = 1

    " fzf
    " Plugin 'junegunn/fzf'
    "     set rtp+=$HOME/.fzf

    " highlight html tag
    Plugin 'gregsexton/MatchTag'

    " goto mached tag by %
    runtime macros/matchit.vim

    " use % to travel Python's if, elif, etc.
    Plugin 'python_match.vim'

    " Python highlight
    " Plugin 'vim-scripts/python.vim'

    " ctags and taglist
    Plugin 'taglist.vim'
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
    Plugin 'kien/ctrlp.vim'

" Python settings
    function PyHeader()
        if getfsize(@%) <= 0
            execute "norm i# -*- coding: utf-8 -*-"
        endif
    endfunction
    au BufRead,BufNewFile *.py call PyHeader()

