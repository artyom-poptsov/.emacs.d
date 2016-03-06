;;; javascript.el -- JavaScript mode configuration.

;; setup files ending in “.js” to open in js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(font-lock-add-keywords 'js2-mode
			'(("^\\(\/\/\/\\)\\([ \t]*\\([^\r\n]*\\)\r?\n?\\)"
			   (1 font-lock-firm-comment-semi-face prepend)
			   (2 font-lock-firm-comment-text-face prepend))))

;;; javascript.el ends here.
