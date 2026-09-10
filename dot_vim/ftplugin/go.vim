setlocal number
autocmd bufwritepost *.go silent !gofmt -w %
set autoread

