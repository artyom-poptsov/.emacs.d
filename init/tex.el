;;; tex.el -- TeX/LaTeX configuration.

(font-lock-add-keywords 'latex-mode
			'(("^\\(\%\%\%\\)\\([ \t]*\\([^\r\n]*\\)\r?\n?\\)"
			   (1 font-lock-firm-comment-semi-face prepend)
			   (2 font-lock-firm-comment-text-face prepend))))

;;; tex.el ends here.
