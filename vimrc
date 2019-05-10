"""""""""""""""""""
"vim基本设定
"""""""""""""""""""
set relativenumber
set nu  "行号

set backspace=indent,eol,start "让backspace正常运作
set nocompatible               " 关闭 vi 兼容模式

syntax on " 自动语法高亮
set showcmd "状态栏显示目前执行的命令
set encoding=utf-8
set cul     "显示当前行
set re=1

set cmdheight=2   " 命令行（在状态行下）的高度，默认为1，这里是2
set ignorecase          "搜索忽略大小写
set lbr                 "单词不断行
set fo+=mB              "中文可以断
set hls                 "高亮搜索
set is                  "输入时搜索
set whichwrap=b,s,<,>,[,]
set ambiwidth=double
set sm             "括号匹配
set cin             "开启重新排版按V选中，然后按=，就会重排
set wildmode=longest,list,full
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
else
  set clipboard=unnamed "use system clipboard
endif

set tags=.tags,.gemtags

" set es6 as javascript type
au BufRead,BufNewFile *.es6 setfiletype javascript


"""""""""""""""""""
" 自定义键盘绑定
""""""""""""""""""""
" 定义下一个buffer和前一个buffer
map b<Right> :bnext<cr>
map b<Left> :bprevious<cr>
map <Leader>q :Bclose<cr>
" % to bounce from do to end etc.
runtime! macros/matchit.vim

nnoremap <F4> :nohl<CR>
nnoremap <F5> :BufOnly<CR>


"use Ctrl + hjkl to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map r<Up> <C-W>+
map r<Down> <C-W>-
map r<Left> <C-W><
map r<Right> <C-W>>

map <Leader>x <C-W>x
map <Leader>v <C-W>v
map <Leader>s <C-W>s

" json format
map <Leader>j !python -m json.tool<CR>
"nnoremap <F12> :!open % -a Google\ Chrome<CR>

nnoremap <F12>f :exe ':silent !firefox %'<CR>
nnoremap <F12>c :exe ':silent !google-chrome %'<CR>
""""""""""""""""""
"缩进
""""""""""""""""""""
set et                      " tab 变 空格
set smarttab                "backspace delete a tab instead of a space
"""""""""""""""""""
"复制模式
""""""""""""""""""""
set pastetoggle=<F3>
nnoremap <F3> :set invpaste paste?<CR>kk

set shiftwidth=4
set tabstop=4
set sw=4

"删除没用的空格
autocmd BufWritePre * :%s/\s\+$//e

filetype off                  " required

"""""""""""""""""""
" Vundle
"""""""""""""""""""
nnoremap <Leader>r :RunInInteractiveShell<space>
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"""""""""""""""""""
" My Plugins
"""""""""""""""""""
" original repos on github
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'godlygeek/tabular'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'honza/vim-snippets'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'majutsushi/tagbar'
Plugin 'zeis/vim-kolor'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'solarnz/thrift.vim'
Plugin 'nathanaelkane/vim-indent-guides'


hi pythonSelf  ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
set omnifunc=syntaxcomplete#Complet
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"

autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>


"""""""""""""""""""
" vim run interactive
"""""""""""""""""""
nnoremap <Leader>r :RunInInteractiveShell<space>
autocmd FileType ruby nnoremap <Leader>b :RunInInteractiveShell<space> ruby % <CR>
autocmd FileType html nnoremap <Leader>b :RunInInteractiveShell<space> open % <CR>

"""""""""""""""""""
" NerdTree
"""""""""""""""""""
"autocmd vimenter * NERDTree
let NERDTreeChDirMode=2 "make sure the working directory is set correctly.
map <leader>n :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <leader>t :NERDTreeFind<CR>
"let NERDTreeShowHidden=1

"""""""""""""""""""
" Rainbow Parentheses
"""""""""""""""""""
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces


"""""""""""""""""""
" jedi
"""""""""""""""""""

let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_select_first = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

"""""""""""""""""""
" ctrlp
"""""""""""""""""""

"MRU default
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks=1
let g:ctrlp_clear_cache_on_exit = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

nnoremap <F2> :CtrlPClearAllCaches<CR>

""""""""""""""""""
" Multiple cursor
"""""""""""""""""""
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"""""""""""""""""""
" Airline
"""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_global_ycm_extra_conf = '/Users/julien/.ycm_extra_conf.py'

"""""""""""""""""""
" ultisnips
"""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""""""""""
" Easy motion
"""""""""""""""""""
map <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>w <Plug>(easymotion-w)

"""""""""""""""""""
" Tagbar
"""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=35
let g:tagbar_autofocus=1

"""""""""""""""""""
" Js-Beautify
"""""""""""""""""""
map <Leader>f :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


"""""""""""""""""""
"颜色主题
""""""""""""""""""""
set background=dark

set t_Co=256
if has("gui_gtk3")
  set guifont=Meslo\ LG\ S\ for\ Powerline\ 15
  set guioptions-=T  "remove toolbar
else
  set guifont=Meslo\ LG\ S\ for\ Powerline:h15
endif

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
  set background=light
  colorscheme solarized
else
  let base16colorspace=256
  colorscheme molokai
endif


