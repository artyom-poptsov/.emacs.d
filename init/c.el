;;; c.el -- C-Mode initialization

;; See <https://www.gnu.org/prep/standards/>
(setq c-default-style "gnu")

;; Mixing tabs and spaces is an ugly practise.
(setq-default indent-tabs-mode nil)

;; Mixing tabs and spaces is an ugly practise.
;; XXX: Seems to be redundant.
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (if (string-equal c-default-style "gnu")
		(setq indent-tabs-mode nil))))

(setq c-mode-common-hook
      '(lambda nil (interactive) (column-marker-1 80)))

(setq c-offsets-alist nil)

;; Highlight some keywords in comments:
(add-hook 'c-mode-common-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(FIXME\\|TODO\\|BUG\\):"
                                       1
                                       font-lock-warning-face t)))))

;; GNU Mach headers
(add-to-list 'auto-mode-alist '("\\.srv\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.defs\\'" . c-mode))

;;; c.el ends here.
