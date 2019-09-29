" Vim with all enhancements 
" cold-soda-jay Default {{{

" Plugins {{{
call plug#begin('~/.vim/plugged')

"General{{{

Plug '907th/vim-auto-save'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
"}}}
"
"Markdown{{{

Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips',{'for':'markdown'}
Plug 'mzlogin/vim-markdown-toc'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim'

"}}}

"Python{{{

Plug 'honza/vim-snippets',{'for':'python'}
Plug 'Yggdroot/indentLine',{'for':'python'}
Plug 'jiangmiao/auto-pairs',{'for':'python'}
Plug 'vim-scripts/indentpython.vim',{'for':'python'}
Plug 'luochen1990/rainbow',{'for':'python'}
Plug 'ycm-core/YouCompleteMe',{'for':'python'}
"}}}
call plug#end()

" Markdown{{{
let g:vmt_auto_update_on_save = 0 
let g:mkdp_path_to_chrome ='C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow = 0
let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"
let g:vim_markdown_math = 1
let g:mkdp_auto_start = 0
let g:vim_markdown_strikethrough = 1
"}}}

" UltiSnips{{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'

"if &filetype ==# 'markdown'
let g:UltiSnipsSnippetDirectories=["C:/Users/cold-soda-jay/.vim/plugged/ultisnips/"]
let g:UltiSnipsSnippetsDir = '~/.vim/plugged/ultisnips'
let g:UltiSnipsEditSplit="vertical"
"}}}

"others {{{ 
"let g:startify_session_delete_buffers = 1
let g:startify_files_number = 10
let g:NERDTreeWinPos = "right"
let g:rainbow_active = 1
"Auto Save
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged",  "CursorHoldI","CursorHold", "CompleteDone"]
"}}}
"
"python{{{
let g:indentLine_setColors = 0
let g:ycm_python_interpreter_path = "D:\Apps\Anacoda\python.exe"
let g:ycm_python_sys_path = ['D:\Apps\Anacoda']
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"}}}

"}}}

" Settings{{{
set nocompatible
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
set nu
set ignorecase
" vim 文件折叠方式为 marker
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
augroup END

exec 'cd ' . fnameescape('C:/Users/cold-soda-jay/OneDrive/Notes/')
set path=C:\Users\cold-soda-jay\OneDrive\**
set nobackup
set nowb
set noswapfile
set history=1024
"jset showmatch
autocmd BufEnter * lcd %:p:h
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
" 设置 alt 键不映射到菜单栏
set winaltkeys=no


set conceallevel=2
set clipboard+=unnamedplus
set shiftwidth=4
set expandtab
set autoread
" the mouse pointer is hidden when characters are typed
set mousehide
" Height of the command bar
set cmdheight=1
"}}}

" Functions{{{
"Delet unnecessary under structure of generated toc
function RToc()
    exe "/-toc .* -->"
    let lstart=line('.')
    exe "/-toc -->"
    let lnum=line('.')
    execute lstart.",".lnum."g/           /d"
endfunction

" open terminal in split window
function MyCMD(name)
    execute "vs"
    execute "term ".a:name
endfunction


command!  CMD
        \ call MyCMD("")

command! PATH
        \ let @+ = expand("%:p")

command! TMD
        \ execute "!start typora %:p"


command! WSP
        \ execute "cd D:/Workspace_Pycharm | NERDTree"

command! NT
        \ execute "cd C:/Users/cold-soda-jay/OneDrive/Notes/ | NERDTree"
" }}}

" Keymap{{{
" 设置缩进与反缩进为c-d,c-s
inoremap <M-s> <C-d>
inoremap <M-d> <C-t>
inoremap <C-s> <C-d>
inoremap <C-d> <C-t>

" Ctrl+hjkl 光标移动
inoremap <C-l> <RIGHT>
inoremap <C-k> <UP>
inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-o> <C-LEFT>
inoremap <C-p> <C-RIGHT>

inoremap <M-l> <RIGHT>
inoremap <M-k> <UP>
inoremap <M-h> <LEFT>
inoremap <M-j> <DOWN>
inoremap <M-o> <C-LEFT>
inoremap <M-p> <C-RIGHT>

