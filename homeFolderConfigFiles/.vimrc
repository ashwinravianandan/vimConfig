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
"Pathogen Settings
"-------------------------------------------------------
"let g:pathogen_disabled = [ 'lucius', 'indentline', 'unite-outline', 'unite-tag', 'unite.vim', 'apprentice', 'xptemplate', 'vimproc.git', 'vim-notes', 'vim-misc' ]
"call pathogen#infect()

call plug#begin('~/.vim/plugged')
	Plug 'https://github.com/tpope/vim-surround.git'
	Plug 'https://github.com/tmhedberg/matchit.git'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-scripts/a.vim'
	Plug 'vim-scripts/a.vim'
   Plug 'chazy/cscope_maps'
	Plug 'https://github.com/SirVer/ultisnips.git'
	Plug 'https://github.com/Valloric/YouCompleteMe.git'
	Plug 'https://github.com/majutsushi/tagbar.git'
	Plug 'https://github.com/godlygeek/tabular.git'
	Plug 'https://github.com/Shougo/vimproc.vim.git'
	Plug 'https://github.com/kien/ctrlp.vim.git'
	Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
	Plug 'https://github.com/vim-scripts/STL-Syntax.git'
	Plug 'https://github.com/will133/vim-dirdiff.git'
	Plug 'https://github.com/flazz/vim-colorschemes.git'
	Plug 'https://github.com/ashwinravianandan/vimNotes.git'
	Plug 'https://github.com/vim-airline/vim-airline'
	Plug 'https://github.com/sjl/gundo.vim.git'
   Plug 'https://github.com/ashwinravianandan/vimProj.git'
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
  "colorscheme solarized
  colorscheme molokai
  "colorscheme navajo-night
  "set guifont=ProggyCleanTT:h14:cANSI
  set guifont=Source\ Code\ Pro\ 12
else
  colorscheme molokai
  set nolazyredraw
  set ttyfast
  set guifont=Source\ Code\ Pro\ 12
endif
"-------------------------------------------------------
" Gui settings: Sets window to max size
"-------------------------------------------------------
if has("gui_running")
   " GUI is running or is about to start.
   " Maximize gvim window.
   "set lines=9999 columns=9999
else
   " This is console Vim.
   if exists("+lines")
      set lines=9999
   endif
   if exists("+columns")
      set columns=9999
   endif
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
" Mapleader
"-------------------------------------------------------
"-------------------------------------------------------
" Fold settings
"-------------------------------------------------------
set foldmethod=marker
set foldcolumn=2
"-------------------------------------------------------
"Backup settings
"-------------------------------------------------------
" backup to ~/.tmp 
set backup 
set backupdir=~/vimtmp
"set backupskip=/tmp/*,/private/tmp/* 
set directory=~/vimtmp
set writebackup
"-------------------------------------------------------
" settings for Omnicomplete (intellisence) :)
"-------------------------------------------------------
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12

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

"Sets the current working directory as the directory in which the current file
"exists
nmap <silent> <Leader>wd :lcd! %:p:h<CR>
nmap <silent> <Leader>tt :TagbarToggle<CR>
"-------------------------------------------------------
" sets the characters used to represent tabs and eols   
"-------------------------------------------------------
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
set listchars=eol:¬
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
"Sourcing custom scripts
"-------------------------------------------------------
"so U:/.vim/plugin/SDS_RecogEventTrc.vim
"-------------------------------------------------------
"Stuff that existed
"-------------------------------------------------------
"set diffexpr=MyDiff()
function MyDiff()
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
command! BuildUML :!java -jar "/usr/local/bin/plantuml.jar" -o "/home/ashwin/Documents/html-notes/images/plantUML" "%"
command! -nargs=1 FilterLogs  call FilterDbusLogs(<f-args>)

"-------------------------------------------------------
" vim todo settings
"-------------------------------------------------------
command! Underline :call Underline()<CR>


"vim notes 

au filetype markdown nmap <silent><buffer> <C-B> :call PythonMarkDownToHtml()<CR>
au filetype markdown set spell

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
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>r :<C-u>Unite -start-insert file_rec/async:!<CR>
"nnoremap <leader>y :<C-u>Unite history/yank<CR>
"nnoremap <leader>t :<C-u>Unite -start-insert tag<CR>
"nnoremap <leader>u :Unite outline -vertical -winwidth=30 -buffer-name=unite-outline-buffer/async:!<CR>

"-------------------------------------------------------
" taskwarrior mappings
"-------------------------------------------------------
"if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor\ --column\ --ignore\ tags\ " use ag for text searches
"   set grepformat=%f:%l:%c%m
"   let g:unite_source_rec_async_command= 'ag -p ~/.agignore --follow --nocolor --nogroup --hidden -g ""'
"   let g:unite_source_grep_command = 'ag -p ~/.agignore --follow --nocolor --nogroup --hidden -g ""'
"   let g:unite_source_grep_default_opts = '-i --nogroup --nocolor --hidden'
"   let g:unite_source_grep_recursive_opt = ''
"endif
"
"ultisnips settings

if executable( 'ucg' )
   set grepprg=ucg\ -iRQ\ -j4\ --type-set=type1:ext:md,cfg,html\ --nocolor
endif

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnipsPersonalSnippets"

"ycm settings
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:UltiSnipsSnippetDirectories = [ 'Ultisnips', 'UltiSnipsPersonalSnippets' ]
"let g:ycm_use_ultisnips_completer = 0
let g:UltiSnipsExpandTrigger="<C-e>"
"let g:UltiSnipsListSnippets="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-p>"


" taskwarrior overrides
let g:task_rc_override = 'rc.defaultwidth=0 rc.defaultheight=0 rc.forcecolor=yes'
let g:task_report_name = 'ready'
"let g:indexer_debugLogLevel = 2
"let g:indexer_backgroundDisabled = 1

let g:indentLine_enabled = 0

"YCM Settings
au filetype cpp nnoremap <silent><buffer> <leader>g :YcmCompleter GoToDefinition<CR>
au filetype cpp nnoremap <silent><buffer> <leader>d :YcmCompleter GoToDeclaration<CR>
au filetype cpp nnoremap <silent><buffer> <leader>t :YcmCompleter GoToImprecise<CR>
au filetype cpp nnoremap <silent><buffer> <leader>s :YcmCompleter GoTo<CR>

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error=1

"Markdown notes handling
let g:NotesDir = '/mnt/dDrive/Ashwin/Documents/vim-notes'
let g:HtmlDir = '/mnt/dDrive/Ashwin/Documents/html-notes'
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

let g:airline_left_sep = '¿'
let g:airline_right_sep = '¿'
let g:airline_symbols.branch = '¿'
let g:airline_symbols.linenr = '¿'

"Vim project mapping
nmap <Leader>pf :call OpenProject()<CR>


