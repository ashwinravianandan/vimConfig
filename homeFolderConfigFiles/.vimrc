set nocompatible

"-------------------------------------------------------
" Gui settings
"-------------------------------------------------------
  colorscheme molokai
if has('gui_running')
  set guioptions-=T  " no toolbar
  set guioptions-=m  " no menubar
  "colorscheme solarized
  colorscheme xoria256
  "set guifont=ProggyCleanTT:h14:cANSI
  "set guifont=Source_Code_Pro:h11:cANSI
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


set history=1000 "More history, default is 20
set nu "show line numbers
"set wildmenu "shows list instead of just completing
"set wildmode=list:longest,full
set scrolloff=3

if has('statusline')
        set laststatus=2

" Broken down into easily includeable segments
set statusline=%<%f\ " Filename
set statusline+=%w%h%m%r " Options
"set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y] " filetype
set statusline+=\ [%{getcwd()}] " current dir
set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

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

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview
set completeopt=menuone,menu,longest

"-------------------------------------------------------
" Mapping for , since it is used as the mapleader
"-------------------------------------------------------
nnoremap <c-e> ,
vnoremap <c-e> ,

"-------------------------------------------------------
" Auto command to associate with sidl file
"-------------------------------------------------------
au BufRead,BufNewFile *.sidl set ft=sidl

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
set list
"-------------------------------------------------------
"Pathogen Settings
"-------------------------------------------------------
call pathogen#infect()
"-------------------------------------------------------
"Filetype settings
"-------------------------------------------------------

filetype on
filetype indent on
filetype plugin on

set syntax=on
"-------------------------------------------------------
"Case sensitivity
"-------------------------------------------------------
set ignorecase  "ignores case
set smartcase   "considers upper case if used

set vb  "Visual bell, no more beeps

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
let g:notes_directories = ['/mnt/dDrive/Ashwin/Documents/vim-notes']
let g:notes_list_bullets = ['*', '-', '+']
let g:notes_suffix = '.md'



so ~/.vim/bundle/a.vim
so ~/.vim/bundle/cscope_maps.vim

" Plant uml setting
command! BuildUML :!java -jar "/usr/local/bin/plantuml.jar" -o "/mnt/dDrive/Ashwin/Documents/html-notes/images/plantUML" "%"

"-------------------------------------------------------
" vim todo settings
"-------------------------------------------------------
command! Task :e /mnt/dDrive/Ashwin/todo.txt
command! Underline :call Underline()<CR>


"vim notes 

au filetype notes nmap <silent><buffer> <C-B> :call MarkDownToHtml()<CR>
au filetype notes set spell

"Using par
set formatprg=par\ -w80

"Perforce settings
"let g:p4Presets = '10.90.66.25:3530 UISpeech_Service_JLR07_04_2014_AAnandan_OABLP083_share AAnandan'

"-------------------------------------------------------
"unite settings
"-------------------------------------------------------
let g:unite_enable_smart_case = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 15
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>r :<C-u>Unite -start-insert buffer file_rec<CR>
nnoremap <leader>y :<C-u>Unite history/yank<CR>
nnoremap <leader>t :<C-u>Unite -start-insert tag<CR>
nnoremap <leader>u :Unite outline -vertical -winwidth=30 -buffer-name=unite-outline-buffer<CR>

"-------------------------------------------------------
" taskwarrior mappings
"-------------------------------------------------------
"if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor\ --column\ --ignore\ tags\ " use ag for text searches
"   set grepformat=%f:%l:%c%m
"   let g:unite_source_rec_async_command= 'ag --follow --nocolor --nogroup --hidden -g ""'
"   let g:unite_source_grep_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
"   let g:unite_source_grep_default_opts = '-i --nogroup --nocolor --hidden'
"   let g:unite_source_grep_recursive_opt = ''
"
"endif
"
"ultisnips settings

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnipsPersonalSnippets"

"ycm settings
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" taskwarrior overrides
let g:task_rc_override = 'rc.defaultwidth=0 rc.defaultheight=0 rc.forcecolor=yes'
let g:task_report_name = 'ready'
