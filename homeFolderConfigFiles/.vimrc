set nocompatible
scriptencoding utf-8
set fileencoding=utf-8
setglobal encoding=utf-8

"-------------------------------------------------------
"Filetype settings
"-------------------------------------------------------

filetype on
filetype indent on
filetype plugin on

"-------------------------------------------------------
" vim plug config
"-------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/vim-scripts/a.vim'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tmhedberg/matchit.git'
"Plug 'https://github.com/SirVer/ultisnips.git'
"Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
Plug 'https://github.com/vim-scripts/STL-Syntax.git'
Plug 'https://github.com/will133/vim-dirdiff.git'
Plug 'https://github.com/flazz/vim-colorschemes.git'
Plug 'https://github.com/ashwinravianandan/vimNotes.git'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ashwinravianandan/vimProj.git'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'vim-syntastic/syntastic'
Plug 'neovimhaskell/haskell-vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

"-------------------------------------------------------
" Gui settings
"-------------------------------------------------------
if has("multi_byte")
   if &termencoding == ""
      let &termencoding = &encoding
   endif
   set encoding=utf-8
   setglobal fileencoding=utf-8
   "setglobal bomb
   "set fileencodings=ucs-bom,utf-8,latin1
endif
set background=dark
syntax on

if has('gui_running')
   set guioptions-=T  " no toolbar
   set guioptions-=m  " no menubar
   colorscheme gruvbox
   set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
else
   colorscheme jellybeans
   set nolazyredraw
   set ttyfast
endif
so $VIMRUNTIME/ftplugin/man.vim

set history=1000 "More history, default is 20
set nu "show line numbers
"set wildmenu "shows list instead of just completing
"set wildmode=list:longest,full
set scrolloff=3


"-------------------------------------------------------
" Mapleader
"-------------------------------------------------------
let mapleader="," 

"-------------------------------------------------------
" Fold settings
"-------------------------------------------------------
set foldmethod=marker
set foldcolumn=2
"-------------------------------------------------------
"Backup settings
"-------------------------------------------------------
set backup 
set backupdir=~/vimtmp
set directory=~/vimtmp
set writebackup

command! Buildtags :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
command! BuildCScopeDB :!cscope -b -R -s .<CR>
" csope results are opened in the quick fix window
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

"-------------------------------------------------------
" Mapping for , since it is used as the mapleader
"-------------------------------------------------------
nnoremap <c-e> ,
vnoremap <c-e> ,

"-------------------------------------------------------
" Key mappings
"-------------------------------------------------------
nmap <silent> <Leader>l <c-w>l 
nmap <silent> <Leader>j <c-w>j 
nmap <silent> <Leader>h <c-w>h 
nmap <silent> <Leader>k <c-w>k 
nmap <silent> <Leader>x <c-w>x 
nmap <silent> <Leader>c <c-w>c 
nmap <silent> <Leader>o <c-w>o 
nmap <silent> <Leader>v <c-w>v 
nmap <silent> <Leader>s <c-w>s 
nmap <silent> <Leader>fd :cs f g <C-R>=expand( "<cword>" )<CR><CR>
nmap <silent> <Leader>fr :cs f s <C-R>=expand( "<cword>" )<CR><CR>
nmap <silent> <Leader>fc :cs f c <C-R>=expand( "<cword>" )<CR><CR>

