" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md') 
    if !filereadable(vundle_readme) 
	echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
        let iCanHazVundle=0
    endif
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'vim-syntastic/syntastic'

Plugin 'nvie/vim-flake8' " dont forget install flake8 

Plugin 'jnurmine/Zenburn'

Plugin 'scrooloose/nerdtree'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tpope/vim-surround'

Plugin 'lervag/vimtex'

Plugin 'frazrepo/vim-rainbow'

Plugin 'jiangmiao/auto-pairs'

"lean & mean status/tabline for vim that's light as air 
Plugin 'vim-airline/vim-airline'

Plugin 'lyokha/vim-XkbSwitch'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:

Plugin 'honza/vim-snippets'

Plugin 'Yggdroot/indentLine'

Plugin 'dense-analysis/ale'

Plugin 'markonm/traces.vim'

" All of your Plugins must be added before the following line
if iCanHazVundle == 0
            echo "Installing Vundles, please ignore key map error messages"
            echo ""
            :PluginInstall
endif

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Setting up Vundle - the vim plugin bundler end

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

" pep 8 indentation
" Настройки табов для Python, согласно рекоммендациям
set tabstop=4
set softtabstop=4 "4 пробела в табе
set shiftwidth=4
" set textwidth=79
set expandtab "Ставим табы пробелами
set autoindent " Автоотступ
set fileformat=unix

let python_highlight_all = 1
" Deleting  Unnecessary Whitespace
" Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" Smart inden's after key words
" В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" frazrepo/vim-rainbow set up
" :RainbowToggle  --you can use it to toggle this plugin.
" :RainbowToggle  --you can use it to toggle this plugin.
let g:rainbow_active = 1
"
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


nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" YouCompleteMe
let g:ycm_show_dianostics_ui = 0
let g:ycm_autoclose_preview_window_after_completion=1 
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
" Выключаем звук в Vim
set visualbell t_vb=

"set inccommand=nosplit


let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:XkbSwitchEnabled=1
let g:XkbSwitchLib='/usr/lib/libxkbswitch.so.1.8.5'
let g:python3_host_prog = expand('/usr/bin/env python3')

" Use tab instead of Ctrl-n
imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Disable syntax_conceal
let g:vimtex_syntax_conceal_default=0

nnoremap \a :!autopep8 --in-place --aggressive --aggressive %

"autocmd BufWritePost *.py call flake8#Flake8()

set clipboard=unnamedplus
