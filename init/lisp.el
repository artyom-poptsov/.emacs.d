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


;;; Pretty lambda.

(defun my-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          )))

(add-hook 'scheme-mode-hook 'my-pretty-lambda)
(global-prettify-symbols-mode 1)

;;;

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


;;; Geiser

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(require 'geiser-install)

;;; lisp.el ends here.
