" Bar layout
let g:lightline = {
  \   'active': {
  \   'left': [[ 'mode', 'paste' ], [ 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status'  ]]
  \   }
  \ }

" Register compoments
call lightline#coc#register()

" Set gruvbox colorscheme
let g:lightline.colorscheme = 'gruvbox'

" Misc
set laststatus=2
set noshowmode
if !has('gui_running')
  set t_Co=256
endif
