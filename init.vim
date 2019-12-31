set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.config/nvim/bundle/Vundle.vim
" fzf
set rtp+=~/.fzf

call vundle#begin()            " required
Plugin 'VundleVim/Vundle.vim'  " required

" ===================
" my plugins here
" ===================

Bundle 'christoomey/vim-sort-motion'
" Plugin 'roxma/vim-hug-neovim-rpc'

Plugin 'Yggdroot/indentLine' " Indent guide lines
Plugin 'bling/vim-airline'
Plugin 'chrisbra/nrrwrgn'
Plugin 'chriskempson/base16-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'eslint/eslint'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mhinz/vim-signify'
Plugin 'mileszs/ack.vim'
Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing/unnecessary white space
Plugin 'heavenshell/vim-jsdoc'
Plugin 'othree/jsdoc-syntax.vim'
Plugin 'palantir/tslint'
Plugin 'pangloss/vim-javascript' " Better es6/es2015 syntax support
Plugin 'prettier/vim-prettier'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter' " Quickly toggle comment blocks
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" Plugin 'sukima/vim-ember-imports'
Plugin 'sukima/vim-javascript-imports'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'


" ===================
" end of plugins
" ===================
call vundle#end()               " required
filetype plugin indent on       " required
"
set autoread " Auto re-read files that have changes outside of vim
set bg=dark " Dark background
set cmdheight=2 " Increase command line height
set colorcolumn=100 " Vertical rule at 100 columns
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
" bright
" colorscheme base16-gruvbox-light-hard
" colorscheme base16-default-light
"
" dark
" colorscheme base16-atelier-plateau
" colorscheme base16-brewer
" colorscheme base16-gruvbox-dark-hard
" colorscheme base16-gruvbox-dark-pale
" colorscheme base16-gruvbox-light-hard
" colorscheme base16-harmonic-dark
" colorscheme base16-marrakesh
" colorscheme base16-materia
" colorscheme base16-material
" colorscheme base16-mocha
" colorscheme base16-pop
" colorscheme base16-snazzy
" colorscheme base16-solarized-dark
" colorscheme base16-tomorrow-night
"
colorscheme base16-chalk

"
" base16-3024                       base16-black-metal-marduk  base16-gruvbox-dark-hard     base16-ocean
" base16-apathy                     base16-black-metal-mayhem  base16-gruvbox-dark-medium   base16-onedark
" base16-ashes                      base16-black-metal-nile    base16-gruvbox-dark-pale     base16-one-light
" base16-atelier-cave-light         base16-black-metal-venom   base16-gruvbox-dark-soft     base16-outrun-dark
" base16-atelier-cave               base16-black-metal         base16-gruvbox-light-hard    base16-papercolor-dark
" base16-atelier-dune-light         base16-brewer              base16-gruvbox-light-medium  base16-papercolor-light
" base16-atelier-dune               base16-bright              base16-gruvbox-light-soft    base16-paraiso
" base16-atelier-estuary-light      base16-harmonic-dark       base16-phd
" base16-atelier-estuary            base16-brushtrees-dark     base16-harmonic-light        base16-pico
" base16-atelier-forest-light       base16-brushtrees          base16-heetch-light          base16-pop
" base16-atelier-forest             base16-chalk               base16-heetch                base16-porple
" base16-atelier-heath-light        base16-circus              base16-hopscotch             base16-railscasts
" base16-atelier-heath              base16-classic-dark        base16-ia-dark               base16-rebecca
" base16-atelier-lakeside-light     base16-classic-light       base16-ia-light              base16-seti
" base16-atelier-lakeside           base16-codeschool          base16-icy                   base16-shapeshifter
" base16-atelier-plateau-light      base16-cupcake             base16-irblack               base16-snazzy
" base16-atelier-plateau            base16-cupertino           base16-isotope               base16-solarflare
" base16-atelier-savanna-light      base16-darktooth           base16-macintosh             base16-solarized-dark
" base16-atelier-savanna            base16-default-dark        base16-marrakesh             base16-solarized-light
" base16-atelier-seaside-light      base16-default-light       base16-material-darker       base16-spacemacs
" base16-atelier-seaside            base16-dracula             base16-material-lighter      base16-summerfruit-dark
" base16-atelier-sulphurpool-light  base16-eighties            base16-material-palenight    base16-summerfruit-light
" base16-atelier-sulphurpool        base16-embers              base16-material              base16-tomorrow-night
" base16-atlas                      base16-flat                base16-material-vivid        base16-tomorrow
" base16-bespin                     base16-fruit-soda          base16-materia               base16-tube
" base16-black-metal-bathory        base16-github              base16-mellow-purple         base16-twilight
" base16-black-metal-burzum         base16-google-dark         base16-mexico-light          base16-unikitty-dark
" base16-black-metal-dark-funeral   base16-google-light        base16-mocha                 base16-unikitty-light
" base16-black-metal-gorgoroth      base16-grayscale-dark      base16-monokai               base16-woodland
" base16-black-metal-immortal       base16-grayscale-light     base16-nord                  base16-xcode-dusk
" base16-black-metal-khold          base16-greenscreen         base16-oceanicnext           base16-zenburn


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

" ctrlpvim/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Respect .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

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
"toggle nerdtree
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
"
" split
set splitbelow
set splitright

" nerdcommenter
let g:NERDSpaceDelims = 1
"
" spell check
" http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
" manually turn on `:spelllang`
" get suggestion: `z=`
set spell
set spelllang=en

" DEOPLETE.NVIM
let g:deoplete#enable_at_startup = 1
"
"fzf
imap <C-f> <plug>(fzf-complete-line)
