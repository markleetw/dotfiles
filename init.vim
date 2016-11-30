" Standard settings
    set number


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
    call plug#begin('~/.config/nvim/plugged')

    " plugin manager
    " Plug 'gmarik/vundle'

    " directory explorer
    Plug 'scrooloose/nerdtree'
        map <Leader>1  :NERDTreeToggle <CR>
        let g:NERDTreeWinSize = 40

    " autocompletion
    " Plug 'Valloric/YouCompleteMe'
    Plug 'davidhalter/jedi-vim'

    " status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        set laststatus=2
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
        set noshowmode

    " syntax check
    Plug 'scrooloose/syntastic'
        let g:syntastic_check_on_open = 1

    " mako syntax support
    Plug 'sophacles/vim-bundle-mako'

    " solarized theme
    Plug 'altercation/vim-colors-solarized'
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        syntax enable
        set background=dark
        colorscheme solarized
        let g:solarized_termtrans = 1

    " fzf
    " Plug 'junegunn/fzf'
    "     set rtp+=$HOME/.fzf

    " highlight html tag
    Plug 'gregsexton/MatchTag'

    " goto mached tag by %
    runtime macros/matchit.vim

    " use % to travel Python's if, elif, etc.
    Plug 'python_match.vim'

    " Python highlight
    " Plug 'vim-scripts/python.vim'

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

    call plug#end()

" Python settings
    function PyHeader()
        if getfsize(@%) <= 0
            execute "norm i# -*- coding: utf-8 -*-"
        endif
    endfunction
    au BufRead,BufNewFile *.py call PyHeader()

