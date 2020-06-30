set rtp+=/usr/local/opt/fzf

set modelines=0
set nomodeline

" NS ==============================
call plug#begin(expand('~/.config/nvim/plugged'))
Plug 'tpope/vim-commentary'               " commenting
Plug 'tpope/vim-repeat'                   " lets some commands repeat
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'                 " vim fugitive for git diffs
Plug 'sheerun/vim-polyglot'
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'

" colors 
Plug 'pgdouyon/vim-yin-yang'
Plug 'owickstrom/vim-colors-paramount'
Plug 'ewilazarus/preto'
Plug 'fxn/vim-monochrome'
Plug 'jaredgorski/fogbell.vim'
Plug 'sjl/badwolf'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" colorscheme
set termguicolors
" colorscheme yin 
" colorscheme fogbell
colorscheme paramount

let g:airline_theme='minimalist'
" let g:dracula_italic = 1
let g:airline_powerline_fonts = 0
syntax enable
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.6 } }
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': ['--color', 'hl:9,hl+:14']}), <bang>0)

let NERDTreeRespectWildIgnore=1

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    au BufNewFile,BufRead *.js set filetype=javascript.jsx
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

let base16colorspace=256
" ============================== SETTINGS ==============================

let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'javascript': ['stylelint'], 'css': ['stylelint'], 'scss': ['stylelint']}
let g:ale_fixers = {'javascript': ['stylelint'], 'css': ['stylelint'], 'scss': ['stylelint']}

let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = 'o'
let g:ale_command_wrapper = ''
let g:ale_completion_enabled = 0

filetype plugin on

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
set smartcase
set inccommand=split
set incsearch
set laststatus=2
set linebreak
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:✗,space:·
set mouse=a
set nobackup
set nocompatible
set noswapfile
set noshowmode
set nu
set rnu
set path+=src
set shiftwidth=2
set showtabline=0
set tabstop=2
set softtabstop=2
set spelllang=en_us
set splitright
set timeoutlen=2000
set ttimeoutlen=0
set wildmenu
set updatetime=300

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

if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

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
nnoremap ,fr :%s/

nnoremap <C-p> :GFiles<CR>


nnoremap <C-f> :Ag<CR> 

" find file
nnoremap ,ff :Files<CR>

" find fuzzy in buffer
nnoremap ,fb :BLines<CR>

" find fuzzy in loaded buffers
nnoremap ,fl :Lines<CR>

" find buffer
nnoremap ,b :Buffers<CR>

" git
nnoremap ,gb :Gblame<CR>
nnoremap ,gs :Gstatus<CR>

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

" sneaking
let g:sneak#label = 1

" easymotion
" Gif config
" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)

" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" Gif config
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

" move by one visual line
" nnoremap j gj
" nnoremap k gk
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" 0 is easier. ^ is more useful.
nnoremap 0 ^
nnoremap ^ 0

" go to file using index.js if path is dir
nnoremap gf yi":call GfIndex('<C-r>"')<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

" coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
     \ coc#refresh()

" ============================== COMMANDS ==============================
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Remap for format selected region
xmap <silent> ,fo  <Plug>(coc-format-selected)
nmap <silent> ,fo  <Plug>(coc-format-selected)
nmap <leader>rn <Plug>(coc-rename)

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

function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd ColorScheme * call <sid>update_fzf_colors()
augroup END

