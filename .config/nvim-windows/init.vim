set number
set mouse=a
"Identention
set autoindent
set ai
set si
set tabstop=4
set softtabstop=2 "number of spaces in tab when editing
set shiftwidth=2 "number of spaces to use for autoindent

" Tmux | Theme 
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

runtime plug.vim
runtime colors/config.lua

" Mapping
nnoremap <F2> :update<cr>
nnoremap <F3> :quit<cr>

"Identention on python and php
autocmd FileType python setlocal shiftwidth=4 softtabstop=4
autocmd FileType php setlocal shiftwidth=4 softtabstop=4

" Graphql
au BufNewFile,BufRead *.prisma,*.graphql,*.graphqls,*.gql setfiletype graphql

" Some Extensions need python to work
let g:python3_host_prog = expand('C:\Users\maxma\AppData\Local\Programs\Python\Python310\python.exe')

if has('python')
  set pyx=2
elseif has('python3')
  set pyx=3
endif

function Replace(current, new_value)
  exe '%s/' . a:current . '/' . a:new_value . '/g'
endfunction
