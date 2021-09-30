set nocompatible               " be iMproved
filetype off                   " required!
set background=dark
syntax on
set nobackup
set noswapfile
set t_Co=256 " needed to tell the colorscheme that we can use the good colours
set hidden " to allow buffers to be hidden with pending changes
set encoding=utf-8

set pastetoggle=<F10> "  toggle between paste and normal: for 'safer' pasting from keyboard
" Match and search
set hlsearch " highlight search
set ignorecase " Do case in sensitive matching with
set smartcase " be sensitive when there's a capital letter
set incsearch "

set backspace=indent,eol,start " more powerful backspacing

set tabstop=2 " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

" Key mappings
" use space as <Leader> key instead of backslash
let mapleader="\<space>"
let maplocalleader = "\\"

nnoremap <leader><leader> <c-^>
noremap <silent> <leader>l :set invnumber<cr>
nnoremap <leader>h :nohl<cr>
"nnoremap <leader>b :buffers<cr>:buffer<Space>
nnoremap <leader>p :set invpaste<CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>F :Files<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <leader>d "=strftime("%Y-%m-%d")<cr>p
nnoremap <leader>ld :.!php -r 'echo date("jS F Y");'<cr>

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"" Get rid of the arrow keys
"" This is the big leagues now, better get used to it quick!
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" show/Hide hidden Chars
noremap <silent> <F12> :set invlist<cr>

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

set grepprg=/usr/local/bin/ag\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m
" bind K to grep word under cursor
noremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Auto commands
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown} set ft=markdown
autocmd BufRead,BufNewFile {*.tex} set ft=tex
autocmd BufRead,BufNewFile {COMMIT_EDITMSG} set ft=gitcommit
autocmd BufRead,BufNewFile {*.json} set ft=json
autocmd BufRead,BufNewFile {*.ldg,*.ledger} set ft=ledger
autocmd BufRead,BufNewFile {.vimrc} set ft=vim
autocmd BufRead,BufNewFile {*.coffee} set ft=javascript

augroup filetype_vim
  autocmd!
  autocmd FileType vim nnoremap <buffer> <leader>c I"<esc>
augroup END
augroup filetype_javascript
  autocmd!
  autocmd FileType javascript setlocal number
  autocmd FileType javascript nnoremap <buffer> <leader>c I#<esc>
augroup END

filetype indent plugin on     " required! 
set statusline=
set statusline+=\ %n
set statusline+=\ ‹‹
set statusline+=\ %f
set statusline+=\ ››
set statusline+=\ %m
set statusline+=\ %F
set statusline+=%=
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}
set statusline+=\ %y
set statusline+=\ ‹‹
set statusline+=\ %l:%c
set statusline+=\ ››

call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-surround'
call plug#end()

augroup nord-theme-overrides
  autocmd!
  " Use 'nord7' as foreground color for all comments.
  autocmd ColorScheme nord highlight Comment ctermfg=14 guifg=#8FBCBB
augroup END

colorscheme nord
