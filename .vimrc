set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins
Plugin 'jiangmiao/auto-pairs'                    " paren completion
Plugin 'scrooloose/syntastic'                    " syntax checking
Plugin 'jelera/vim-javascript-syntax'            " improved js syntax highlighting
Plugin 'othree/javascript-libraries-syntax.vim'  " support for common js libraries
Bundle 'matze/vim-move'

Plugin 'francoiscabrol/ranger.vim'               " alternative to nerdtree

Plugin 'maralla/completor.vim'                   " vim8 completion engine

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

set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
set cursorline

" enable syntax hilighting with solarized colorscheme
syntax enable
set background=dark
colorscheme solarized

" enable mouse
set mouse=a

" enable line break traversal line breaks with arrow keys
set whichwrap=b,s,<,>,[,]

" enable line numbers
set number

" line numbers get special background
highlight LineNr ctermfg=grey ctermbg=black

" enable opening files at last cursor position

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" set up powerline
set rtp+=$HOME/.local/lib/python3.6/site-packages/powerline/bindings/vim/
let g:powerline_pycmd = 'py3'
set laststatus=2
set t_Co=256

" make tabs not massive
set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab

" syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" terminator is a bitch
let g:move_key_modifier = 'C'

" bind file tree toggle
map <C-n> :NERDTreeToggle<CR>

" open file tree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" NERDTress highlight the full name
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" tell the completion engine where the semantic completers are
let g:completor_python_binary = '/usr/lib/python3.6/site-packages/jedi' " python
let g:completor_racer_binary  = '/usr/bin/racer'                        " rust
let g:completor_node_binary   = '/usr/bin/node'                         " javascript
let g:completor_clang_binary  = '/usr/bin/clang'                        " c family

" use tab to select completion option
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
