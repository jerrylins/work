" Vim color file
" Maintainer:   Mingbai <mbbill AT gmail DOT com>

" disable under win32 colsole
if has("win32") && !has("gui_running")
	finish
endif

set background=dark
if version > 580
	" no guarantees for version 5.8 and below, but this makes it stop
	" complaining
	hi clear
	if exists("syntax_on")
	syntax reset
	endif
endif
let g:colors_name="test"

"highlight Normal guifg=gray guibg=grey17 gui=NONE ctermfg=250 ctermbg=235 cterm=NONE

"hi SpecialKey    ctermfg=darkgreen

" hi Constant   ctermfg=red "123  "debug num ="  
"hi SpecialKey    ctermfg=red
" hi PreProc       ctermfg=red "#if
"hi Type          ctermfg=red "int char 
" hi Statement     ctermfg=red "if while for
"hi cFunction       ctermfg =red "c function 
"hi Identifier    ctermfg=red
" hi Special       ctermfg=red  " %d %n \'n'
