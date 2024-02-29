" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    
    Plugin 'davidhalter/jedi-vim'
        set completeopt-=preview
        noremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
        let g:jedi#use_splits_not_buffers = "bottom"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"}}}

" Basics {{{
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

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

" Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable

set background=dark

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

augroup silent
    autocmd!
    autocmd TextChanged,TextChangedI <buffer> silent write
augroup end
set backspace=indent,eol,start

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set breakindent " indent with wrapping

"turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
augroup line
    autocmd!
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup end
" Always show the status line
set laststatus=2

" Format the status line
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

setlocal spell
set spelllang=en_us
inoremap <C-s> <c-g>u<Esc>[s1z=`^a<c-g>u

set foldenable
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldnestmax=0
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim set foldlevelstart=0
    autocmd FileType vim setlocal foldmarker={{{,}}}
augroup end

augroup filetype_python
    autocmd!
    au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix
    "au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
    "autocmd FileType python set foldmethod=indent
    "autocmd FileType python set foldlevel=99
augroup end

"}}}

" Helper Functions {{{
function! s:TexFocusVim() abort
    silent execute "!open -a iTerm"
    redraw!
endfunction

augroup cimtex_event_focus
    au!
    au User VimtexEventViewReverse call s:TexFocusVim()
augroup END
"}}}

" VimPlug {{{
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'lervag/vimtex'
    set nocompatible
    let &rtp = '~/.vim/plugged/vimtex,' . &rtp
    let &rtp .= ',~/.vim/plugged/vimtex/after'
    filetype plugin indent on
    syntax enable
"    let g:vimtex_syntax_conceal=1
"    let g:vimtex_latexmk_continuous=0
    let g:tex_flavor='lualatex'
"    let g:Tex_DefaultTargetFormat='pdf'
    let g:vimtex_view_enabled=1
"    let g:vimtex_view_automatic=1
"    let g:vimtex_view_general_viewer='skim'
    let g:vimtex_view_method='skim'
    let g:vimtex_quickfix_mode=0
"    let g:vimtex_compiler_latexmk = {
"      \  'callback' : 0,
"      \}

Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'

Plug 'tmhedberg/SimpylFold'

call plug#end()

set rtp+=~/.vim/UltiSnips/greek
colorscheme onedark

" }}}

"Mappings {{{

"Move with wrap enabled
nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

inoremap jk <esc>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z

let $MYVIMRC="~/.vimrc"
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>es :vsp /Users/dhruvbhatia/.vim/UltiSnips/tex.snippets<cr>
nnoremap <leader>ep :vsp /Users/dhruvbhatia/Desktop/projects/latex/templates/hw-shortcuts.sty<cr>
nnoremap <leader>r :redraw!<cr>
nnoremap <leader>o :silent exec '!open -a skim %:r.pdf'<cr> :redraw!<cr>

inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

"only for use while updating your CV
noremap <leader>m :make cv.pdf -C ~/Desktop/projects/latex/Awesome-CV <cr>
"}}}

