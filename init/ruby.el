;;; ruby.el -- Ruby mode configuration

(font-lock-add-keywords 'ruby-mode
			'(("^\\(\#\#\#\\)\\([ \t]*\\([^\r\n]*\\)\r?\n?\\)"
			   (1 font-lock-firm-comment-semi-face prepend)
			   (2 font-lock-firm-comment-text-face prepend))))

;; Highlight some keywords in comments:
(add-hook 'ruby-mode-hook
          (let ((keywords '(("\\<\\(FIXME\\|TODO\\|BUG\\|XXX\\):" 1 font-lock-warning-face t))))
            (lambda ()
              (font-lock-add-keywords nil keywords))))

;;; ruby.el ends here.
