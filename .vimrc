" config for vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" config <leader> -> <space>
let mapleader = "\<space>"

" use jj as <esc>
inoremap jj <esc>

" some configure
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
set guifont=Consolas
set autochdir
colorscheme desert
filetype on
syntax on
set laststatus=2



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


" plug-in init
call plug#begin('~/.vimfiles/bundle')
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
call plug#end()

" NERDTree config
nnoremap <f3> :NERDTree<CR><C-w>l 

""""""""""""""""verilog-automatic"""""""""""""""""
autocmd BufNewFile,BufRead *.v noremap <F6> :call AutoInst(0)<CR>
"""""""""""""""""""""""""""""""""""""

" LeaderF map
let g:Lf_ShortcutF = '<leader>lff'
leg g:Lf_ShortcutB = '<leader>lfb'
nnoremap <leader>lff :LeaderfFile<CR>
nnoremap <leader>lft :LeaderfTag<CR>
nnoremap <leader>lfl :LeaderfLine<CR>
nnoremap <leader>lfF :LeaderfFunction<CR>

" tagbar config
nmap <F8> :TagbarToggle<CR>
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

" start NERDTree while vim init
autocmd VimEnter * NERDTree | wincmd p
let NERDTreeShowHidden  = 1
let g:NERDTreeChDirMode = 2


" Airline
let g:airline#extension#tabline#enbaled=1   " 开启 tab 栏
""""""""""""""""""""""""""""""""""""""
""""""""""""""ale config"""""""""""""" 
map <F4> :ALEToggle<CR>
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
let g:ale_lint_on_enter             = 1
let g:ale_enable                    = 1
""""""""""ale config finish"""""""""""
""""""""""""""""""""""""""""""""""""""

" python configure
set pythonthreedll=$HOME/AppData/Local/Programs/Python/Python310/python310.dll
