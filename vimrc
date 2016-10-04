set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'benmills/vimux'



" Dracula theme
"Plugin 'dracula/vim'

" Python Autocomplete
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" 针对不同的文件类型采用不同的缩进格式
filetype plugin indent on

" 解决中文乱码
set encoding=utf-8
set fileencodings=utf-8,chinese,gbk,latin-1,gb2312,ucs-bom,cp936
if has("win32")
  set fileencoding=chinese
else
  set fileencoding=utf-8
endif

" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 解决consle输出乱码
language messages zh_CN.utf-8

" 状态栏配置
set laststatus=2

" 打开语法高亮
"syntax enable

" 开启语法检测
syntax on

let python_highlight_all=1

" Theme
" color dracula
hi Normal ctermbg=none
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
if has('gui_running')
    let g:solarized_termcolors=256
    colorscheme solarized
else
    colorscheme zenburn
endif

" vimrc文件修改之后自动加载
autocmd! bufwritepost .vimrc source %

" yy直接复制到系统剪切板（For macvim）
set clipboard=unnamed

"Searching
" 高亮搜索命中的文本
set hlsearch
" 随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

set magic " Set magic on, for regex
set guifont=Menlo:h14

" 使用自带配色
"colorscheme elflord
"set background=dark

" 在状态栏显示正在输入的命令
set showcmd

" 显示括号配对情况
set showmatch

" 设置行号
set nu

" 退格键可用
set backspace=2

" Tab control
set noexpandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" 缩进
set autoindent
set smartindent

" 填充Tab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround


" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1
" Enable folding with the spacebar
"nnoremap <space> za

"let g:SimpylFold_docstring_preview=2

" 突出显示当前行，列
set cursorline
"set cursorcolumn

" faster redrawing
set ttyfast

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"set t_ti= t_te=

" set a map leader for more key combos
"let mapleader = ','
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>

" 打开文件时始终跳转到上次光标所在位置
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" add the following to your vimrc to enable the extension:
let g:airline#extensions#tabline#enabled = 1

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" This will give you the standard four spaces when you hit tab, ensure your
" line length doesn’t go beyond 80 characters, and store the file in a unix
" format so you don’t get a bunch of conversion issues when checking into
" GitHub and/or sharing with other users.
""au BufNewFile,BufRead *.py
""     set tabstop=4
""     set softtabstop=4
""     set shiftwidth=4
""     set textwidth=79
""     set expandtab
""     set autoindent
""     set fileformat=unix

" Open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
" Close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Open a NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Shortcut to open NERDTree
"map <C-n> :NERDTreeToggle<CR>
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" CtrlP
let g:ctrlp_map='<leader>t'
nmap <silent> <leader>r :CtrlPBuffer<cr>
" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2


" Vimux
":call VimuxRunCommand("grunt test")
"nmap <leader>z :call VimuxRunCommand("grunt test")<cr>
