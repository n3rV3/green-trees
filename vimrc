set nocompatible              " be iMproved, required
set encoding=utf-8
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" """""" New additions
" Plugin 'klen/python-mode'
Plugin 'valloric/youcompleteme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/gundo.vim'
Plugin 'saltstack/salt-vim'
Plugin 'mitsuhiko/jinja2'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
" Adding scala support
Plugin 'derekwyatt/vim-scala'

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

" ====================
" """""" Custom settings for plugins
syntax enable

" vim-colors-solarized
set background=dark
let g:solarized_termcolors=256
" let g:solarized_termcolors=   16      |   256
let g:solarized_termtrans =   1
" let g:solarized_degrade   =   1
let g:solarized_bold      =   1
let g:solarized_underline =   1
let g:solarized_italic    =   1
let g:solarized_contrast  =   "normal"
let g:solarized_visibility=   "high"
colorscheme solarized

" python-mode
" Override go-to.definition key shortcut to Ctrl-]
""   let g:pymode_rope_goto_definition_bind = "<C-]>" " Override run current python
""   " file key shortcut to Ctrl-Shift-e
""   let g:pymode_run_bind = "<C-S-e>" "
""   " Override view python doc key shortcut to Ctrl-Shift-d
""   let g:pymode_doc_bind = "<C-S-d>"
""   let g:pymode_python = 'python3'
let g:pymode_options_max_line_length=140

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='powerlineish'
set laststatus=2


" vim-scala
let g:scala_scaladoc_indent = 1

" youcompleteme
let g:ycm_python_binary_path = 'python'

" ====================
" """""" End of Custom settings for plugins

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noshiftround
set expandtab         " tabs are spaces
set smarttab
set number            " show line numbers
set cursorline        " highlight current line
set lazyredraw        " don't redraw all the time, speeds up macros etc
set incsearch         " search as characters are entered
set hlsearch          " highlight search results
set visualbell        " blink cursor on error instead of beeping
nnoremap <space> :nohlsearch<CR><space> " Replace space key with nohlsearch


" Disable modelines for security
set modelines=0

set ruler             " enable ruler ?
set wrap
set textwidth=140
set formatoptions=tcroqn1j
set showcmd
set smartcase
set ignorecase
set pastetoggle=<F10>
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set nofoldenable      " disable code folding everywhere

" disables arrow keys in normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" disable arrow keys in insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" retain visual selection after move
vnoremap > >gv
vnoremap < <gv

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"

" Set space errors for python
set list
set listchars=tab:␉·,trail:␠,nbsp:⎵

" move cursor to editor lines, not actual ones
nnoremap j gj
nnoremap k gk
set hidden
set ttyfast
set history=9001
