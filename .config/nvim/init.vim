" My neovim config is very messy. Many things are commented to
" demystify it all. I need the help too when I look back on it.

" ----------
" ESSENTIALS
" ----------
if has('nvim') " Set some nvim specific variables before delving deeper
    let g:python_host_prog  = '/usr/bin/python2.7'
    let g:python3_host_prog = '/usr/bin/python3'
endif

" -----------------
" PLUGIN MANAGEMENT
" -----------------

" Shoutouts to Shougo for his excellent plugins!
call plug#begin('~/.local/share/nvim/plugged')

" Plugins go below
Plug 'jiangmiao/auto-pairs'       " Auto pair creation
Plug 'scrooloose/nerdcommenter'   " Autocommenter
Plug 'xolox/vim-misc'             " For vim-easytags
Plug 'fidian/hexmode'             " Adds a hex editor
Plug 'vim-airline/vim-airline'    " Peep that status bar, bro
Plug 'vim-airline/vim-airline-themes' " Eyecandy for the previous
Plug 'majutsushi/tagbar'          " Hit f8 to see file's tags
Plug 'itchyny/vim-cursorword'     " Underline word under cursor
Plug 'scrooloose/nerdtree'        " File viewer
Plug 'thinca/vim-ref'             " Integrated reference viewer
Plug 'ThomasLagace/wal.vim'       " Syncs colorscheme with wallpaper, my patch for a dark scheme
Plug 'junegunn/goyo.vim'          " Distraction-free editing. <F5> to play.

" Neovim specific stuffs

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  } " Keyword completion
    Plug 'neomake/neomake'        " Linting
    Plug 'c0r73x/neotags.nvim'    " Like easytags, but asyncronously
    if has('python3')
        Plug 'Shougo/denite.nvim' " Helm for nvim, needs more configuration
    endif
else
	Plug 'Shougo/deoplete.nvim' 
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'xolox/vim-easytags'     " Streamlines tagging operations
endif

" Buncha' language enhancements
Plug 'sheerun/vim-polyglot'

" Snippits and completions
Plug 'Shougo/neosnippet.vim'      " Code snippits
Plug 'Shougo/neosnippet-snippets' " Code snippit files

Plug 'ternjs/tern_for_vim'        " JS tagging, { 'do': 'npm install -g tern' } does not work (run as root) but still needed
Plug 'moll/vim-node'              " NodeJS completion
Plug 'carlitux/deoplete-ternjs'   " JS Tagging for deoplete
if has('python3')
    Plug 'zchee/deoplete-jedi'    " Python deoplete completion
endif
Plug 'Rip-Rip/clang_complete'     " C++ completion
Plug 'lervag/vimtex'              " LaTeX completions n stuffs

Plug 'elixir-lang/vim-elixir'     " Elixir highlighting
Plug 'slashmili/alchemist.vim' " Elixir completion

call plug#end()
" Remember to :PlugInstall 

" ---------------
" QUALITY OF LIFE
" ---------------

filetype plugin indent on
syntax enable

" Disable beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set laststatus=2    " Always display the statusline in all windows
set showtabline=1   " Display tabline when tabs are for to be have
set noshowmode      " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set tabstop=4       " A tab = 4 spaces
set shiftwidth=4
set expandtab       " Insert spaces instead of a tab character
set autoindent      " Auto indents code
"set selectmode=mouse
"set mouse=a        " Only n00bs use the mouse
set history=50
set ruler           " Shows what line you're on
set backspace=indent,eol,start " Map the backspace to some rational operations
set autoread        " Automatically reload a file if it's been changed (or try to)
set wildmenu        " command-line completion operates in an enhanced mode, <Tab> to play

set number          " Shows current line number
set relativenumber  " Shows line numbers relative to the current line
set encoding=utf-8  " Sets document encoding
set tags=./.tags;   " Hide tags file

set incsearch " CTRL-G and CTRL-T keys to move to the next and previous match

" Directories.
set backupdir=~/.local/share/nvim/backup
set directory=~/.local/share/nvim/swap
set undodir=~/.local/share/nvim/undo


" Colors match desktop background
colorscheme wal

" PHP coding niceties
let php_sql_query = 1
let php_htmlInStrings = 1

" Turn on spellchecking
map <F2> :setlocal spell! spelllang=en_us<CR>

" Custom keybindings
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
" Disable ex mode
noremap Q <nop>
" ALT+{h,j,k,l} to switch windows in all modes
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Terminal mode in neovim (cool!)
if has('nvim')
    tnoremap <C-\><C-\> <C-\><C-n> " CTRL + \ twice to exist terminal-mode.
    " Now, simulate i_CTRL-R in terminal-mode, see :help registers
    " and :help i_CTRL-R
    tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
    "Use ALT+{h,j,k,l} to navigate windows from t3h terminal.
    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
endif

    

" --------------------
" PLUGIN CONFIGS BELOW
" --------------------

let g:polyglot_disabled = ['latex']
" vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-pvc',
    \ ],
    \}

" Distraction-free editing mode
map <F3> :Goyo<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Airline
let g:airline_theme='wal'       " Keep up to date with the rest of the computer
let g:airline_powerline_fonts=1 " Needs a powerline compatible font

" "If you're doing a text search in this document for the word 'butts,' 
" the good news is that it's here, but the bad news is that it only appears in 
" this unrelated quote." -- Randall Munroe


" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

if has('nvim')
    " neotags
    " Works well with universal ctags
    let g:neotags_file = './.tags' " Set tag file
    let g:neotags_enabled = 1      " Enable it
    " `extras` may need to be changed depending on the ctags version
    let g:neotags_ctags_args = [   
                \ '--fields=+l',
                \ '--c-kinds=+p',
                \ '--c++-kinds=+p',
                \ '--sort=yes',
                \ '--extras=+q', 
\ ]
else
    " Easytags -- needs standard ctags instead of universal ctags
    let g:easytags_async = 1 " Might not work lmao
    let g:easytags_dynamic_files = 1 " Per-project tags files
    let g:easytags_resolve_links = 1 " Resolve hard/soft links in UNIX
endif

" Hex editor mode
map <C-h> :Hexmode<CR> " ctrl + h
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.out'
let g:hexmode_autodetect = 1


" Neovim specific stuff below

" Neomake
function! IsOnBattery()
    if filereadable('/sys/class/power_supply/AC/online') 
       return readfile('/sys/class/power_supply/AC/online') == ['0']
    endif
    return 0
endfunction

if IsOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

" deoplete
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Completion libraries:

" C++
let g:clang_library_path='/usr/lib64/libclang.so' " At least working on Arch...
                                                  " I hope it works on
                                                  " everything
