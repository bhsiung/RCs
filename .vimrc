"          __                              ___   __        .ama     ,
"       ,d888a                          ,d88888888888ba.  ,88"I)   d
"      a88']8i                         a88".8"8)   `"8888:88  " _a8'
"    .d8P' PP                        .d8P'.8  d)      "8:88:baad8P'
"   ,d8P' ,ama,   .aa,  .ama.g ,mmm  d8P' 8  .8'        88):888P'
"  ,d88' d8[ "8..a8"88 ,8I"88[ I88' d88   ]IaI"        d8[
"  a88' dP "bm8mP8'(8'.8I  8[      d88'    `"         .88
" ,88I ]8'  .d'.8     88' ,8' I[  ,88P ,ama    ,ama,  d8[  .ama.g
" [88' I8, .d' ]8,  ,88B ,d8 aI   (88',88"8)  d8[ "8. 88 ,8I"88[
" ]88  `888P'  `8888" "88P"8m"    I88 88[ 8[ dP "bm8m88[.8I  8[
" ]88,          _,,aaaaaa,_       I88 8"  8 ]P'  .d' 88 88' ,8' I[
" `888a,.  ,aadd88888888888bma.   )88,  ,]I I8, .d' )88a8B ,d8 aI
"   "888888PP"'        `8""""""8   "888PP'  `888P'  `88P"88P"8m"

set nocompatible              " be iMproved, required
set ttyfast
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin 'airblade/vim-gitgutter' " Show git edit annotations in the gutter
"Plugin 'coldnight/pretty_json.vim'
Bundle 'christoomey/vim-sort-motion'
Plugin 'Yggdroot/indentLine' " Indent guide lines
Plugin 'andrewradev/linediff.vim'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/nrrwrgn'
Plugin 'chriskempson/base16-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'eslint/eslint'
Plugin 'gmarik/Vundle.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mhinz/vim-signify'
Plugin 'mileszs/ack.vim'
Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing/unnecessary white space
Plugin 'othree/jsdoc-syntax.vim'
Plugin 'palantir/tslint'
Plugin 'pangloss/vim-javascript' " Better es6/es2015 syntax support
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter' " Quickly toggle comment blocks
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sukima/vim-ember-imports'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required

filetype plugin indent on " Allow smart indentation and filetype detection
set autoread " Auto re-read files that have changes outside of vim
set bg=dark " Dark background
set cmdheight=2 " Increase command line height
set colorcolumn=120 " Vertical rule at 100 columns
set cursorline " highlight current line
set lazyredraw
set encoding=utf8 " Set charset to utf8 (Necessary for fancy icon plugins)
set fillchars+=vert:\┋ " Solid pipe character for window split icon
set hidden " Allow 'hidden' buffers
set lazyredraw " Don't redraw while executing macros
"set mouse=a " Turn on the mouse ;)
set nowrap " Disable line auto wrapping
set number " Turn on line numbers
set numberwidth=5 " Gutter width
"set signcolumn=yes " Always show the signcolumn
set t_Co=256 " Enable pretty colors
syntax enable " Turn on syntax highlighting
" 2mat ErrorMsg '\%121v.' " Highlight first character in text spanning more than 120 columns
if has('termguicolors')
  set termguicolors
endif
"
" preview page: https://chriskempson.github.io/base16/
"colorscheme base16-pop
colorscheme base16-tomorrow-night
"colorscheme base16-mocha


" Search settings
set ignorecase " case-insensitive searching
set smartcase " make search case-sensitive if search term contains mixed case
set hlsearch " Highlight search pattern matches
set incsearch " Add live highlighting to matches while typing search term

" Swap/Backup file settings
set noswapfile " no more weirdo swap files
set nobackup " no more weirdo backup files
set backupdir=~/.backup " Where backups would go if we had them
set dir=~/.swap " Where swap files would go if we had them

" Indentation settings
set expandtab " Convert tabs to spaces
let g:indentation_depth = 2 " Number of spaces to indent
let &shiftwidth=g:indentation_depth " Set distance to move lines or blocks
let &tabstop=g:indentation_depth " Set tab character width
let &softtabstop=g:indentation_depth " Set space added by pressing tab key and removed by pressing backspace
let &backspace=g:indentation_depth " Make backspace work like a sane person would expect

" Make cursor skinny on insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" scrooloose/syntastic settings
let g:syntastic_javascript_eslint_exec = '$PWD/node_modules/.bin/tslint'
let g:syntastic_scss_eslint_exec = '$PWD/node_modules/.bin/stylelint'
let g:syntastic_sass_eslint_exec = '$PWD/node_modules/.bin/stylelint'
let g:syntastic_scss_checkers = ['stylelint']
" let g:syntastic_javascript_eslint_exec = '~/voyager-web_trunk/node_modules/.bin/eslint'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '錯'
let g:syntastic_style_error_symbol = '醜'
let g:syntastic_style_warning_symbol = '孬'
let g:syntastic_warning_symbol = '弱'
" let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_enable_perl_checker = 1

" ctrlpvim/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Respect .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme='solarized'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" mileszs/ack.vim
let g:ackhighlight = 1
if executable('ag')
  " Use ag (the silver searcher) if it's installed
  let g:ackprg = 'ag --vimgrep'
endif


" heavenshell/vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_underscore_private = 1
nmap <silent> <C-l> <Plug>(jsdoc)

" Yggdroot/indentLine
let g:indentLine_char = '┊'
let g:indentLine_enabled = 1

" Prettier
"autocmd FileType javascript set formatprg=prettier\ --stdin
"autocmd BufWritePre *.js :normal gggqG "If you want to format on save:

" resize
nnoremap <silent> <S-left> :vertical resize -10<CR>
nnoremap <silent> <S-right> :vertical resize +10<CR>
nnoremap <silent> <S-up> :resize +10<CR>
nnoremap <silent> <S-down> :resize -10<CR>

" explore
nnoremap <silent> <C-e> :Explore<CR>

" spell check
" http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
" manually turn on `:spelllang`
" get suggestion: `z=`
set spell
set spelllang=en

let g:VimPemberlyDebug = 0

" CTRLP-FUNKY
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" vim javascript
let g:javascript_plugin_jsdoc = 1
"augroup javascript_folding
"au!
"au FileType javascript setlocal foldmethod=syntax
"augroup END
"let g:javascript_conceal_function = "ƒ"
"let g:javascript_conceal_arrow_function = "⇒"
"set conceallevel=1

" sass folding
autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}

" deoplete
let g:deoplete#enable_at_startup = 1

"ember import
let g:vim_ember_imports_map = '<Leader>e'

"toggle nerdtree
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>


" split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
