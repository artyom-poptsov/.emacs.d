;;; lisp.el -- Lisp modes initialization.


;;; Scheme initialization

(require 'scheme)

;; Use GNU Guile as the default interpreter
(setq scheme-program-name "guile")

;; Set Emacs fontify style
(setq quack-fontify-style 'emacs)

;; Highlight some keywords in comments
(add-hook 'scheme-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(FIXME\\|TODO\\|BUG\\|XXX\\):"
                                       1 font-lock-warning-face t)))))

(pretty-lambda-for-modes)
(setq geiser-mode-auto-p t)

(add-hook 'scheme-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))


;; Highlight comments started with ';;;'. This is a PLT-like style
;; taken from the Quack mode.  It looks pretty nice so why not use it
;; everywhere?..
(font-lock-add-keywords 'emacs-lisp-mode
			'(("^\\(\;\;\;\\)\\([ \t]*\\([^\r\n]*\\)\r?\n?\\)"
			   (1 font-lock-firm-comment-semi-face prepend)
			   (2 font-lock-firm-comment-text-face prepend))))

(font-lock-add-keywords 'scheme-mode
			'(("^\\(\;\;\;\\)\\([ \t]*\\([^\r\n]*\\)\r?\n?\\)"
			   (1 font-lock-firm-comment-semi-face prepend)
			   (2 font-lock-firm-comment-text-face prepend))))

;;; lisp.el ends here.
