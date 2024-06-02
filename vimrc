"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic — @amix3k
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> Plugins
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Fast editing and reloading of vimrc configs
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Misc
"    -> Helper functions
"    -> Plugin configurations
"    -> Further configurations
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Installation Pluginmanager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'machakann/vim-highlightedyank' " Anzeige kopierter Texte
    Plug 'ctrlpvim/ctrlp.vim'            " CtrlP
    Plug 'yegappan/mru'                  " Most Recently Used über :MRU 
    Plug 'preservim/nerdtree'            " Erweiterter Filebrowser
    Plug 'Xuyuanp/nerdtree-git-plugin'   " Anzeige von Git Status
    Plug 'mbbill/undotree'               " Anzeigen von alten Revisionen
    Plug 'itchyny/lightline.vim'         " Statuszeile mit mehr Informationen
    Plug 'machakann/vim-highlightedyank' " Anzeige kopierter Texte
    Plug 'ryanoasis/vim-devicons'        " 
    Plug 'xuhdev/vim-latex-live-preview' " LaTeX Preview
    Plug 'neomake/neomake'               " Make
    Plug 'vim-test/vim-test'
call plug#end() " Plugins aktivieren

" Automatisch fehlende Plugins installieren
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>""

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" linenumbers
set number 

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" cursorcolumn and cursorline
set cursorline
highlight CursorLine ctermbg=8 ctermfg=15 "8 = dark gray, 15 = white
highlight ColorColumn ctermbg=magenta
call matchadd('colorColumn','\%81v', 100)

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell

set tm=500

" Properly disable sound on errors on MacVim
if has("gui_running")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable 

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Colorsheme
set background=dark
colors peaksea

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    " set guifont=Inconsolata-Regular:h16  
    set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h15
endif

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Useful mappings for managing tabs
" create, next and previous
map <leader>tc :tabnew<cr>
nnoremap <silent> <leader><Up> :tabnew<CR>
nnoremap <silent> <leader><Down> :tabclose<CR>
nnoremap <silent> <leader><Left> :tabprevious<CR>
nnoremap <silent> <leader><Right> :tabnext<CR>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2
set cmdheight=2
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using Ctrl+[jk]
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>
au BufRead,BufNewFile ~/buffer.md iab <buffer> xh1 ===========================================

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Ctrl-P, MRU and Buffer
map <C-p> :CtrlP<CR>
map <C-o> :CtrlPMRU<CR>
map <C-b> :CtrlPBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ### UndoTree
map <leader>u :UndotreeToggle<CR>
" ### NERDTree 
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 0
let g:nerdtree_open = 0
function! StartUp() 
    if 0 == argc()
        NERDTree
        let g:nerdtree_open = 1
    end
endfunction
map <leader>o :NERDTreeToggle<CR>
autocmd VimEnter * call StartUp()    " Nerdtree anzeigen beim Start, wenn man keine Datei öffnet

" ### NeoMake
call neomake#configure#automake('nrwi', 500)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Further configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" path to fzf
set rtp+=${HOME}/bin/fzf

" source plugin_config.vim
if filereadable(expand("$HOME/.vim/plugin_config.vim"))
  source $HOME/.vim/plugin_config.vim
endif

" source user-specific local configuration file
if filereadable(expand("$HOME/.vimrc.local"))
  source $HOME/.vimrc.local
endif

"# END OF FILE #################################################################
