;;; eshell.el -- Eshell configuration

(require 'eshell)


(setq eshell-directory-name (expand-file-name "eshell" *emacs-local-dir*))

(setenv "PAGER"     "cat")
(setenv "GIT_PAGER" "cat")
(setenv "TERM"      "xterm-256color")

(setq eshell-history-size 2048)
(setq eshell-prompt-regexp "^.*[#$] ")


(defun pwd-repl-home (pwd)
  (interactive)
  (let* ((home     (expand-file-name (getenv "HOME")))
         (home-len (length home)))
    (if (and (>= (length pwd) home-len)
             (equal home (substring pwd 0 home-len)))
        (concat "~" (substring pwd home-len))
      (car (reverse (split-string pwd "[/]"))))))


;; Configure the prompt
(setq eshell-prompt-function
  (lambda ()
    (concat (user-login-name) "@" (system-name) " "
            (format-time-string "%Y-%m-%d %H:%M" (current-time)) "\n"
            (pwd-repl-home (eshell/pwd)) (if (= (user-uid) 0) " # " " $ "))))

;;; eshell.el ends here
