" Basic settings 1 {{{
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
" }}}

" pathogen settings {{{
"call pathogen#infect()
execute pathogen#infect()
" }}}

" Basic settings 2 {{{
set sw=4
set nu! 
syntax enable 
syntax on 
set sessionoptions-=options

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim set foldlevelstart=0
augroup END

" map leader
let mapleader = ","
let maplocalleader = ","

" quickly open vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" map H and L in normal mode
nnoremap H 0
nnoremap L $

" map arrow keys to <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" useful maps
nnoremap / /\v

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set undofile
set undodir=$VIM/\_undodir
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  "set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
      autocmd!

      " For all text files set 'textwidth' to 78 characters.
      autocmd FileType text setlocal textwidth=78

      " When editing a file, always jump to the last known cursor position.
      " Don't do it when the position is invalid or when inside an event handler
      " (happens when dropping a file on gvim).
      " Also don't do it when the mark is in the first line, that is the default
      " position when opening a file.
      autocmd BufReadPost *
		  \ if line("'\"") > 1 && line("'\"") <= line("$") |
		  \   exe "normal! g`\"" |
		  \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
"set help language
:set helplang=cn
"set gui options
":set go-=m
":set go-=T
":set go-=L
":set go-=r
" ����ʱ�Զ����󻯴���
autocmd GUIEnter * simalt ~x
set guioptions+=c        " ʹ���ַ���ʾ��
set guioptions-=m        " ���ز˵���
set guioptions-=T        " ���ع�����
set guioptions-=L        " ��������������
set guioptions-=r        " �����Ҳ�������
set guioptions-=b        " ���صײ�������
set showtabline=0        " ����Tab��
set cursorline           " ����ͻ����ǰ��
" set cursorcolumn       " ����ͻ����ǰ��

"set no backup
set nobackup
"set colorscheme
set t_Co=256
set background=dark
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set guifont=Monaco:h10
"������ɫģʽ������
"if g:isWIN
    "set guifont=Monaco:h11
"elseif g:isMAC
    "set guifont=Monaco:h14
"else
    "set guifont=Monaco\ 11
"endif
set nohls
unmap <C-A>
unmap <C-Y>
iunmap <C-A>
iunmap <C-Y>

" encoding
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312
" source
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" message setting
language messages zh_CN.utf-8

"quickfix 
function! QfMakeConv()
   let qflist = getqflist()
   for i in qflist
      let i.text = iconv(i.text, "cp936", "utf-8")
   endfor
   call setqflist(qflist)
endfunction
augroup quickfix_fix
    autocmd!
    autocmd QuickfixCmdPost make call QfMakeConv()
    "autocmd QuickfixCmdPost * call QfMakeConv()
augroup END
" }}}

" python {{{
let g:pydiction_location= '$VIM\vimfiles\bundle\Pydiction\complete-dict'
let g:pydiction_menu_height=20
" }}}

" vim-latex {{{
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'mupdf'
"let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_UseMakefile = 0
let g:Tex_MultipleCompileFormats = 'dvi,pdf'

"fold
function! AddTexFold()
    if !exists('g:TexFoldAdded')
	"echo "Run."
	let g:TexFoldAdded = 1
	let g:Tex_FoldedEnvironments = 'frame,'.g:Tex_FoldedEnvironments
	call IMAP('EFE', "\\begin{frame}\<CR><++>\<CR>\\end{frame}<++>", 'tex')
    endif
endfunction
augroup Tex
    autocmd!
    "autocmd filetype tex let g:Tex_FoldedEnvironments = 'frame,'.g:Tex_FoldedEnvironments
    "autocmd BufRead,BufNewFile *.tex let g:Tex_FoldedEnvironments = 'frame,'.g:Tex_FoldedEnvironments
    autocmd BufRead,BufNewFile *.tex call AddTexFold()
augroup END
"let g:Tex_FoldedEnvironments = 'frame,'.g:Tex_FoldedEnvironments

" used to avoid latex-suite crash gvim
let g:Tex_UsePython = 0

" open alt key map
let g:Tex_AdvancedMath = 1
" }}}

" authorinfo plugin {{{
let g:vimrc_author='Silevilence' 
let g:vimrc_email='silevilence@outlook.com' 
let g:vimrc_homepage='http://localhost:8080' 
nnoremap <Leader>info :AuthorInfoDetect<cr> 
" }}}

" tagbar {{{
nnoremap tt :TagbarToggle<CR>
let g:tagbar_ctags_bin='ctags.exe'
let g:tagbar_width=40
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
" let g:tagbar_left = 1 " move tagbar window to left
" }}}

" NERDTree {{{
nnoremap <Leader>nt :NERDTreeToggle<CR>
" }}}

" vim-airline {{{
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
" }}}

" CtrlP {{{
"nnoremap cp :CtrlP
" }}}

" vim-polyglot {{{
let g:polyglot_disabled = []
" 修正latex-suite和latex-box键位冲突
let g:LatexBox_no_mappings=1
augroup LatexBox
    autocmd!
    "autocmd filetype tex nnoremap <LocalLeader>lc :LatexmkClean<CR>
    "autocmd filetype tex nnoremap <LocalLeader>lC :LatexmkClean!<CR>
    "autocmd filetype tex nnoremap <LocalLeader>lk :LatexmkStop<CR>
    "autocmd filetype tex nnoremap <LocalLeader>lg :LatexmkStatus<CR>
    "autocmd filetype tex nnoremap <LocalLeader>lG :LatexmkStatus!<CR>
    "autocmd filetype tex nnoremap <LocalLeader>le :LatexErrors<CR>
    autocmd filetype tex nnoremap <LocalLeader>lt :LatexTOC<CR>
    autocmd filetype tex nnoremap <LocalLeader>lj :LatexLabels<CR>
