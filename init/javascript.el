;;; javascript.el -- JavaScript mode configuration.

(font-lock-add-keywords 'js-mode
			'(("^\\(\/\/\/\\)\\([ \t]*\\([^\r\n]*\\)\r?\n?\\)"
			   (1 font-lock-firm-comment-semi-face prepend)
			   (2 font-lock-firm-comment-text-face prepend))))

;;; javascript.el ends here.
