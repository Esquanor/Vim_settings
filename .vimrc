
" BASICS SETTINGS --------------------------------------------------------- {{{
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set relativenumber
set cursorline
set colorcolumn=80
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
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.o
set background=dark
set backspace=indent,eol,start
set mouse=a
set hidden "mover over buffer whitout want to save file
" }}}

" PLUGINS ---------------------------------------------------------------- {{{
" Load the colorscheme
autocmd vimenter * ++nested colorscheme gruvbox

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug '42Paris/42header'
Plug 'ycm-core/YouCompleteMe'
Plug 'aperezdc/vim-template'
"Snippets
" Track the engine
Plug 'Sirver/ultisnips'
" Snippets
"Plug 'honza/vim-snippets'

call plug#end()

"YouCompleteMe
let g:ycm_clangd_binary_path='/usr/bin/clangd'
let g:ycm_python_binary_path='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_autoclose_preview_window_after_completion=1

"42 Header
let g:user42 = 'lfrederi'
let g:mail42 = 'lfrederi@student.42.fr'

"NERDTree
let g:NERDTreeMouseMode=2

"Vim-template
let g:templates_no_autocmd=1

"Engine snippets
let g:UltiSnipsEditSplit="vertical"
"Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["mySnippets"]

"Termdebug
"let g:termdebug_popup = 0
"let	g:termdebug_wide = 163

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
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTree<CR>
" You can split the window in Vim by typing :split or :vsplit.
nnoremap <c-d> :split<CR>
nnoremap <c-s> :vsplit<CR>
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Compile and run C program
nnoremap <F9> :w<CR> :!clear<CR> :!gcc -Wall -Werror -Wextra %.c;./a.out<CR>

"Buffer pluggin
noremap <c-i> :bn<CR>
noremap <c-o> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>

"End of line with ;
inoremap <c-e> <ESC>A;

"Resize windows
noremap <c-r> <c-w>=
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

augroup template
	autocmd BufNewFile *.c,*.h execute ":Template" | execute ":Stdheader"
	autocmd BufNewFile Makefile execute ":Template"
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
