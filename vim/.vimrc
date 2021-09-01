" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
" Do smart case matching.
" If ignorecase is set and searching starting with Upper case it
" not ignore the case
set smartcase
set incsearch		" Incremental search
set encoding=UTF-8
set autoindent
set bufhidden=delete
set nobackup
set nowritebackup
set nu
set showmode
set tw=80
set shiftwidth=2
set tabstop=2
set expandtab
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox,node_modules,dist*
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest
set t_Co=256
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set noshowmatch
set splitbelow
set splitright
set cursorline

if (has("termguicolors"))
  set termguicolors
endif

" Lightline settings
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
" Always show the status line
set laststatus=2

" Autocomplete with Ctrl + Space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Move to split buffers, even on terminal mode
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Syntastic stuff

" Trigger checks using ,s
map <Leader>s :SyntasticCheck<CR>

" Show status in the status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Disable by default
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_ruby_checkers = ['rubocop', 'reek', 'mri']

" Enable JSX syntax in any js file
let g:jsx_ext_required = 0

" Jump to definition using tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Markdown stuff
let g:vim_markdown_no_extensions_in_markdown = 1

" Markdown Preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" Silver searcher ag
let g:ackprg = 'ag --vimgrep --ignore tags'

" Camel Case Motions with default mappings
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" SuperTab settings
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" Vimux settings
map <C-t> :VimuxPromptCommand<CR>
map zz :VimuxZoomRunner<CR>

let g:VimuxOrientation = "h"
let g:VimuxPromptString = "> "

" Installs plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Open Gstatus on \gs
map <Leader>gs :Gstatus<CR>

" Neomake on text change
" autocmd InsertLeave,TextChanged * update | Neomake! sbt
" Plugins will be downloaded under the specified directory
call plug#begin('~/.vim/plugged')

" Declare the list of plugins
Plug 'morhetz/gruvbox'
Plug 'mileszs/ack.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'kien/ctrlp.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rainerborene/vim-reek'
Plug 'tpope/vim-rvm'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-vinegar'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'LnL7/vim-nix'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'ervandew/supertab'
Plug 'purescript-contrib/purescript-vim'
Plug 'vmchale/dhall-vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/todo-comments.nvim'
" Required by todo-comments
Plug 'nvim-lua/plenary.nvim'

call plug#end()

colorscheme gruvbox