"Sets the current working directory as the directory in which the current file
"exists
nmap <silent> <Leader>wd :lcd! %:p:h<CR>
nmap <silent> <Leader>tt :TagbarToggle<CR>
inoremap < <><Left>
inoremap <<space> <<space>
inoremap << <<
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {<CR>}O
inoremap <C-u>" "
inoremap <C-u>' '
inoremap <C-u>< <
inoremap <C-u>` `
inoremap <C-u>( (
inoremap <C-u>[ [
inoremap <C-u>{ {
inoremap <C-c>{ {}<Left>
inoremap () ()
inoremap {} {}

imap <Leader>o 
"-------------------------------------------------------
" Tab settings
"-------------------------------------------------------
set tabstop=3
set shiftwidth=3
set expandtab  "replaces tabs with spaces
"-------------------------------------------------------
"setting forward slash instead of backslash
"-------------------------------------------------------
set noshellslash
"-------------------------------------------------------
"settings for display of eol and tab chars
"-------------------------------------------------------
"set listchars=eol:?
set nolist
"-------------------------------------------------------
"Case sensitivity
"-------------------------------------------------------
set ignorecase  "ignores case
set smartcase   "considers upper case if used

"set vb  "Visual bell, no more beeps
set novb

set hidden  "allows buffers to be hidden so that we dont have to confirm everytime
set showcmd  "shows command while typing
set showmode

"-------------------------------------------------------
" XPTemplate Settings
"-------------------------------------------------------
"Setting the personal snippets folder location
let g:xptemplate_snippet_folders=['~/.vim/xptemplate_personal_snippets']


"-------------------------------------------------------
" vim notes settings
"-------------------------------------------------------
let g:notes_directories = ['/home/ashwin/Documents/notes']
let g:notes_list_bullets = ['*', '-', '+']
let g:notes_suffix = '.md'
let g:notes_unicode_enabled = 0



"so ~/.vim/bundle/a.vim
"so ~/.vim/bundle/cscope_maps.vim

" Plant uml setting
command! BuildUML :!java -jar "/usr/share/plantuml/lib/plantuml.jar" -o "/home/ashwin/Documents/html-notes/images/plantUML" "%"
command! -nargs=1 FilterLogs  call FilterDbusLogs(<f-args>)

"-------------------------------------------------------
" vim todo settings
"-------------------------------------------------------

augroup vimrc
   autocmd!
   au BufRead *.tsx set ft=typescript
   au BufRead *.jsx set ft=javascript
   au filetype haskell  call HaskellMode()
   au filetype markdown nmap <silent><buffer> <C-B> :call MarkDownToHtml()<CR>
   au filetype markdown set spell
   au filetype cpp autocmd vimrc BufWritePost <buffer> call UpdateTags()
   au filetype javascript call JsMode()
   au filetype typescript call JsMode()
augroup END

"Using par
set formatprg=par\ -w80

let g:ctrlp_map = '<leader>r'
"-------------------------------------------------------
"unite settings
"-------------------------------------------------------
let g:unite_enable_smart_case = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 15
let g:unite_source_history_yank_enable = 1


if executable( 'ucg' )
   set grepprg=ucg\ -iRQ\ -j4\ --type-set=type1:ext:md,cfg,html\ --nocolor
endif

"-------------------------------------------------------
"ultisnips settings
"-------------------------------------------------------
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnipsPersonalSnippets"

"-------------------------------------------------------
"ycm settings
"-------------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:UltiSnipsSnippetDirectories = [ 'Ultisnips', 'UltiSnipsPersonalSnippets' ]
let g:ycm_use_ultisnips_completer = 1
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:UltiSnipsExpandTrigger="<C-e>"
"let g:UltiSnipsListSnippets="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-p>"


"YCM Settings
""au filetype cpp nnoremap <silent><buffer> <leader>g :YcmCompleter GoToDefinition<CR>
""au filetype cpp nnoremap <silent><buffer> <leader>d :YcmCompleter GoToDeclaration<CR>
""au filetype cpp nnoremap <silent><buffer> <leader>t :YcmCompleter GoToImprecise<CR>
""au filetype cpp nnoremap <silent><buffer> <leader>s :YcmCompleter GoTo<CR>

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error=1

"Markdown notes handling
let g:NotesDir = '/home/ashwin/Documents/vim-notes'
let g:HtmlDir = '/home/ashwin/Documents/html-notes'
nmap <Leader>nn :call NewNoteWithPath()<CR>
nmap <Leader>nf :call FindNote()<CR>
nmap <Leader>ns :call FindInNote()<CR>

"Enabling wildmenu
set wildmenu
set wildmode=full,longest

"Enable status line always
set laststatus=2

" airline settings
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
"

"Vim project mapping
nmap <Leader>pf :call OpenProject()<CR>
set csprg=gtags-cscope 

let g:project_command_hook = "BuildTags"

"vim build tags for project"
silent function! LoadTags( channel )
silent! execute "cs add GTAGS"
echo "GTAGS built and loaded"
endfunction

silent function! UpdateTags()
if filereadable("GTAGS")
   silent! execute "cs kill 0"
   call job_start( "global -u", { "close_cb": "LoadTags" } )
endif
endfunction

silent function! BuildTags(  )
if !filereadable( "GTAGS" )
   silent! execute "cs kill 0"
   call job_start( "gtags-cscope -b", { "close_cb": "LoadTags" })
else
   silent! execute "cs add GTAGS"
endif
enew
Explore
endfunction


let g:haddock_browser="/usr/bin/firefox"
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

function! JsMode()
   setlocal tabstop=2
   setlocal shiftwidth=2
endfunction

function HaskellMode()
 call g:deoplete#enable()
 inoremap <buffer> ( ()<Left>
endfunction

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> yd <plug>(lsp-definition)
    nmap <buffer> yS <plug>(lsp-document-symbol-search)
    nmap <buffer> ys <plug>(lsp-workspace-symbol-search)
    nmap <buffer> yr <plug>(lsp-references)
    nmap <buffer> yi <plug>(lsp-implementation)
    nmap <buffer> yt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    ""nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    ""nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" for asyncomplete.vim log
"let g:asyncomplete_log_file = expand('~/asyncomplete.log')
