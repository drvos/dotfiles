"""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
execute pathogen#infect()
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => Dirvish plugin
""""""""""""""""""""""""""""""
map <leader>d :Dirvish<cr>
""""""""""""""""""""""""""""""
" => MRU plugin 
" (Most Recently Used Files)
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
let g:fzf_mru_no_sort = 1
map <leader>f :FZFMru<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = { 'colorscheme': 'wombat', }
