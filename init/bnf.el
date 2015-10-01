;;; bnf.el -- BNF mode
;; See <https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_Form>

(define-generic-mode 'bnf-mode
  ()   ; comment char: inapplicable because # must be at start of line
  nil  ; keywords
  '(("^#.*" . 'font-lock-comment-face)         ; comments at start of line
    ("^<.*?>" . 'font-lock-function-name-face) ; LHS nonterminals
    ("<.*?>" . 'font-lock-builtin-face)        ; other nonterminals
    ("::=" . 'font-lock-constant-face)         ; "goes-to" symbol
    ("\|" . 'font-lock-warning-face)           ; "OR" symbol
    ("\{:\\|:\}" . 'font-lock-keyword-face))   ; special pybnf delimiters
  '("\\.bnf\\'" "\\.pybnf\\'")                 ; filename suffixes
  nil                                          ; extra function hooks
  "Major mode for BNF highlighting.")

;;; bnf.el ends here
