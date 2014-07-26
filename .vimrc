set nohlsearch
execute pathogen#infect()
set number
set background=dark
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set listchars=eol:$,trail:~,extends:>,precedes:<
set backupcopy=auto,breakhardlink

map <F4> :w<CR> :compiler gradle<CR> :make test<CR>:cw 4<CR>

let delimitMate_expand_cr = 1
set list lcs=tab:\│\ 

syntax enable

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Highlight spaces used for indenting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /^\s\+/

" Highlight everything after character 80 on a line.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" NERDTree
nnoremap nt :NERDTree<CR>
autocmd vimenter * if !argc() | NERDTree | endif " Open if no files were specified

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python2
  autocmd BufNewFile *.py 0r ~/.vim/skel/python.py

  autocmd BufRead,BufNewFile,FileReadPost *.html set tabstop=4 noexpandtab autoindent
  autocmd BufRead,BufNewFile,FileReadPost *.erb set tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent
  autocmd BufNewFile *.html 0r ~/.vim/skel/index.html

  autocmd BufRead,BufNewFile,FileReadPost *.php set tabstop=4 noexpandtab autoindent
  " autocmd BufRead,BufNewFile,FileReadPost *.php set tabstop=4 shiftwidth=4 softtabstop=4 expandtab autoindent
  autocmd BufRead,BufNewFile,FileReadPost *.css set tabstop=4 noexpandtab autoindent
  " autocmd BufRead,BufNewFile,FileReadPost *.css set tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent
  autocmd BufRead,BufNewFile,FileReadPost *.less set tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent
  autocmd BufRead,BufNewFile,FileReadPost *.c set tabstop=4 noexpandtab autoindent smartindent
  autocmd FileType haskell set expandtab tabstop=4 shiftwidth=4 softtabstop=4 autoindent smartindent
  autocmd BufRead,BufNewFile,FileReadPost *.rb set expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent smartindent
endif
