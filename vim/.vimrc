set nocompatible              " required
filetype off                  " required
" Setting up vim-plug - the vim plugin manager

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}
Plug 'vim-syntastic/syntastic'
"Plug 'nvie/vim-flake8' " dont forget install flake8 
Plug 'jnurmine/Zenburn'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
"lean & mean status/tabline for vim that's light as air 
Plug 'vim-airline/vim-airline'
Plug 'lyokha/vim-XkbSwitch'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'markonm/traces.vim'

" Initialize plugin system
call plug#end()
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
" Включаем возможность скрыть часть кода, по отступу
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
" Включаем скрытие через пробел
nnoremap <space> za

" PYTHON 
" pep 8 indentation
" Настройки табов для Python, согласно рекоммендациям
set tabstop=4
set softtabstop=4 "4 пробела в табе
set shiftwidth=4
set expandtab "Ставим табы пробелами
set autoindent " Автоотступ
set fileformat=unix
let python_highlight_all = 1
let g:python3_host_prog = expand('/usr/bin/python3')
" Deleting  Unnecessary Whitespace
" Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" Smart inden's after key words
" В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" END PYTHON

" Enable autocompletion:
set wildmode=longest,list,full
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Включаем 256 цветов в терминале, мы ведь работаем из иксов?
" Нужно во многих терминалах, например в gnome-terminal
set t_Co=256
syntax on "Включить подсветку синтаксиса
" Line Numbering
"Включаем нумерацию строк
set nu 
set mousehide "Спрятать курсор мыши когда набираем текст
set mouse=a "Включить поддержку мыши
set termencoding=utf-8 "Кодировка терминала
set novisualbell "Не мигать 
set t_vb= "Не пищать! (Опции 'не портить текст', к сожалению, нету)
" Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Вырубаем черточки на табах
set showtabline=1
" Переносим на другую строчку, разрываем строки
set wrap
set linebreak
colorscheme zenburn
" Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile
" UTF-8 support
set encoding=utf-8 
set fileencodings=utf8,cp1251
set ruler
set title
set hidden
set clipboard=unnamedplus

" YouCompleteMe
let g:ycm_show_dianostics_ui = 0
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
" END YouCompleteMe

" Self maps
set pastetoggle=<F3>
xnoremap <F4> :s/^/#/
nnoremap \a :!autopep8 --in-place --aggressive --aggressive %
" END Self maps

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'

" XkbSwitch
let g:XkbSwitchEnabled=1
let g:XkbSwitchLib='/usr/lib/libxkbswitch.so.1.8.5'

" UltiSnips
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" frazrepo/vim-rainbow set up
" :RainbowToggle  --you can use it to toggle this plugin.
" :RainbowToggle  --you can use it to toggle this plugin.
let g:rainbow_active = 1
