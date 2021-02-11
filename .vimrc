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
" fzf
set rtp+=~/.fzf

call vundle#begin()
Plugin 'kamykn/spelunker.vim'
Plugin 'matchit.zip'
Plugin 'mvolkmann/vim-js-arrow-function'
Plugin 'jimmyhchan/dustjs.vim'
Plugin 'prettier/vim-prettier'
Plugin 'tpope/vim-abolish'
Bundle 'christoomey/vim-sort-motion'
Plugin 'Yggdroot/indentLine' " Indent guide lines
Plugin 'bling/vim-airline'
Plugin 'chrisbra/nrrwrgn'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'eslint/eslint'
Plugin 'gmarik/Vundle.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mhinz/vim-signify' "https://github.com/mhinz/vim-signify
Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing/unnecessary white space
Plugin 'othree/jsdoc-syntax.vim'
Plugin 'pangloss/vim-javascript' " Better es6/es2015 syntax support
" Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter' " Quickly toggle comment blocks
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sukima/vim-javascript-imports'
Plugin 'sukima/vim-ember-imports'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'tpope/vim-fugitive'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

call vundle#end()            " required

filetype plugin indent on " Allow smart indentation and filetype detection
set autoread " Auto re-read files that have changes outside of vim
set bg=dark " Dark background
set cmdheight=2 " Increase command line height
set colorcolumn=90 " Vertical rule at 100 columns
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
let g:syntastic_style_error_symbol = '孬'
let g:syntastic_style_warning_symbol = '弱'
let g:syntastic_warning_symbol = '醜'
" let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_enable_perl_checker = 1

" vim-airline/vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
" let g:airline_theme='solarized light'
" let g:airline_theme='luna'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

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
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#parser = 'babylon'

" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

" resize
nnoremap <silent> <S-left> :vertical resize -10<CR>
nnoremap <silent> <S-right> :vertical resize +10<CR>
nnoremap <silent> <S-up> :resize +10<CR>
nnoremap <silent> <S-down> :resize -10<CR>

" refresh
nnoremap <silent> <C-j> :call Boo()<CR>

" explore
nnoremap <silent> <C-e> :Explore<CR>

" spell check
" http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
" manually turn on `:spelllang`
" get suggestion: `z=`
set nospell

" Enable spelunker.vim. (default: 1)
" 1: enable
" 0: disable
let g:enable_spelunker_vim = 1
let g:enable_spelunker_vim_on_readonly = 0

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
" autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}

" deoplete
let g:deoplete#enable_at_startup = 1

"ember import
let g:vim_ember_imports_map = '<Leader>e'

"toggle nerdtree
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>


" split
set splitbelow
set splitright

" nerdcommenter
let g:NERDSpaceDelims = 1

" function! Boo()
  " let colors = substitute(system('ls ~/.vim/bundle/base16-vim/colors/ |sort -R |tail -n 1'),".vim.*$","","")
  " echo "applied " . colors
  " execute "colorscheme " . colors
" endfunction

"fzf
imap <C-f> <plug>(fzf-complete-line)
nmap <C-h> :History<CR>
nmap <C-a> :Ag<CR>
nmap <C-p> :GFiles<CR>

" hi Normal guibg=NONE ctermbg=NONE

" treat dash as part of word
set iskeyword+=-
