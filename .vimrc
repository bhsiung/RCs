"
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

" call plug#begin('~/.vim/plugged')
call plug#begin()
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
" Plug 'prabirshrestha/asyncomplete.vim' " Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()


call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Bundle 'christoomey/vim-sort-motion'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'editorconfig/editorconfig-vim'
" Plugin 'eslint/eslint'
" Plugin 'flazz/vim-colorschemes'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'kamykn/spelunker.vim'
" Plugin 'mvolkmann/vim-js-arrow-function'
Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing/unnecessary white space
Plugin 'othree/jsdoc-syntax.vim'
" Plugin 'pangloss/vim-javascript' " Better es6/es2015 syntax support
Plugin 'prettier/vim-prettier'
" Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter' " Quickly toggle comment blocks
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mhinz/vim-signify' "https://github.com/mhinz/vim-signify
Plugin 'sukima/vim-javascript-imports'
Plugin 'sukima/vim-ember-imports'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
" Plugin 'chrisbra/nrrwrgn'
" Plugin 'jimmyhchan/dustjs.vim'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'matchit.zip'
" Plugin 'Yggdroot/indentLine' " Indent guide lines

call vundle#end()            " required

filetype plugin indent on " Allow smart indentation and filetype detection
set autoread " Auto re-read files that have changes outside of vim
set bg=dark " Dark background
set cmdheight=2 " Increase command line height
" set colorcolumn=90 " Vertical rule at 100 columns
highlight ColorColumn guibg=DarkGray
set cursorline " highlight current line
set lazyredraw
set encoding=utf8 " Set charset to utf8 (Necessary for fancy icon plugins)
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

" scrooloose/syntastic settings
nnoremap <leader>s :SyntasticCheck<Cr>
let g:syntastic_javascript_eslint_exec = '$PWD/node_modules/.bin/eslint'
let g:syntastic_scss_eslint_exec = '$PWD/node_modules/.bin/stylelint'
let g:syntastic_sass_eslint_exec = '$PWD/node_modules/.bin/stylelint'
let g:syntastic_scss_checkers = ['stylelint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'mode': 'passive' }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
nnoremap <leader>j :call RandomizeColorScheme()<CR>

" open rc
nnoremap <leader>i :sp ~/.vimrc<Cr>

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
let g:enable_spelunker_vim = 0
let g:enable_spelunker_vim_on_readonly = 0
" Correct all words in buffer.  ZL
" Correct word under cursor.  Zl
" Correct all words in buffer.  ZC
" Correct word under cursor.  Zc
" Correct all words in buffer.  ZF
" Correct word under cursor.  Zf
" Add selected word to spellfile ZG
" Jump cursor to next misspelled words.  ZN
" Jump cursor to previous misspelled words.  ZP
" Toggle to enable or disable.  ZT
" Toggle to enable or disable only the current buffer.  Zt

set spelllang=en

let g:VimPemberlyDebug = 0

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
" set fillchars=stl:-,stlnc:=,vert:\ ,fold:-,diff:-
" set fillchars=\ ,
" set fillchars+=vert:\┋ " Solid pipe character for window split icon

" split screen custimization
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" nerdcommenter
let g:NERDSpaceDelims = 1

function! RandomizeColorScheme()
  let colors = substitute(system('ls ~/.vim/bundle/vim-colorschemes/colors |sort -R |tail -n 1'),".vim.*$","","")
  " echo "applied " . colors
  execute "color"
  execute "colorscheme " . colors
endfunction

" colorscheme spring-night
" colorscheme birds-of-paradise
" colorscheme elisex

"fzf
imap <C-f> <plug>(fzf-complete-line)
nmap <C-a> :Ag<CR>
nmap <C-p> :GFile<CR>

" hi Normal guibg=NONE ctermbg=NONE

" treat dash as part of word
set iskeyword+=-

" ASYNCOMPLETE.VIM
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" let g:asyncomplete_auto_popup = 1

" au User lsp_setup call lsp#register_server({
  " \ 'name': 'javascript support using typescript-language-server',
  " \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
  " \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
  " \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact'],
  " \ })
  "
  "
  "


" https://github.com/pineapplegiant/spaceduck
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme spaceduck
