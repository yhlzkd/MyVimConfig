" config for vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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

nnoremap <f3> :NERDTree<CR><C-w>l 

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

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
call plug#end()

" start NERDTree while vim init
autocmd VimEnter * NERDTree | wincmd p
let NERDTreeShowHidden = 1

set laststatus=2

" Airline
let g:airline#extension#tabline#enbaled=1   " 开启 tab 栏

" python configure
set pythonthreedll=/Users/yhlzk/AppData/Local/Programs/Python/Python310/python310.dll
