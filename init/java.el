;;; java.el -- Java/JDE mode configuration

(autoload 'jde-mode "jde" "JDE mode" t)
(setq auto-mode-alist
      (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

;; Highlight some keywords in comments:
(add-hook 'jde-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(XXX\\|FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))

(crane:load-extension "jde-maven")
(require 'jde-maven)

(c-add-style "java-sun"
             '("java"
               (c-offsets-alist
                (func-decl-cont . 8))
               (substatement . 8)))

;;; java.el ends here
