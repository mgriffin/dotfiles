set nocompatible               " be iMproved
filetype off                   " required!
set background=dark
syntax on
set nobackup
set noswapfile
set t_Co=256 " needed to tell the colorscheme that we can use the good colours
set hidden " to allow buffers to be hidden with pending changes
set encoding=utf-8

colorscheme solarized

set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard
" Match and search
set hlsearch " highlight search
set ignorecase " Do case in sensitive matching with
set smartcase " be sensitive when there's a capital letter
set incsearch "
nnoremap <F3> :nohl<CR>
map <silent> <F2> :set invnumber<cr>

set backspace=indent,eol,start " more powerful backspacing

set tabstop=2 " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

" use comma as <Leader> key instead of backslash
let mapleader=","

nnoremap <F4> :buffers<CR>:buffer<Space>
nnoremap <leader><leader> <c-^>

" Visual
set nonumber " Line numbers off
set showmatch " Show matching brackets.
set matchtime=5 " Bracket blinking.
set novisualbell " No blinking
set noerrorbells " No noise.
set laststatus=2 " Always show status line.
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n
set vb t_vb= " disable any beeps or flashes on error
set ruler " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages
set colorcolumn=85
set guioptions=ac " remove menus and scrollbars from the gui vim
set scrolloff=8

set nolist " Display unprintable characters f12 - switches
set listchars=tab:·\ ,eol:¶,trail:·,extends:»,precedes:« " Unprintable chars mapping

" Auto commands
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown} set ft=markdown
au BufRead,BufNewFile {*.tex} set ft=tex
au BufRead,BufNewFile {COMMIT_EDITMSG} set ft=gitcommit
au BufRead,BufNewFile {*.json} set ft=json
au BufRead,BufNewFile {*.ldg,*.ledger} set ft=ledger
au FileType php :setlocal sw=4 ts=4 sts=4

" Key mappings
nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>rt :tabnew ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>re :e ~/.vimrc<CR>
nnoremap <silent> <LocalLeader>rd :e ~/.vim/ <CR>

"" Get rid of the arrow keys
"" This is the big leagues now, better get used to it quick!
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Tabs
nnoremap <silent> <LocalLeader>[ :tabprev<CR>
nnoremap <silent> <LocalLeader>] :tabnext<CR>

"
" show/Hide hidden Chars
map <silent> <F12> :set invlist<CR> 

" generate HTML version current buffer using current color scheme
map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR> 

  let g:airline_powerline_fonts=1
filetype indent plugin on     " required! 
