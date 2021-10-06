set rtp+=/usr/local/opt/fzf

set modelines=0
set nomodeline

" NS ==============================
call plug#begin(expand('~/.config/nvim/plugged'))
Plug 'tpope/vim-commentary'               " commenting
Plug 'tpope/vim-repeat'                   " lets some commands repeat
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'tpope/vim-fugitive'                 " vim fugitive for git diffs

" WIKI plugs
Plug 'godlygeek/tabular'
Plug 'lervag/wiki.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'samgriesemer/vim-roam'
Plug 'samgriesemer/vim-roam-md'

"CoQ (not coc)
" Plug 'neovim/nvim-lspconfig'
" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

" expanded text objects
Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'

Plug 'justinmk/vim-sneak'

Plug 'kshenoy/vim-signature'

" Filetree
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" syntax things
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'
Plug 'maxmellon/vim-jsx-pretty'

"airline
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'

" colors 
" Plug 'knightbk/vim-colors-paramount'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'jaredgorski/fogbell.vim'

call plug#end()

colorscheme dracula
set termguicolors
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 0

syntax enable

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.6 } }
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': ['--color', 'hl:9,hl+:14']}), <bang>0)

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.ts set filetype=typescript
    au BufNewFile,BufRead *.tsx set filetype=typescriptreact
augroup END

" ============================== STATUS LINE ==============================
let g:airline_extensions = ['tabline']
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_highlighting_cache = 1

" ============================== SETTINGS ==============================

filetype plugin on

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set backupcopy=yes
set clipboard^=unnamedplus
set colorcolumn=120
set conceallevel=2
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
set nocompatible
set noshowmode
set noswapfile
set nu
set path+=src
set rnu
set shiftwidth=2
set showtabline=0
set smartcase
set softtabstop=2
set spelllang=en_us
set splitright
set tabstop=2
set timeoutlen=2000
set ttimeoutlen=0
set updatetime=300
set wildmenu

" reload changed file on focus, buffer enter
" helps if file was changed externally.
augroup ReloadGroup
  autocmd!
  autocmd! FocusGained,BufEnter * checktime
augroup END

" =========== cursorline
hi CursorLine guifg=NONE ctermbg=NONE
hi CursorLineNR guifg=LightCyan guibg=NONE
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

if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif

noremap <C-h> :call WinMove('h')<cr>
noremap <C-j> :call WinMove('j')<cr>
noremap <C-k> :call WinMove('k')<cr>
noremap  <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" save
noremap <C-s> :w<CR>

" view yanks
noremap <silent> ,y  :<C-u>CocList -A --normal yank<cr>

" view registers
nnoremap ,r :reg<CR>

" black hole delete
vmap ,d "_d"0P 

" close buffer
nnoremap ,q :bd<CR>

" close all buffers
nnoremap ,Q :%bd<CR>

" " vert split
" nnoremap ,v :vs<CR>
" nnoremap ,h :split<CR>

" session save/open/remove
nnoremap ,ss :mksession! ~/.config/nvim/sessions/
nnoremap ,so :source ~/.config/nvim/sessions/
nnoremap ,sr :!rm ~/.config/nvim/sessions/

" edit/save .vimrc
nnoremap ,ev :e ~/.config/nvim/init.vim<CR>
nnoremap ,sv :so ~/.config/nvim/init.vim<CR>

" find and replace word
nnoremap ,fr :%s/<C-r><C-w>/

nnoremap <C-p> :Files<CR>


nnoremap <C-f> :Ag<CR> 

" find file
nnoremap ,ff :Files<CR>

" find fuzzy in buffer
nnoremap ,fb :BLines<CR>

" find fuzzy in loaded buffers
nnoremap ,fl :Lines<CR>

" find buffer
nnoremap ,b :Buffers<CR>

" find mark
nnoremap ,m :Marks<CR>

" git
nnoremap ,gb :Gblame<CR>
nnoremap ,gs :Gstatus<CR>

" select all
" kill all windows but current
nnoremap ,x :only<CR>

" close quickfix
nnoremap ,cc :cclose<CR>

" these only get hit by accident
nnoremap Q <Nop>
nnoremap q: <Nop>

" redo
nnoremap U <C-r>

" sneaking
let g:sneak#label = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" move by one visual line
" nnoremap j gj
" nnoremap k gk
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" 0 is easier. ^ is more useful.
nnoremap 0 ^
nnoremap ^ 0

"chadtree 
nmap ,n <cmd>CHADopen<cr>
let g:chadtree_settings = { "theme": {"icon_glyph_set": "devicons"} }

"coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
     \ coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ============================== COMMANDS ==============================
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Remap for format selected region
nmap <leader>rn <Plug>(coc-rename)
nmap ,fe :CocCommand eslint.executeAutofix<cr>

" COQ (not coc)
" let g:coq_settings = { 'auto_start': v:true }

" Wikithings
let g:wiki_root = '~/Notes'
nmap ,fw :WikiFzfPages<CR>
let g:wiki_filetypes = ['md']
let g:wiki_link_extension = '.md'
let g:wiki_global_load = 0
nnoremap <F5> "=strftime("%b %d %Y")<CR>P
inoremap <F5> <C-R>=strftime("%b %d %Y")<CR>
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 2
