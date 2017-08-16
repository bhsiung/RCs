" good references:
" http://www.tricksofthetrades.net/tags/Vim/
" http://vimawesome.com/plugin/surround-vim
" https://chriskempson.github.io/base16/
set nocompatible              " be iMproved, required
set ttyfast
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" call plug#begin('~/.vim/plugged')
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'mxw/vim-jsx'
" Plugin 'othree/html5.vim' " HTML5 syntax enhancements
" Plugin 'reedes/vim-lexical'
" Plugin 'tomtom/tcomment_vim'
" Plugin 'tpope/vim-surround' " nice surrond plugin
" Plugin 'walm/jshint.vim'
" Plugin 'junegunn/fzf.vim'
" Plug '/usr/local/opt/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Bundle 'christoomey/vim-sort-motion'
Plugin 'Yggdroot/indentLine' " Indent guide lines
Plugin 'airblade/vim-gitgutter' " Show git edit annotations in the gutter
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'eslint/eslint'
Plugin 'gmarik/Vundle.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing/unnecessary whitespace
Plugin 'othree/jsdoc-syntax.vim'
Plugin 'pangloss/vim-javascript' " Better es6/es2015 syntax support
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter' " Quickly toggle comment blocks
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " Colored nerdtree icons
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'


set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#end()            " required
set backspace=indent,eol,start
set smartindent
set nocursorline " remove highlight current line
" set cursorline " highlight current line
set nowrap
set number
set incsearch
set ignorecase
set synmaxcol=500
set mouse=a
set wildmenu
set wildignore+=*/node_modules
if has('termguicolors')
  set termguicolors
endif
"
" preview page: https://chriskempson.github.io/base16/
" colorscheme base16-pop
colorscheme base16-tomorrow-night

syntax on
au BufRead,BufNewFile *.scss setfiletype sass
au BufEnter *.scss :syntax sync fromstart
filetype plugin indent on
au BufRead,BufNewFile *.handlebars setfiletype html
au BufRead,BufNewFile *.es6 setfiletype javascript
au BufRead,BufNewFile *.es setfiletype javascript
if &t_Co > 2 || has("gui_running")
    set hlsearch
endif
set foldmethod=marker



nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <C-W>o :call MaximizeToggle ()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>
" resize
nnoremap <silent> <S-left> :vertical resize -10<CR>
nnoremap <silent> <S-right> :vertical resize +10<CR>
nnoremap <silent> <S-up> :resize +10<CR>
nnoremap <silent> <S-down> :resize -10<CR>
map <C-x> :set wrap nonu<CR>
map <C-o> :echo expand('%:p')<CR>
" map <C-n> :NERDTree ~/voyager-web_trunk<CR>
map <C-n> :NERDTree ~/jobs-management-frontend_trunk/jobs-management-frontend/assets/javascripts<CR>
imap jj <Esc>

function! MaximizeToggle()
	if exists("s:maximize_session")
	exec "source " . s:maximize_session
	call delete(s:maximize_session)
	unlet s:maximize_session
	let &hidden=s:maximize_hidden_save
	unlet s:maximize_hidden_save
	else
	let s:maximize_hidden_save = &hidden
	let s:maximize_session = tempname()
	set hidden
	exec "mksession! " . s:maximize_session
	only
	endif
endfunction

autocmd StdinReadPre * let s:std_in=1


" au BufNewFile,BufRead *.hbs set filetype=html
" au BufNewFile,BufRead *.scss set filetype=css
set laststatus=2

" airline config
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" " powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" " old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_powerline_fonts = 1

"Nerd tree config
set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h14

"ctrlp
let g:ctrlp_custom_ignore = '\v[\/](logs|i18n|node_modules|dist|tmp|bower_components|coverage|build|acl|screenshots|concat-stats-for)|(\.(swp|ico|git|svn))$'


:set fillchars+=vert:\


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



" scrooloose/nerdcommenter
let NERDSpaceDelims=1

" scrooloose/nerdtree settings
let NERDTreeMouseMode = 2
"let NERDTreeRespectWildIgnore = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore=[
      \'^pemberly$',
      \'^\.gradle$',
      \'^\.log$',
      \'^logs$',
      \'^i18n$',
      \'^node_modules$',
      \'^dist$',
      \'^tmp$',
      \'^bower_components$',
      \'^coverage$',
      \'^build$',
      \'^acl$',
      \'^screenshots$',
      \'^tools$',
      \'^vendor$',
      \'^docs$',
      \'^out$',
      \'^public$',
      \'^concat-stats-for$']

" tiagofumo/vim-nerdtree-syntax-highlight
let s:yellow = "F2DD58"
let s:green = "8FAA54"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['js'] = s:yellow " make js a brighter yellow
let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['json'] = s:green " make json green
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid  error

" vmustache/vim-mustache-handlebars settings
let g:mustache_abbreviations = 1

" YCM
let g:ycm_filetype_specific_completion_to_disable = { 'gitcommit': 1 }

" jsdoc
" http://vimawesome.com/plugin/vim-jsdoc
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_additional_descriptions=1
let g:jsdoc_underscore_private=1
" let g:jsdoc_type_hook=1
" let g:jsdoc_enable_es6=1
nmap <silent> <C-l> <Plug>(jsdoc)

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Swap/Backup file settings
set noswapfile " no more weirdo swap files
set nobackup " no more weirdo backup files
set backupdir=~/.backup " Where backups would go if we had them
set dir=~/.swap " Where swap files would go if we had them

" spell check
" http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
" manually turn on `:spelllang`
" get suggestion: `z=`
set spell
vnoremap // y/<C-R>"<CR>"

" airblade/vim-gitgutter settings
let g:gitgutter_sign_column_always = 1
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✎'
let g:gitgutter_sign_removed = '刪'
let g:gitgutter_sign_removed_first_line = '刪'
let g:gitgutter_sign_modified_removed = '✎'
let g:gitgutter_enabled = 0


set colorcolumn=150
