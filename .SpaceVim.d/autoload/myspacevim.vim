" need to install ripgrep, python, node
function! myspacevim#before() abort
    let profile = SpaceVim#mapping#search#getprofile('rg')
    let default_opt = profile.default_opts + ['--ignore-case']
    call SpaceVim#mapping#search#profile({'rg' : {'default_opts' : default_opt}})
endfunction

function! myspacevim#after() abort
    set scrolloff=8
    set timeoutlen=100
    let g:python3_host_prog = "python"
    let g:neomake_verilog_enabled_makers = ['xvlog']
    let g:neomake_verilog_xvlog_maker = {
        \ 'args': [],
        \ 'errorformat': '%m [%f:%l]',
        \ }
endfunction