augroup END
" }}}

" Haskell {{{
let g:haskell_enable_quantification       = 1  " ����Haskell���� forall
let g:haskell_enable_recursivedo          = 1  " ����Haskell���� mdo and rec
let g:haskell_enable_arrowsyntax          = 1  " ����Haskell���� proc
let g:haskell_enable_pattern_synonyms     = 1  " ����Haskell���� pattern
let g:haskell_enable_typeroles            = 1  " ����Haskell���� type roles
let g:haskell_enable_static_pointers      = 1  " ����Haskell���� static
let hs_allow_hash_operator = 1
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
augroup filetype_haskell
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    autocmd filetype haskell set ts=4 | set expandtab
augroup END

let hs_highlight_delimiters = 1
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1
let hs_highlight_debug = 1
let hs_allow_hash_operator = 1
" }}}

" neocomplete {{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
augroup ft_omnifunc
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}

" lua settings {{{
augroup filetype_lua
    autocmd filetype lua set ts=4 | set expandtab
    autocmd filetype lua source $VIM/love.vim
augroup END
let g:lua_complete_omni = 1
" }}}

" xmledit {{{
augroup xmledit_omni
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
augroup END
" }}}

" FastFold {{{
let g:fastfold_savehook = 0
" }}}

" wmgraphviz {{{
let g:WMGraphviz_output = "png"
let g:WMGraphviz_viewer = " start"
let g:WMGraphviz_doc2texoptions = '-tmath --figonly'
if has('win32')
    let g:WMGraphviz_shelloptions="-Gfontname=SimSun -Nfontname=SimSun -Efontname=SimSun"
endif
"augroup filetype_dot
"autocmd filetype dot,gv set makeprg=dot\ -tpng\ -gfontname=simsun\ -nfontname=simsun\ -efontname=simsun\ -o\ %:p:.:r.png\ %
"autocmd filetype dot,gv set efm=Error:\ %f:\ syntax\ error\ in\ line\ %l\ %m
"autocmd filetype dot,gv nnoremap <F5> :! start %:p:.:r.png<CR>
"augroup END
" }}}

" OmniSharp {{{
"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

"Super tab settings - uncomment the next 4 lines
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']
augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

    " Contextual code actions (requires CtrlP or unite.vim)
    autocmd FileType cs nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

    " rename with dialog
    autocmd FileType cs nnoremap <leader>nm :OmniSharpRename<cr>
    autocmd FileType cs nnoremap <F2> :OmniSharpRename<cr>
    " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
    autocmd FileType cs command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

    " Force OmniSharp to reload the solution. Useful when switching branches etc.
    autocmd FileType cs nnoremap <leader>rl :OmniSharpReloadSolution<cr>
    autocmd FileType cs nnoremap <leader>cf :OmniSharpCodeFormat<cr>
    " Load the current .cs file to the nearest project
    autocmd FileType cs nnoremap <leader>tp :OmniSharpAddToProject<cr>

    " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
    autocmd FileType cs nnoremap <leader>ss :OmniSharpStartServer<cr>
    autocmd FileType cs nnoremap <leader>sp :OmniSharpStopServer<cr>

    " Add syntax highlighting for types and interfaces
    autocmd FileType cs nnoremap <leader>th :OmniSharpHighlightTypes<cr>
augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
"set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
"set cmdheight=2

"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" Enable snippet completion, requires completeopt-=preview
set completeopt-=preview
let g:OmniSharp_want_snippet=1

let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
" }}}

" syntastic settings {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['\m\c\.tex$', '\m\c\.hs$']
" }}}

" ultisnips {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Requires this when using Neocomplete because of a compatibility issue with UltiSnips.
set completeopt-=preview
" }}}

" javacomplete2 {{{
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" }}}

" bufferhint {{{
nnoremap <LocalLeader>bt :call bufferhint#Popup()<CR>
nnoremap <LocalLeader>bp :call bufferhint#LoadPrevious()<CR>
let g:bufferhint_KeepWindow = 1
" }}}

" rainbow {{{
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
	    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	    \   'operators': '_,_',
	    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	    \   'separately': {
	    \       '*': {},
	    \       'tex': {
	    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	    \       },
	    \       'lisp': {
	    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	    \       },
	    \       'vim': {
	    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	    \       },
	    \       'html': {
	    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	    \       },
	    \       'css': 0,
	    \   }
	    \}
" }}}

" asyncrun {{{
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
" coop with vim-fugitive
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
" encoding
let g:asyncrun_encs = 'gbk'

augroup asyncrun
    autocmd!
    autocmd! BufWinEnter quickfix setlocal 
        \ statusline=%t\ [%{g:asyncrun_status}]\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END
" }}}

" vim-rooter {{{
" directories and all files (default)
let g:rooter_targets = '/,*'

" ignore directories; all files
let g:rooter_targets = '*'

" ignore directories; yaml files
let g:rooter_targets = '*.yml,*.yaml'

" directories and yaml files
let g:rooter_targets = '/,*.yml,*.yaml'
" }}}

" vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_no_extensions_in_markdown = 1
" }}}

" clang-complete {{{
" path to directory where library can be found
"let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:clang_library_path='D:\Program Files\LLVM\lib'
" or path directly to the library file
"let g:clang_library_path='/usr/lib64/libclang.so.3.8'
" }}}
