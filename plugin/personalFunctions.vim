function! MarkDownToHtml()
   let l:Output = expand("%:p:h") . "/../html-notes/" . expand("%:p:t:r") . ".html"
   execute "!pandoc -f markdown -t html  --standalone --css=\"../html-notes/vimNotesStyleSheet.css\" \"" . expand("%:p") . "\" -o \"" . l:Output . "\""
endfunction

function! InsertHTMLFilePath()
   let FilePath = ""
   if(&filetype == "notes")
      let FilePath = "../html-files/"
   endif
   return l:FilePath
endfunction

function! InsertImagePath()
   let FilePath = ""
   if(&filetype == "notes")
      let FilePath = "../html-files/images/"
   endif
   return l:FilePath
endfunction
