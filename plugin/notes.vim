scriptencoding utf-8

function! s:set(var, default)
  if !exists(a:var)
    if type(a:default)
      execute 'let' a:var '=' string(a:default)
    else
      execute 'let' a:var '=' a:default
    endif
  endif
endfunction

call s:set('g:NotesDir', $HOME .'/Documents/notes')
call s:set('g:HtmlDir', $HOME .'/Documents/html-notes')

function! FindInNote( substring )
  execute "vimgrep /" . a:substring . "/j" . g:NotesDir . "/**/*.md"
  copen
endfunction


function! FindNote( substring )
   set errorformat+=%f
  execute "cexpr system(\'find " . g:NotesDir . " -type f \\| grep -i ". a:substring . "\')" 
   set errorformat-=%f
endfunction


function! NewNoteWithProj( NoteName, Directory )
   "if !isdirectory( g:NotesDir . "/" . a:Directory)
   "   call mkdir( g:NotesDir . "/" . a:Directory,'p')
   "endif
   "execute "e \'" . g:NotesDir . "/" . a:Directory . "/" . a:NoteName . ".md\'" 
   echo argc()
endfunction

function! NewNote( NoteName )
   execute "e \'" . g:NotesDir . "/"  . a:NoteName . ".md\'" 
endfunction

command! -nargs=1 NewNote call NewNote(<f-args>)
command! -nargs=* NewProjNote call NewNoteWithProj(<f-args>)
