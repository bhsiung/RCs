set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'eslint/eslint'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-addon-commenting'
Plugin 'tpope/vim-rails'
Plugin 'walm/jshint.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'vim-ruby/vim-ruby'
Bundle 'christoomey/vim-sort-motion'
set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#end()            " required
set backspace=indent,eol,start
set smartindent
set nowrap
set number
set incsearch
set ignorecase
set synmaxcol=500
set wildignore+=*/node_modules
syntax on
au BufRead,BufNewFile *.handlebars setfiletype html
au BufRead,BufNewFile *.es6 setfiletype javascript
au BufRead,BufNewFile *.es setfiletype javascript
if &t_Co > 2 || has("gui_running")
    set hlsearch
endif
set foldmethod=marker
nnoremap <C-W>o :call MaximizeToggle ()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>

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

map <C-B> :!php -l %<CR>
"map <C-j> :JSHint<CR>
map <C-j> :!eslint %<CR>
map <C-x> :set wrap nonu<CR>
map <C-f> :call JsBeautify()<cr>
map <C-o> :echo expand('%:p')<CR>

au BufNewFile,BufRead *.hbs set filetype=html
au BufNewFile,BufRead *.scss set filetype=css

source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
