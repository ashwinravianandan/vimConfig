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
Plug 'https://github.com/chazy/cscope_maps'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tmhedberg/matchit.git'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
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
Plug 'jsfaint/gen_tags.vim'
Plug 'vim-scripts/gtags.vim'
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
   colorscheme molokai
   set guifont=Source\ Code\ Pro\ 12
else
   colorscheme molokai
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

"Sets the current working directory as the directory in which the current file
"exists
nmap <silent> <Leader>wd :lcd! %:p:h<CR>
nmap <silent> <Leader>tt :TagbarToggle<CR>

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
au filetype markdown nmap <silent><buffer> <C-B> :call MarkDownToHtml()<CR>
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
let g:UltiSnipsExpandTrigger="<C-e>"
"let g:UltiSnipsListSnippets="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<C-j>"
"let g:UltiSnipsJumpBackwardTrigger="<C-p>"


"YCM Settings
au filetype cpp nnoremap <silent><buffer> <leader>g :YcmCompleter GoToDefinition<CR>
au filetype cpp nnoremap <silent><buffer> <leader>d :YcmCompleter GoToDeclaration<CR>
au filetype cpp nnoremap <silent><buffer> <leader>t :YcmCompleter GoToImprecise<CR>
au filetype cpp nnoremap <silent><buffer> <leader>s :YcmCompleter GoTo<CR>

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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = 'Ξ'

"Vim project mapping
nmap <Leader>pf :call OpenProject()<CR>
set csprg=gtags-cscope 

"vim build tags for project"

function! BuildTags()
   execute "!find -type f -iname '*.cpp' -o -iname '*.c' -o -iname '*.h' -o -iname '*.hpp' > tagfilelist && gtags -f tagfilelist && rm tagfilelist"
   execute "cs add GTAGS ."
   enew
   Explore
endfunction
let g:project_command_hook = "call BuildTags()"

function UpdateTags()
   if filereadable(GTAGS)
      execute "!global -u"
   endif
endfunction
