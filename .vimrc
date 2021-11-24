" BASIC SETTINGS --------------------------------------------------------- {{{
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set relativenumber
set cursorline
set tabstop=4 "set number space about character tab
set softtabstop=4 "set number space when press <TAB>
set shiftwidth=4 "set number space shift 
set autoindent "new line inherit indentation of previous line
set smarttab "insert tabstop when <TAB>
set smartindent "smart autoindenting when starting new line
set nobackup "not save backup files
set	scrolloff=10 "not let cursor scroll below/above N lines when scrolling
set nowrap "not wrap lines
set showcmd "show partial cmd in the last line of the screen
set showmode "show the mode on the last line
set showmatch "show matching words during a search
set hlsearch "use highligthing when doing search
set wildmenu "enable autocompletion menu after pressing <TAB>
set wildmode=list:longest "Make wildmenu behave like similar to bash completion
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set background=dark

" }}}


" PLUGINS ---------------------------------------------------------------- {{{
" Load the colorscheme
autocmd vimenter * ++nested colorscheme gruvbox

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'ycm-core/YouCompleteMe'

call plug#end()

"YouCompleteMe
let g:ycm_clangd_binary_path='/opt/homebrew/opt/llvm/'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" }}}


" MAPPINGS --------------------------------------------------------------- {{{

"Type jj to exit insert mode quickly
inoremap jj <ESC> 
"Press space bar to type : in n mode
nnoremap <space> :
"Press o or O and exit insert mode
nnoremap o o<ESC>
nnoremap O O<ESC>
"Center the cursor vertically when moving next word during a search
nnoremap n nzz
nnoremap N Nzz
"Copy and paste the entery line at the next line
nnoremap <c-v> Vyp
"Search a word
nnoremap S y*
"Yank from cursor to the end of line
nnoremap Y y$
nnoremap <c-C> Vy
"Shortcut open/close NERDTree
map <F1> :NERDTreeToggle<CR>
map <F2> :NERDTree<CR>
" You can split the window in Vim by typing :split or :vsplit.
nnoremap <c-d> :split<CR>
nnoremap <c-s> :vsplit<CR>
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Compile and run C program
nnoremap <F9> :w<CR> :!clear<CR> :!gcc -Wall -Werror -Wextra *.c;./a.out<CR>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" You can split  window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline 
    autocmd WinEnter * set cursorline 
augroup END

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

set statusline=  "Clear status line when vimrc is reloaded
set statusline+=\ %F\ %M\ %Y\ %R "Status line left side
set statusline+=%= "Use a divider to separate left and right side
" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2 "Show the status on the second to last line.

" }}}
