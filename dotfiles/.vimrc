" SETTINGS

" no flashing bell
set belloff=all

" keeps search results highlighted
set hlsearch

" set search highlighting colours
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

# WRAPPING
set nowrap

# SCROLLING
set scrolloff=2

" LINE NUMBERS
set number
set relativenumber

" TABS
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent

" FOLDING
set foldenable
set foldmethod=indent

" MAPPINGS
nnoremap Y y$
nnoremap <Leader>f :set<Space>ft=
nnoremap <Leader>d "_d
nnoremap <Leader>D "_D
nnoremap <Leader>r gg"_dG"+P
nnoremap <Leader>p Go<Esc>0"_D<Esc>"+p
nnoremap <Leader>y :%y+<CR>
nnoremap <Leader>o o
nnoremap <Leader>O O
nnoremap <Leader><CR> i<CR><Esc>
nnoremap <Leader><Space> i<Space><Esc>
inoremap ;; <Esc>
cnoremap ;; <Esc>

" For cleaning up Power Query files
nnoremap <Leader>1 :%s/#"\([^"]\+\)"\=substitute(tolower(submatch(1)), " ", "_", "g")/gc<CR>

" For adding Python script boilerplate
nnoremap <Leader>m o<Esc>0iif __name__=='__main__':<CR>    main()<Esc>

" For printing the current date
" nnoremap <Leader>t "=strftime('%Y-%m-%d')<CR>p
" inoremap <Leader>t <Esc>"=strftime('%Y-%m-%d')<CR>pa

