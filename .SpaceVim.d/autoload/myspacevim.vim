" need to install ripgrep, python, node
function! myspacevim#before() abort
    let profile = SpaceVim#mapping#search#getprofile('rg')
    let default_opt = profile.default_opts + ['--ignore-case']
    call SpaceVim#mapping#search#profile({'rg' : {'default_opts' : default_opt}})
endfunction

function! myspacevim#after() abort
    " move text up and down
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv
    
    set scrolloff=8
    set timeoutlen=100
    let g:python3_host_prog = "python"
    let g:neomake_verilog_enabled_makers = ['xvlog']
    let g:neomake_verilog_xvlog_maker = {
        \ 'args': [],
        \ 'errorformat': '%m [%f:%l]',
        \ }
endfunction
