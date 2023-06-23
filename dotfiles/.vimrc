" SETTINGS


" turn off flashing bell
set belloff=all

" set auto indent
set ai  

" keeps search results highlighted
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

" turn off line wrapping
set nowrap

" add reference numbering
set number
set relativenumber

" convert tabs to 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab


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

" For cleaning up Power Query files
nnoremap <Leader>1 :%s/#"\([^"]\+\)"\=substitute(tolower(submatch(1)), " ", "_", "g")/gc<CR>

" For printing the current date
nnoremap <Leader>t "=strftime('%Y-%m-%d')<CR>p
inoremap <Leader>t <Esc>"=strftime('%Y-%m-%d')<CR>pa

" For adding Python script boilerplate
nnoremap <Leader>m o<Esc>0iif __name__=='__main__':<CR>    main()<Esc>
