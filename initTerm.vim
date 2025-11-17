set nocompatible
set number
set tabstop=8
set nohlsearch
set softtabstop=8
set shiftwidth=8
set smarttab
set autoindent
set showcmd
set smartindent
set ignorecase smartcase
set cindent
set ruler
set go=
set nobackup
set noswapfile
set noshowmatch
set autochdir
set autoread
set linebreak
set showbreak=>>
set wrap
set mouse=a
set backspace=indent,eol,start
set cul
set wildmenu
set termguicolors
set switchbuf=newtab
syntax on
let mapleader="`"
let g:clipboard='xclip'

set updatetime=1000
augroup _general_settings
	autocmd!
	autocmd FileType qf,help,man,checkhealth,startuptime nnoremap <silent><buffer> q <cmd>close<CR>
	if has('nvim')
		autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({ timeout = 500 })
	endif
	autocmd BufWinEnter * set formatoptions-=cro
	autocmd CursorHold * set nohlsearch
	autocmd CmdlineEnter,CmdlineLeave /,\? set hlsearch
augroup end

nnoremap <leader>fy ggVG"+y<esc>
nnoremap <leader>fp ggVG"+p<esc>
vmap <leader>y "+y<esc>
vmap <leader>p "+p<esc>
nnoremap <leader>y "+y<esc>
nnoremap <leader>p "+p<esc>
nnoremap <leader>te <Esc>:tabnew<CR>
nnoremap <leader>tc <Esc>:tabclose<CR>
nnoremap <leader>tv <Esc>:tabnew $MYVIMRC<CR>
nnoremap <leader>ev <Esc>:edit $MYVIMRC<CR>
nnoremap <leader>+ <C-w>7+
nnoremap <leader>_ <C-w>7-
nnoremap <leader>= <C-w>7>
nnoremap <leader>- <C-w>7<
nnoremap <space><space> <C-w><C-w>
nnoremap <C-`> :sp term://zsh<CR>
nnoremap <space>h <C-w>h
nnoremap <space>j <C-w>j
nnoremap <space>k <C-w>k
nnoremap <space>l <C-w>l

map H 0
map L $

map <C-q> <C-d>
map <C-e> <C-u>
nnoremap <C-S-q> <C-f>
nnoremap <C-S-e> <C-b>
map <C-h> 6h
map <C-j> 6j
map <C-k> 6k
map <C-l> 6l
map <C-S-h> :bprev<CR>
map <C-S-l> :bnext<CR>
map <C-}> <Esc>:tabnext<CR>
map <C-{> <Esc>:tabpre<CR>

lua require('preload-plugsetting')
lua require('colorscheme')
lua require('plugmanager')
lua require('plugsetting')
lua require('keysbinding')
lua require('lsp')



"map <F5> :call Debug()<CR>
""map <F9> :call CompileRun()<CR>
"imap <F5> <Esc>:call Debug()<CR>
""imap <F9> <Esc>:call CompileRun()<CR>
"
"function! CompileRun()
"	exec "w!"
"	exec "!g++ % -o %< -lm -DQrsikno"
"	exec "!./%<"
"endfunction
"function! Debug()
"	exec "w!"
"	exec "!g++ % -o %< -lm -DQrsikno"
"	exec "!gdb %<"
"endfunction
"func! CutScr() 
"	exec "vsp %<.out"
"	exec "new %<.in"
"endfunction
