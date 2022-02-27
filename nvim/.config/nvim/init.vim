filetype plugin indent on    " required
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
set expandtab "Ставим табы пробелами
set autoindent " Автоотступ
set fileformat=unix
let python_highlight_all = 1
let g:rainbow_active = 1
set wildmode=longest,list,full
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set t_Co=256
syntax on "Включить подсветку синтаксиса
set nu 
set mousehide "Спрятать курсор мыши когда набираем текст
set mouse=a "Включить поддержку мыши
set termencoding=utf-8 "Кодировка терминала
set novisualbell "Не мигать 
set t_vb= "Не пищать! (Опции 'не портить текст', к сожалению, нету)
set backspace=indent,eol,start whichwrap+=<,>,[,]
set showtabline=1
set wrap
set linebreak
" colorscheme zenburn
set nobackup
set noswapfile
set encoding=utf-8 
set fileencodings=utf8,cp1251
set ruler
set title
set hidden
let g:python3_host_prog = expand('/usr/bin/python3')

set clipboard=unnamedplus
set colorcolumn=79
