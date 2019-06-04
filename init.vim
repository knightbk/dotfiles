set rtp+=/usr/local/opt/fzf

" NS ==============================
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})   " package management
call minpac#add('tpope/vim-commentary')               " commenting
call minpac#add('ervandew/supertab')                  " tab completion
call minpac#add('tmux-plugins/vim-tmux')              " vim tmux
call minpac#add('christoomey/vim-tmux-navigator')     " tmux integration
call minpac#add('junegunn/fzf')                       " fuzzy finder for file and text searching
call minpac#add('junegunn/fzf.vim')                   " enhanced fzf integration
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('tpope/vim-repeat')                   " lets some commands repeat
call minpac#add('morhetz/gruvbox')                    " color scheme
call minpac#add('dracula/vim')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('w0rp/ale')
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('vim-airline/vim-airline') 
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('tpope/vim-surround')
call minpac#add('terryma/vim-multiple-cursors')
" ============================== MINPAC
function! MinpacReset()
  call minpac#update()
  call minpac#clean()
endfunction
command! Minpac call MinpacReset()

" ==== ale
let g:ale_linters = {'javascript': ['prettier', 'eslint'], 'ruby': ['rubocop']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'ruby': ['rubocop']}
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⭕'

let g:ale_completion_delay = 100
let g:ale_completion_enabled = 1
let g:ale_completion_max_suggestions = 50
" ============================== STATUS LINE ==============================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1

" ============================== SETTINGS ==============================
" ale
set completeopt=menu,menuone,preview,noselect,noinsert


" colorscheme
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" vim-go
" remove once 0.3.1 is available and installed. currently stuck on 0.3.0
let g:go_version_warning=0
let g:go_fmt_command = "goimports"

set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set backupdir=~/nvimbackup
set backupcopy=yes
set clipboard^=unnamedplus
set colorcolumn=120
set expandtab
set hidden
set hlsearch
set ignorecase
set inccommand=split
set incsearch
set laststatus=2
set linebreak
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:✗,space:·
set mouse=a
set nobackup
set noswapfile
set noshowmode
set number
set path+=src
set shiftwidth=2
set showtabline=0
set tabstop=2
set softtabstop=2
set spelllang=en_us
set spellfile=~/Dropbox/vimspell/en.utf-8.add
set splitright
set timeoutlen=2000
set ttimeoutlen=0
set wildmenu

" reload changed file on focus, buffer enter
" helps if file was changed externally.
augroup ReloadGroup
  autocmd!
  autocmd! FocusGained,BufEnter * checktime
augroup END

" =========== cursorline
hi CursorLine ctermfg=NONE ctermbg=NONE
hi CursorLineNR ctermfg=black ctermbg=yellow
set cursorline

" ============================== MAPPINGS ==============================
let mapleader = " "
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

tnoremap <Esc> <C-\><C-n>

" close buffer
nnoremap ,d :bd<CR>
" close all buffers
nnoremap ,D :%bd<CR>

" vert split
nnoremap ,v :vs<CR>

" session save/open/remove
nnoremap ,ss :mksession! ~/.config/nvim/sessions/
nnoremap ,so :source ~/.config/nvim/sessions/
nnoremap ,sr :!rm ~/.config/nvim/sessions/

" edit/save .vimrc
nnoremap ,ev :e ~/.config/nvim/init.vim<CR>
nnoremap ,sv :so ~/.config/nvim/init.vim<CR>

" find and replace word
nnoremap ,fr :%s/
" find file
nnoremap ,ff :Files<CR>
" find fuzzy
nnoremap ,fg :Rg 
" find buffer
nnoremap ,b :Buffers<CR>

" git
nnoremap ,gb :Gblame<CR>

" goyo
nnoremap ,gy :Goyo<CR>

" quit all
nnoremap ,q :qa<CR>

" show invisible chars
nnoremap ,l :set list!<CR>

" no highlights
nnoremap ,hh :noh<CR>

" select all
" kill all windows but current
nnoremap ,x :only<CR>

" close quickfix
nnoremap ,cc :cclose<CR>

" non-leader mappings ==========

" run make
nnoremap <silent> <F5> :wa<CR>:silent make<CR>
inoremap <silent> <F5> <Esc>:wa<CR>:silent make<CR>
nnoremap <silent> <F6> :wa<CR>:silent make clean<CR>
nnoremap <silent> <F7> :wa<CR>:silent make launch<CR>

" these only get hit by accident
nnoremap Q <Nop>
nnoremap q: <Nop>

" redo
nnoremap U <C-r>

" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" move by one visual line
nnoremap j gj
nnoremap k gk

" 0 is easier. ^ is more useful.
nnoremap 0 ^
nnoremap ^ 0

" explore project dir
nnoremap ,, :Explore .<CR>
" explore dir of current buffer
nnoremap - :Explore<CR>

" go to file using index.js if path is dir
nnoremap gf yi":call GfIndex('<C-r>"')<CR>

nnoremap <D-p> :Ag 

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
" NerdTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jsx', 'Magenta', 'none', '#ff00ff', '#151515')

autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" ============================== COMMANDS ==============================

" turn a snake into a camel
command! SnakeToCamel normal mmviw:s/\%V_\(.\)/\U\1/g<CR>:nohlsearch<CR>`m
nnoremap ,k :SnakeToCamel<CR>
" turn a camel into a snake
command! CamelToSnake normal mmviw:s/\%V\(\u\)/_\L\1/g<CR>:nohlsearch<CR>`m

" go to file using index.js if path is dir
function! GfIndex(filepath)
  let indexPath = a:filepath . "/index.js"
  if isdirectory(a:filepath) && filereadable(indexPath)
    execute "edit" path
  elseif isdirectory("src/" . a:filepath) && filereadable("src/" . indexPath)
    execute "edit" "src/" . indexPath
  elseif filereadable(a:filepath . ".js")
    execute "edit" a:filepath . ".js"
  elseif filereadable("src/" . a:filepath . ".js")
    execute "edit" "src/" . a:filepath . ".js"
  else
    execute "edit" a:filepath
  endif
endfunction

