;;; shell-script.el -- Shell Script Mode configuration.

(font-lock-add-keywords 'sh-mode
			'(("^\\(\#\#\#\\)\\([ \t]*\\([^\r\n]*\\)\r?\n?\\)"
			   (1 font-lock-firm-comment-semi-face prepend)
			   (2 font-lock-firm-comment-text-face prepend))))

;; Highlight some keywords in comments:
(add-hook 'sh-mode-hook
          (let ((keywords '(("\\<\\(FIXME\\|TODO\\|BUG\\|XXX\\):" 1 font-lock-warning-face t))))
            (lambda ()
              (font-lock-add-keywords nil keywords))))

;;; shell-script.el ends here.
