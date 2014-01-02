"========================================================
" Highlight All Math Operator
"========================================================
" C math operators
syn match cMathOperator display "[-+\*/%=]"
" C pointer operators
syn match cPointerOperator display "->\|\."
" C logical   operators - boolean results
syn match cLogicalOperator display "[!<>]=\="
syn match cLogicalOperator display "=="
" C bit operators
syn match cBinaryOperator display "\(&\||\|\^\|<<\|>>\)=\="
syn match cBinaryOperator display "\~"
syn match cBinaryOperatorError display "\~="
" More C logical operators - highlight in preference to binary
syn match cLogicalOperator display "&&\|||"
syn match cLogicalOperatorError display "\(&&\|||\)="

" Math Operator
hi cMathOperator ctermfg=66 cterm=bold
hi cPointerOperator ctermfg=66 cterm=bold
hi cLogicalOperator ctermfg=66 cterm=bold
hi cBinaryOperator ctermfg=66 cterm=bold
hi cBinaryOperatorError ctermfg=66 cterm=bold
hi cLogicalOperator ctermfg=66 cterm=bold
hi cLogicalOperatorError ctermfg=66 cterm=bold
hi cFunction ctermfg=173
hi Comment ctermfg=66
