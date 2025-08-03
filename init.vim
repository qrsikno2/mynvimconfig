set nocompatible
set number
set tabstop=8
set nohlsearch
set softtabstop=8
set shiftwidth=8
set smarttab
set autoindent
set smartindent
set cindent
set ruler
set go=
set nobackup
set noswapfile
set nowrap
set noshowmatch
set autochdir
set autoread
set linebreak
set mouse=a
set backspace=indent,eol,start
set cul
set wildmenu
set termguicolors
set switchbuf=newtab
syntax on
let mapleader="="

map <F5> :call Debug()<CR>
"map <F9> :call CompileRun()<CR>
imap <F5> <Esc>:call Debug()<CR>
"imap <F9> <Esc>:call CompileRun()<CR>

function! CompileRun()
	exec "w!"
	exec "!g++ % -o %< -lm -DQrsikno"
	exec "!./%<"
endfunction
function! Debug()
	exec "w!"
	exec "!g++ % -o %< -lm -DQrsikno"
	exec "!gdb %<"
endfunction
func! CutScr() 
	exec "vsp %<.out"
	exec "new %<.in"
endfunction

nnoremap <leader>scy ggVG"+y<esc>
nnoremap <leader>scp ggVG"+p<esc>
vmap <leader>sy "+y<esc>
vmap <leader>sp "+p<esc>
nnoremap <leader>sy "+y<esc>
nnoremap <leader>sp "+p<esc>
nnoremap <leader>te <Esc>:tabnew<CR>
nnoremap <leader>] <Esc>:tabnext<CR>
nnoremap <leader>[ <Esc>:tabpre<CR>
nnoremap <leader>tc <Esc>:tabclose<CR>
nnoremap <leader>tv <Esc>:tabnew $MYVIMRC<CR>
nnoremap <leader>ev <Esc>:edit $MYVIMRC<CR>
nnoremap <leader>+ <C-w>10>
nnoremap <leader>- <C-w>10<
nnoremap <leader>` <Esc>:call CutScr()<CR><C-w>l<C-w>H
nnoremap <space><space> <C-w><C-w>
nnoremap <C-`> :sp term://zsh<CR>
nnoremap <space>h <esc>:set hlsearch!<CR>


map H 0
map L $

map <C-q> <C-d>
map <C-e> <C-u>
map <C-S-q> <C-f>
map <C-S-e> <C-b>
map <C-h> 6h
map <C-l> 6l
map <C-j> 6j
map <C-k> 6k

lua require('preload-plugsetting')
lua require('colorscheme')
lua require('plugmanager')
lua require('plugsetting')
lua require('keysbinding')
lua require('lsp')

