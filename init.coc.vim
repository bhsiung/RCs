set nocompatible              " be iMproved, required
set ttyfast
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
" fzf
set rtp+=~/.fzf

" call plug#begin('~/.vim/plugged')
call plug#begin()
Plug 'mhinz/vim-startify'
" Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
Bundle 'christoomey/vim-sort-motion'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'kamykn/spelunker.vim'
" Plugin 'mvolkmann/vim-js-arrow-function'
" Plugin 'ntpeters/vim-better-whitespace' " Highlight trailing/unnecessary white space
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter' " Quickly toggle comment blocks
Plugin 'scrooloose/nerdtree'
" Plugin 'mhinz/vim-signify' "https://github.com/mhinz/vim-signify
Plugin 'sukima/vim-javascript-imports'
Plugin 'sukima/vim-ember-imports'
" Plugin 'tpope/vim-abolish'
" Plugin 'tpope/vim-fugitive'
" Plugin 'chrisbra/nrrwrgn'
" Plugin 'jimmyhchan/dustjs.vim'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'matchit.zip'
" Plugin 'Yggdroot/indentLine' " Indent guide lines

call vundle#end()            " required

" filetype plugin indent on " Allow smart indentation and filetype detection
" set autoread " Auto re-read files that have changes outside of vim
" " set bg=dark " Dark background
" " set cmdheight=2 " Increase command line height
" " set colorcolumn=90 " Vertical rule at 100 columns
" highlight ColorColumn guibg=DarkGray
"set cursorline " highlight current line
" set hidden " Allow 'hidden' buffers
" set lazyredraw " Don't redraw while executing macros
" "set mouse=a " Turn on the mouse ;)
 set nowrap " Disable line auto wrapping
 set number " Turn on line numbers
 set numberwidth=5 " Gutter width
" "set signcolumn=yes " Always show the signcolumn
" set t_Co=256 " Enable pretty colors
" syntax enable " Turn on syntax highlighting
" " 2mat ErrorMsg '\%121v.' " Highlight first character in text spanning more than 120 columns
" if has('termguicolors')
  " set termguicolors
" endif

" " Search settings
 set ignorecase " case-insensitive searching
 set smartcase " make search case-sensitive if search term contains mixed case
 set hlsearch " Highlight search pattern matches
 set incsearch " Add live highlighting to matches while typing search term

" " Swap/Backup file settings
 set noswapfile " no more weirdo swap files
 set backupdir=~/.backup " Where backups would go if we had them
 set dir=~/.swap " Where swap files would go if we had them

" " Indentation settings
" set expandtab " Convert tabs to spaces
" let g:indentation_depth = 2 " Number of spaces to indent
" let &shiftwidth=g:indentation_depth " Set distance to move lines or blocks
" let &tabstop=g:indentation_depth " Set tab character width
" let &softtabstop=g:indentation_depth " Set space added by pressing tab key and removed by pressing backspace
" let &backspace=g:indentation_depth " Make backspace work like a sane person would expect

" " Make cursor skinny on insert mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" " strip trailing whitespace on save
" autocmd BufWritePre * %s/\s\+$//e


" " Yggdroot/indentLine
" let g:indentLine_char = '┊'
" let g:indentLine_enabled = 1


" " autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

" " resize
" nnoremap <silent> <S-left> :vertical resize -10<CR>
" nnoremap <silent> <S-right> :vertical resize +10<CR>
" nnoremap <silent> <S-up> :resize +10<CR>
" nnoremap <silent> <S-down> :resize -10<CR>

" " refresh
" nnoremap <leader>j :call RandomizeColorScheme()<CR>

 " open rc
 nnoremap <leader>i :sp ~/.config/nvim/init.vim<Cr>

" " explore
" nnoremap <silent> <C-e> :Explore<CR>

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
 let g:spelunker_max_hi_words_each_buf = 10
" " Correct all words in buffer.  ZL
" " Correct word under cursor.  Zl
" " Correct all words in buffer.  ZC
" " Correct word under cursor.  Zc
" " Correct all words in buffer.  ZF
" " Correct word under cursor.  Zf
" " Add selected word to spellfile ZG
" " Jump cursor to next misspelled words.  ZN
" " Jump cursor to previous misspelled words.  ZP
" " Toggle to enable or disable.  ZT
" " Toggle to enable or disable only the current buffer.  Zt

 set spelllang=en

 "ember import
 let g:vim_ember_imports_map = '<Leader>e'

 "toggle nerdtree
 nmap ,n :NERDTreeFind<CR>
 nmap ,m :NERDTreeToggle<CR>


" " split
 set splitbelow
 set splitright
 " set fillchars=stl:-,stlnc:=,vert:\ ,fold:-,diff:-
 " set fillchars=\ ,
" " set fillchars+=vert:\┋ " Solid pipe character for window split icon

 " split screen custimization
 nmap <C-h> <C-w>h
 nmap <C-j> <C-w>j
 nmap <C-k> <C-w>k
 nmap <C-l> <C-w>l

" nerdcommenter
let g:NERDSpaceDelims = 1

"function! RandomizeColorScheme()
 "let colors = substitute(system('ls ~/.vim/bundle/vim-colorschemes/colors |sort -R |tail -n 1'),".vim.*$","","")
 "" echo "applied " . colors
 "execute "color"
 "execute "colorscheme " . colors
"endfunction

" colorscheme spring-night
" colorscheme birds-of-paradise
" colorscheme elisex

" vim-javascript
" https://github.com/pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

 "fzf
 imap <C-f> <plug>(fzf-complete-line)
 nmap <C-a> :Ag<CR>
 nmap <C-p> :GFile<CR>

" " hi Normal guibg=NONE ctermbg=NONE

" " treat dash as part of word
" set iskeyword+=-

" " ASYNCOMPLETE.VIM
" " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" " inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" " let g:asyncomplete_auto_popup = 1

" " au User lsp_setup call lsp#register_server({
  " " \ 'name': 'javascript support using typescript-language-server',
  " " \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
  " " \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
  " " \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact'],
  " " \ })
  " "
  " "
  " "


" " https://github.com/pineapplegiant/spaceduck
 " if exists('+termguicolors')
   " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
   " set termguicolors
 " endif

 " colorscheme spaceduck

" set noshowmode
" set updatetime=100

" onehalflight
" colorscheme onehalflight
" colorscheme onehalfdark
" colorscheme jellybeans
" colorscheme molokai
colorscheme gruvbox
" lightline
if !has('gui_running')
  set t_Co=256
endif
 let g:lightline = {
       \ 'colorscheme': 'gruvbox',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
       \   'right': [ [ 'lineinfo' ], [ 'percent' ], ]
       \  }
       \}
set noshowmode
set updatetime=100

"startify
"" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" =================================== CoC -----------------------------------
let g:coc_global_extensions = ['coc-docthis', 'coc-tsserver', 'coc-css', 'coc-json', 'coc-git', 'coc-prettier', 'coc-eslint']
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" COC prettier settings
" https://github.com/neoclide/coc-prettier
autocmd User CocGitStatusChange {command}
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" vmap <leader>p  <Plug>(coc-format-selected)
" nmap <leader>p  <Plug>(coc-format-selected)
nnoremap <leader>p :Prettier<CR>

" jellybean colorscheme
" let g:jellybeans_overrides = {
" \    'background': { 'guibg': 'FFFFFF' },
" \}
"
" COC github
" https://github.com/neoclide/coc-git
" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \ }
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
