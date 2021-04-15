" Initial mapping
nnoremap <silent> <C-N> :Fern %:h -drawer -toggle -keep<CR><CR>

" Init 
function! s:init_fern() abort
  " Define NERDTree like mappings
  nmap <buffer> o <Plug>(fern-action-open:edit)
  nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p
  nmap <buffer> ma <Plug>(fern-action-new-path)
  nmap <buffer> P gg
  nmap <buffer> <S-h> <Plug>(fern-action-leave)

  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> R <Plug>(fern-action-rename)
  nmap <buffer> cd <Plug>(fern-action-cd)
  nmap <buffer> CD gg<Plug>(fern-action-cd)<C-o>

  nmap <buffer> I <Plug>(fern-action-hidden)
  nmap <buffer> . <Plug>(fern-action-hidden)

  nmap <buffer> q :<C-u>quit<CR>
endfunction

" Init
augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
  autocmd FileType fern set nonu
  autocmd FileType fern set signcolumn=no
  autocmd VimEnter * ++nested Fern %:h -drawer -toggle 
augroup END

" Set the render to Nerdfonts
let g:fern#renderer = "nerdfont"