inoremap <C-Space> <C-n>
inoremap <C-b> <ESC>o<C-d><C-d><C-d>
inoremap <C-q> <Backspace>

" Map jk to normal mode
inoremap jj <Esc>
inoremap JJ <Esc>
inoremap Jj <Esc>
inoremap <C-c> <Esc>

nnoremap <S-Space> :/
nnoremap <S-b> :noh<CR>

"Resize windows
nmap <silent> <C-l> :vertical resize +5<CR>
nmap <silent> <C-k> :resize -5<CR>
nmap <silent> <C-J> ::resize +5<CR>
nmap <silent> <C-h> :vertical resize -5<CR>
nnoremap <silent> <C-e> <C-e><C-e><C-e>
nnoremap <silent> <C-z> <C-y><C-y><C-y>
nmap <silent> <S-l> <C-w>l
nmap <silent> <S-h> <C-w>h
nmap <silent> <S-k> <C-w>k
nmap <silent> <S-j> <C-w>j

noremap <space> :
noremap i zzi
noremap a zza
noremap A zzA
noremap I zzI


" Make moving around works well in multi lines
map <silent> j gj
map <silent> k gk

map <silent> <UP> gk
map <silent> <DOWN> gj

"map F2 to open NERDTree
map <F2> :NERDTreeToggle<CR>
map <S-F2> :NERDTreeFind<CR>
"Open Statify
nnoremap <silent> <F3> :Startify <CR> 

" 打开当前目录 windows
map <leader>ex :!start explorer %:p:h<CR>
" 打开当前目录CMD
map <leader>cmd :!start<cr>

"}}}

" Lang & Enzocoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
set nospell
set spelllang=de_de

"language messages zh_CN.UTF-8
" }}}

" GUI {{{

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set cursorcolumn
set cursorline
" 窗口大小
"autocmd GUIEnter * winpos 1080 500
"winpos 235 235
"set lines=60 columns=75
" 分割出来的窗口位于当前窗口下边/右边
"set splitbelow
set splitright
"不显示工具/菜单栏
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
" 使用内置 tab 样式而不是 gui
set guioptions-=e
set nolist
set listchars=tab:▶\ ,eol:¬,trail:·,extends:>,precedes:<
set guifont=Consolas:h12:cANSI
colorscheme molokai
let g:molokai_original = 1
"set termguicolors
"let g:rehash256 = 1
" }}}

"Other Options {{{


" NERDTree config{{{
" open a NERDTree automatically when vim starts up
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Open both NERDTree and Startify when start up
"autocmd VimEnter *
"            \   if !argc()
"            \ |   Startify
"            \ |   NERDTree
"            \ |   wincmd w
"            \ | endif
"
"}}}

" Welcome Page{{{

let g:startify_custom_header = [
\ '                             ███████████               ',
\ '                          ███████████████████               ',
\ '                         ███████████████████                ',
\ '                         ██████████████████████░            ',
\ '           ██░           █████████████████████████░░        ',
\ '            ░██░        ███████████████████████████░       ',
\ '               ░██░    █████████████████████████████████░   ',
\ '                 ████████████████████████████████████████░  ',
\ '                    ███████████████████████████████████░    ',
\ '   █████     ███  ░█████████████████████████░░░             ',
\ '    █████     █    ███░░██████████████████████░             ',
\ '    █  ████░  █    ███   ░████████████████████████░         ',
\ '    █   █████ █    ███████░  ██████████████████████░        ',
\ '    █        ██    ███░         ████████████████████        ',
\ '   ███       ██  ░░████████░     ░███████████████████       ',
\ '                                   ██████████████████       ',
\ '                     █████████░   ░███████████████████      ',
\ '                       ███   ████  ░██░  ████████████░      ',
\ '                       ███   ░███    ██░  ████████████      ',
\ '                       ███░████░     ░██░  ██████████░      ',
\ '                       ███ ███░       ░██░ ██ ░███████  ',
\ '                       ███   ████      ░███    ██████░  ',
\ '                       ███    ████░     ░█      ░████░  ',
\ '                                                  ███   ',
\ '                                                   ░█░  ',
\]

" }}}
" }}}
"end
"}}}
"

" vim diff {{{
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" }}}
