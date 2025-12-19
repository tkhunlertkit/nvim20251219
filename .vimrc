set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" call plug#begin(g:plugged_home)

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" PluginPlugin 'itchyny/lightline.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plug 'arcticicestudio/nord-vim'
"Plug 'maralla/completor.vim'
"Plug 'zchee/deoplete-jedi'
"Plug 'davidhalter/jedi-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'casonadams/nord.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'kien/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nvie/vim-flake8'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-obsession'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'lukas-reineke/lsp-format.nvim'
Plug 'luk400/vim-jukit'
Plug 'LukeGoodsell/nextflow-vim'

" All of your Plugins must be added before the following line
call plug#end()            " required
" call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set number
set relativenumber
set ruler
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set smartindent
set splitbelow
set splitright
set scrolloff=10
set laststatus=2
set backspace=2
set ignorecase
set infercase
set mouse=
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nnoremap <SPACE> <NOP>
let mapleader=" "
nmap <silent> <leader>. :vertical resize +5<CR>
nmap <silent> <leader>, :vertical resize -5<CR>
nmap <silent> <leader>= :res +5<CR>
nmap <silent> <leader>- :res -5<CR>
nmap <silent> <leader>' :vsplit<CR>
nmap <silent> <leader>_ :split<CR>
nmap <silent> <leader>+ :wincmd =<CR>

"" Remapping
" move lines up or down
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv


"" Tab changes
nnoremap <A-l> :tabnext<CR>
nnoremap <A-h> :tabprev<CR>
nnoremap <A-n> :tabnew<CR>

" FZF shortcutl
nnoremap <C-f>f :Rg<space>
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set grepformat=%f:%l:%c:%m,%f:%l:%m,%f


nnoremap <buffer> <leader>b Oimport ipdb; ipdb.set_trace(context=10)  # fmt: skip<ESC>

" Shortcut for fuzzy search on file names
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' " Only search in the working directory
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|venv|env)$'
let g:ctrlp_show_hidden = 1

" enable rainbow stuff
let g:rainbow_active = 1
let g:indent_guides_enable_on_vim_startup = 1
highlight LineNr ctermfg=grey

" Insearch
set hlsearch
let g:incsearch#auto_nohlsearch = 0
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
map z?  <Plug>(incsearch-backward)
map zg/ <Plug>(incsearch-stay)
map / <Plug>(incsearch-fuzzy-/)
map ? <Plug>(incsearch-fuzzy-?)
map g/ <Plug>(incsearch-fuzzy-stay)
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

function! s:noregexp(pattern) abort
  return '\V' . escape(a:pattern, '\')
endfunction

function! s:config() abort
  return {'converters': [function('s:noregexp')]}
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config())
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" vim-easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" go to definition
nnoremap <Leader>k :vsplit<space><bar><space>lua<space>vim.lsp.buf.definition()<CR>
nnoremap <Leader>K :lua<space>vim.lsp.buf.definition()<CR>
nnoremap <Leader>j :split<space><bar><space>lua<space>vim.lsp.buf.definition()<CR>

" Vim status line
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"" session manipulation
let g:sessions_dir = '~/vim-sessions'
exec 'nnoremap <Leader>ss :Obsession ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'


" nerdcommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1


"" Auto execution on event.
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " open NERDTree when no file is selected at launch
autocmd BufWritePre * %s/\s\+$//e " Trim trailing white space when save.
autocmd StdinReadPre * let s:std_in=1
colorscheme nord
