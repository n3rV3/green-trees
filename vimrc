set nocompatible              " be iMproved, required
set encoding=utf-8
filetype off                  " required
set term=xterm-256color

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'L9'
" """""" New additions
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'metakirby5/codi.vim'
Plugin 'mitsuhiko/jinja2'
Plugin 'bash-support.vim'
Plugin 'python-rope/rope'
" Plugin 'python-mode/python-mode'
Plugin 'saltstack/salt-vim'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme', {'do': './install.py --clang-completer'}
" Adding scala support
Plugin 'derekwyatt/vim-scala'
" Themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'reedes/vim-thematic'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Python
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'

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

let g:thematic#themes = {
\  'solarized_dark': {
\     'colorscheme': 'solarized',
\     'background': 'dark',
\     'diff-color-fix': 1,
\     'sign-column-color-fix': 1,
\     },
\  'solarized_light': {
\     'colorscheme': 'solarized',
\     'background': 'light',
\     'diff-color-fix': 1,
\     'sign-column-color-fix': 1,
\     },
\  'pencil_dark': {
\     'colorscheme': 'pencil',
\     'background': 'dark',
\     'airline-theme': 'badwolf',
\     'typeface': 'Cousine',
\     },
\  'molokai': {
\     'colorscheme': 'molokai',
\     'background': 'dark',
\     'airline-theme': 'badwolf',
\     'typeface': 'Cousine',
\   },
\  'jellybeans': {
\     'colorscheme': 'jellybeans',
\     'background': 'dark',
\     'airline-theme': 'badwolf',
\     'typeface': 'Cousine',
\   },
\  'gruvbox': {
\     'colorscheme': 'gruvbox',
\     'background': 'dark',
\     'airline-theme': 'badwolf',
\     'typeface': 'Cousine',
\   },
\  'pencil_light': {
\     'colorscheme': 'pencil',
\     'background': 'light',
\     'airline-theme': 'badwolf',
\     'typeface': 'Cousine',
\     },
\}

let g:thematic#theme_name = 'solarized_dark'

" Solarized settings
let g:solarized_bold      =   1
let g:solarized_underline =   1
let g:solarized_italic    =   1
let g:solarized_contrast  =   "normal"
let g:solarized_visibility=   "high"
" The following settings are not compatible with iTerm2
" let g:solarized_termcolors=256
" let g:solarized_termcolors=   16      |   256
" let g:solarized_termtrans =   1
" let g:solarized_degrade   =   1

" python-mode
" Override go-to.definition key shortcut to Ctrl-]
""   let g:pymode_rope_goto_definition_bind = "<C-]>" " Override run current python
""   " file key shortcut to Ctrl-Shift-e
""   let g:pymode_run_bind = "<C-S-e>" "
""   " Override view python doc key shortcut to Ctrl-Shift-d
""   let g:pymode_doc_bind = "<C-S-d>"
""   let g:pymode_python = 'python3'
"" let g:pymode_options_max_line_length=140

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

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Invoke Flake8 on file save
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_in_file=1  " show
" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg

" auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" gundo.vim
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1


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

" Set space errors for python
set list
set listchars=tab:␉·,trail:␠,nbsp:⎵

" move cursor to editor lines, not actual ones
nnoremap j gj
nnoremap k gk
set hidden
set ttyfast
set history=9001

" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>

" adding ctags
set tags=~/Documents/my_ctags

" NerdTree ignore
let NERDTreeIgnore=['\.pyc$', '\~$', '\.sw.$'] "ignore files in NERDTree
