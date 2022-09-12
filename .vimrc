""""""""""""""""""""""""""""""""""
" __     ___                     "
" \ \   / (_)_ __ ___  _ __ ___  "
"  \ \ / /| | '_ ` _ \| '__/ __| "
"   \ V / | | | | | | | | | (__  "
"    \_/  |_|_| |_| |_|_|  \___| "
"                                " 
""""""""""""""""""""""""""""""""""

" config for vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" config <leader> -> <space>
let mapleader = "\<space>"

" use jj as <esc>
inoremap jj <esc>

" some configure
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
syntax on
" set mouse=a
set encoding=utf-8
set hidden
set number
set relativenumber
set hlsearch
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set list " 显示每行的末尾
set listchars=tab:▸\ ,trail:▫
set scrolloff=8
set guifont=Consolas
set autochdir
set backspace=2 " 解决backspace键无法退格到上一行的问题
colorscheme desert
set laststatus=2

" use <up> <down> <left> <right> to change size of window
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" use Ctrl+jkhl to switch window
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" use  Ctrl+JKHL to move window
noremap <leader>wj <C-w>J
noremap <leader>wk <C-w>K
noremap <leader>wh <C-w>H
noremap <leader>wl <C-w>L

" move text up and down
" vnoremap <A-j> :m .+1<CR>==
" vnoremap <A-k> :m .-2<CR>==
xnoremap <A-j> :m '>+1<CR>gv
xnoremap <A-k> :m '<-2<CR>gv

" shiftwidth
xnoremap > >gv
xnoremap < <gv

" use <leader>rc to open .vimrc
nnoremap <leader>rc :e $MYVIMRC<CR>

" Spelling check with <space>sc 
map <LEADER>sc :set spell!<CR>
" use <LEADER>st to open spell check trigger
noremap <LEADER>st ea<C-x>s

" coc.nvim config
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" nodejs path for coc.nvim
" let g:coc_node_path = '$VIM/nodejs/node.exe'

" coc-setting.json for coc.nvim
" let g:coc_config_home = '$VIM/vimfiles/'

" plug-in init
silent! call plug#begin('~/.vimfiles/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree' 
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
" Plug 'vhda/verilog_systemverilog.vim'
Plug 'preservim/tagbar'
" Plug 'Konfekt/FastFold'
Plug 'HonkW93/automatic-verilog'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

" auto open indent guid on vim startup
let g:indent_guides_enable_on_vim_startup = 1

" undotree Config
map <LEADER>utt :UndotreeToggle<CR>

" use <f9> to open/close indent guides
inoremap <f9> <Esc>:IndentGuidesToggle<CR>
map <f9> <Esc>:IndentGuidesToggle<CR>


" Markdown Preview
autocmd BufNewFile,BufRead *.md noremap <F5> :MarkdownPreview<CR>


"""""""""""""""""""""""""verilog-automatic"""""""""""""""""""""""
autocmd BufNewFile,BufRead *.v noremap <F6> :call AutoInst(0)<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LeaderF map
let g:Lf_ShortcutF = '<leader>lff'
let g:Lf_ShortcutB = '<leader>lfb'
nnoremap <leader>lft :LeaderfTag<CR>
nnoremap <leader>lfl :LeaderfLine<CR>
nnoremap <leader>lfF :LeaderfFunction<CR>

" tagbar config
nmap <F8> :TagbarToggle<CR>
" config ctags path for tagbar
" let g:tagbar_ctags_bin = '$VIM/extools/ctags/ctags.exe'
" tagbar config for systemverilog
let g:tagbar_type_systemverilog = {
    \ 'ctagstype': 'systemverilog',
    \ 'kinds' : [
         \'A:assertions',
         \'C:classes',
         \'E:enumerators',
         \'I:interfaces',
         \'K:packages',
         \'M:modports',
         \'P:programs',
         \'Q:prototypes',
         \'R:properties',
         \'S:structs and unions',
         \'T:type declarations',
         \'V:covergroups',
         \'b:blocks',
         \'c:constants',
         \'e:events',
         \'f:functions',
         \'m:modules',
         \'n:net data types',
         \'p:ports',
         \'r:register data types',
         \'t:tasks',
     \],
     \ 'sro': '.',
     \ 'kind2scope' : {
        \ 'K' : 'package',
        \ 'C' : 'class',
        \ 'm' : 'module',
        \ 'P' : 'program',
        \ 'I' : 'interface',
        \ 'M' : 'modport',
        \ 'f' : 'function',
        \ 't' : 'task',
     \},
     \ 'scope2kind' : {
        \ 'package'   : 'K',
        \ 'class'     : 'C',
        \ 'module'    : 'm',
        \ 'program'   : 'P',
        \ 'interface' : 'I',
        \ 'modport'   : 'M',
        \ 'function'  : 'f',
        \ 'task'      : 't',
     \ },
     \}

" NERDTree config
" start NERDTree while vim init
" autocmd VimEnter * NERDTree | wincmd p
let NERDTreeShowHidden = 1
noremap <F3> :NERDTreeToggle<CR><C-w>l 
let NERDTreeChDirMode = 2


" Airline
let g:airline#extension#tabline#enbaled=1   " 开启 tab 栏
let g:airline_theme='powerlineish'

""""""""""""""""""""""""""""""""""""""
""""""""""""""ale config"""""""""""""" 
map <F4> :ALEToggle<CR>
nmap <silent> <leader>an <Plug>(ale_next_wrap)
nmap <silent> <leader>ap <Plug>(ale_previous_wrap)
let g:ale_linters = {
            \'verilog': ['xvlog'],
            \'vhdl':    ['xvhdl']
            \}
let g:ale_linters_explicit          = 1
" Set this. Airline will handle the rest.
let g:airline#extension#ale#enbaled = 1
let g:ale_echo_msg_error_str        = 'Error'
let g:ale_echo_msg_warning_str      = 'Warning'
" let g:ale_echo_msg_format           = '[%serverity%] %s'
let g:ale_sign_error                = ">>"
let g:ale_sign_warning              = "--"

let g:ale_lint_on_text_changed      = 0
let g:ale_lint_on_insert_leave      = 1
let g:ale_lint_on_enter             = 0
let g:ale_enable                    = 1
" use below settings to config path for xvlog/xvhdl
" let g:ale_verilog_xvlog_executable = 'path/to/xvlog'
" let g:ale_vhdl_xvhdl_executable = 'path/to/xvhdl'
""""""""""ale config finish"""""""""""
""""""""""""""""""""""""""""""""""""""

" python configure
set pythonthreedll=$HOME/AppData/Local/Programs/Python/Python310/python310.dll
" set pythonthreehome=$VIM/python310
