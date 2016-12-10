call plug#begin('~/.vim/plugged')

"Plug 'dracula/vim'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'https://github.com/vim-scripts/mru.vim.git'
Plug 'https://github.com/c9s/perlomni.vim.git'
Plug 'https://github.com/vim-scripts/cmdalias.vim.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/vim-scripts/taglist.vim.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/vim-scripts/mimicpak.git'
Plug 'https://github.com/godlygeek/csapprox.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/Shougo/neomru.vim.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/mileszs/ack.vim.git'
Plug 'https://github.com/autowitch/hive.vim.git'
Plug 'https://github.com/Shougo/unite.vim.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
if v:version >= 704
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'vim-syntastic/syntastic'
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

call plug#end()

" This is the template .vimrc
"
" Some defaults to start off with
" F2 = toggle line numbering
" F3 = toggle showing invisible characters
" F4 = previous color scheme
" F5 = next color scheme

"let g:molokai_original = 1

set autoread " detect when a file is changed


syntax on                       " Syntax highlighting
set background=dark             " Terminal with a dark background
set t_Co=256
colorscheme molokai " Color scheme
set expandtab                   " Make a tab to spaces, num of spaces set in tabstop
set shiftwidth=4                " Number of spaces to use for autoindenting
set tabstop=4                   " A tab is four spaces
set smarttab                    " insert tabs at the start of a line according to
set list                        " show invisible characters
set listchars=tab:>·,trail:·    " but only show tabs and trailing whitespace
set number                      " Enable line numbers
set numberwidth=3               " Line number width
set showmatch                   " show matching paranthesis
set visualbell                  " don't beep
set noerrorbells                " don't beep
set mouse=a
set ttymouse=xterm2
set history=1000                " change history to 1000

set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep

set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping


" Make star * command stay on current word
"nmap <silent> * :let @/='\<'.expand('<cword>').'\>'<CR>

" Unite mappings
nnoremap <C-l> :Unite file file_rec<CR>

" Set f2 to toggle line numbers
nmap <f2> :set number! number?<cr>
" Set f3 to toggle showing invisible characters
nmap <f3> :set list! list?<cr>
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight NonText ctermfg=8 guifg=gray
" work around booking shit
" let g:syntastic_puppet_validate_disable = 1
" let g:syntastic_puppet_lint_disable = 1

"source ~/.vim/cyclecolor.vim

""execute pathogen#infect()
" help vim find docs
"Helptags

" Airline status bar
set laststatus=2
set ttimeoutlen=50

"set AirlineTheme wombat
let g:airline_theme='wombat'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-go (https://github.com/fatih/vim-go)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_play_open_browser = 0
"let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
"let g:go_fmt_autosave = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-rust (https://github.com/rust-lang/rust.vim)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic (https://github.com/scrooloose/syntastic)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_syntastic_go_gofmt_checker = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck' ]
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['perl','go'] }
let g:syntastic_c_checkers = [] " disable syntastic for C (it's buggy)
let g:syntastic_java_checkers = [] " disable syntastic for Java (it's buggy)
let g:syntastic_enable_perl_checker = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1




set cursorline

if &term == "screen"
  set t_Co=256
endif

let g:go_fmt_command = "goimports"
set autoindent
set smartindent
"source ~/.fzf/plugin/fzf.vim

" Ctrl + Return between braces will put your cursor where you want it to be
" imap <C-Return> <CR><CR><C-o>k<Tab>
imap <C-f> <plug>(fzf-complete-line)

" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

let g:fzf_layout = { 'down': '~25%' }
nmap <leader><tab> <plug>(fzf-maps-n)

nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <leader>t :tabedit<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>r :Mru<CR>

" Remap VIM 0 to first non-blank character
map 0 ^
