set nocompatible              " be iMproved, required
set ttyfast
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'chrisbra/nrrwrgn'
Bundle 'christoomey/vim-sort-motion'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'easymotion/vim-easymotion'
Plugin 'Yggdroot/indentLine' " Indent guide lines
" Plugin 'airblade/vim-gitgutter' " Show git edit annotations in the gutter
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'eslint/eslint'
Plugin 'gmarik/Vundle.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing/unnecessary white space
Plugin 'othree/jsdoc-syntax.vim'
Plugin 'pangloss/vim-javascript' " Better es6/es2015 syntax support
Plugin 'scrooloose/nerdcommenter' " Quickly toggle comment blocks
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required

filetype plugin indent on " Allow smart indentation and filetype detection
set autoread " Auto re-read files that have changes outside of vim
set bg=dark " Dark background
set cmdheight=2 " Increase command line height
set colorcolumn=100 " Vertical rule at 100 columns
set cursorline " highlight current line
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
"colorscheme base16-tomorrow-night
colorscheme base16-mocha


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

" ctrlpvim/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Respect .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

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
let g:syntastic_javascript_eslint_exec = '$PWD/node_modules/.bin/eslint'
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

" spell check
" http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
" manually turn on `:spelllang`
" get suggestion: `z=`
set spell
set spelllang=en
