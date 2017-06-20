"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: "/home/caciano/.vim/dante.vim"
" Created: "Thu, 23 May 2002 00:12:20 -0300 (caciano)"
" Updated: "Sat, 24 Aug 2002 14:04:21 -0300 (caciano)"
" Copyright (C) 2002, Caciano Machado <caciano@inf.ufrgs.br>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme Option:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi clear
if exists("syntax on")
        syntax reset
endif
let g:colors_name = "dante"

" General colors
hi Normal       ctermfg=gray guifg=peachpuff3 guibg=black
hi Directory    term=bold ctermfg=blue guifg=royalblue
hi ErrorMsg     term=standout ctermfg=white ctermbg=red guifg=white guibg=red3
hi NonText      term=bold ctermfg=darkgray guibg=gray3 guifg=gray20
hi SpecialKey   term=bold ctermfg=darkgray guifg=gray30
hi LineNr       term=underline ctermfg=darkgray guifg=ivory4 guibg=gray4
hi IncSearch    term=reverse cterm=reverse gui=reverse,bold guifg=darkgoldenrod2
hi Search       term=reverse ctermfg=black ctermbg=yellow guifg=gray10 guibg=gold2
hi Visual       term=bold,reverse cterm=bold,reverse ctermfg=gray ctermbg=black gui=bold,reverse guifg=gray40 guibg=black
hi VisualNOS    term=bold,underline cterm=bold,underline gui=bold,underline
hi MoreMsg      term=bold ctermfg=green gui=bold guifg=olivedrab1
hi ModeMsg      term=bold cterm=bold gui=bold
hi Question     term=standout ctermfg=green gui=bold guifg=olivedrab1
hi WarningMsg   term=standout ctermfg=red gui=bold guifg=red3
hi WildMenu     term=standout ctermfg=black ctermbg=yellow guifg=black guibg=gold2
hi Folded       term=standout ctermfg=blue ctermbg=white guifg=royalblue1 guibg=white
hi FoldColumn   term=standout ctermfg=blue ctermbg=white guifg=royalblue3 guibg=white
hi DiffAdd      ctermbg=22 cterm=bold
hi DiffChange   ctermbg=53 cterm=bold
hi DiffDelete   ctermbg=52
hi DiffText     ctermbg=18 cterm=bold
hi Cursor       guifg=bg guibg=fg
hi lCursor      guifg=bg guibg=fg
hi StatusLine   term=reverse cterm=reverse gui=reverse guifg=gray60
hi StatusLineNC term=reverse cterm=reverse gui=reverse guifg=gray40
hi VertSplit    term=reverse cterm=reverse gui=bold,reverse guifg=gray40
hi Title        term=bold ctermfg=magenta gui=bold guifg=aquamarine
hi clear SignColumn

" syntax hi colors
hi Comment      term=bold ctermfg=darkcyan guifg=cyan4
hi PreProc      term=underline ctermfg=darkblue cterm=bold guifg=dodgerblue4
hi Constant     term=underline ctermfg=darkred guifg=firebrick3
hi Type         term=underline ctermfg=darkgreen gui=none guifg=chartreuse3
hi Statement    term=bold ctermfg=darkyellow gui=none guifg=gold3
hi Identifier   term=underline ctermfg=darkgreen guifg=darkolivegreen4
hi Ignore       term=bold ctermfg=darkgray guifg=gray45
hi Special      term=underline ctermfg=brown guifg=sienna
hi Error        term=reverse ctermfg=gray ctermbg=red guifg=gray guibg=red3
hi Todo         term=standout ctermfg=black ctermbg=yellow gui=bold guifg=gray10 guibg=yellow4
hi Underlined   term=underline cterm=underline ctermfg=cyan gui=underline guifg=slateblue
hi Number       term=underline ctermfg=darkred guifg=red2

" My additions
hi RedundantSpaces ctermbg=152
" For syntastic syntax warnings
hi SpellCap ctermfg=darkred guifg=red2
" For spelling mistakes
hi SpellBad ctermbg=darkred
hi SpellLocal ctermbg=darkblue ctermfg=black
" vim-indent-guides overrides because ewwwww for defaults
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=234
" 80-line highlight
hi ColorColumn ctermbg=235 term=reverse
" For light conditions uncomment this:
" hi ColorColumn ctermbg=159 term=reverse

" syntax hi links
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Function        Identifier
hi link Number          Constant
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Operator        Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
