" Uncomment this if running Arch
" runtime! archlinux.vim
"
" To download plug, do this:
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" The colorscheme is located here:
" curl -fLo ~/.config/nvim/colors/SerialExperimentsLain.vim --create-dirs \
"   https://raw.githubusercontent.com/ThomasLagace/SerialExperimentsLain/master/colors/SerialExperimentsLain.vim
"
" Python is also needed.
" You will need to run:
" pip{2,3} install --upgrade neovim
" for proper python support in neovim.
"
" Note: the below will only work in neovim.

let g:python_host_prog  = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3'

" Needed python packages:
" Also: pip{2,3} install --upgrade neovim

" Plug stuff below
call plug#begin('~/.local/share/nvim/plugged')

" Plugins go below
Plug 'jiangmiao/auto-pairs'       " Auto pair creation
Plug 'scrooloose/nerdtree'        " File viewer
Plug 'xolox/vim-misc'             " For vim-easytags
Plug 'xolox/vim-easytags'         " Streamlines tagging operations
Plug 'fidian/hexmode'             " Adds a hex editor
Plug 'vim-airline/vim-airline'    " Peep that status bar, bro
Plug 'vim-airline/vim-airline-themes'         " Eyecandy for the previous
Plug 'majutsushi/tagbar'

" Neovim specific
Plug 'neomake/neomake'            " Linting
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  } " Also: pip{2,3} install --upgrade neovim
else
	Plug 'Shougo/deoplete.nvim' 
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()
" Remember to :PlugInstall 

" Quality of Life

filetype plugin indent on
syntax enable

" Disable beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

set laststatus=2 " Always display the statusline in all windows
set showtabline=1 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set selectmode=mouse
set mouse=a
set nobackup
set nowritebackup
set history=50
set ruler
set backspace=indent,eol,start
set autoread
set wildmenu " command-line completion operates in an enhanced mode, <Tab> to play

set number
set encoding=utf-8

set incsearch " CTRL-G and CTRL-T keys to move to the next and previous match
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

colorscheme SerialExperimentsLain
" wget 

" PHP coding niceties
let php_sql_query = 1
let php_htmlInStrings = 1

" Plugin configs below

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Airline
let g:airline_theme='simple'
let g:airline_powerline_fonts=1

" Easytags
let g:easytags_async = 1 " Might not work lmao
set tags=./tags;
let g:easytags_dynamic_files = 1 " Per-project tags files
:let g:easytags_resolve_links = 1 " Resolve hard/soft links in UNIX

" Hex editor mode
map <C-h> :Hexmode<CR> " ctrl + h
let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.out'
let g:hexmode_autodetect = 1

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


" Neovim specific stuff below

" Neomake
function! MyOnBattery()
    if filereadable('/sys/class/power_supply/AC/online') 
       return readfile('/sys/class/power_supply/AC/online') == ['0']
    endif
    return 0
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

" deoplete
call deoplete#enable()



" Merlin -- does not work :(
" let g:opamshare = substitute(system('opam config var share'), '\n$', '', '''')
" execute 'set rtp+=' . g:opamshare . '/merlin/vim/'
" execute "helptags " . g:opamshare . '/merlin/vim/doc/'
