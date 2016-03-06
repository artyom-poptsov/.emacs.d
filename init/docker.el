;;; docker.el -- Docker related configuration.

(defconst %dockerfile-mode-dir (expand-file-name "lisp/dockerfile-mode/" *emacs-lisp-dir*))


(if (file-exists-p %dockerfile-mode-dir)
    (progn
      (crane:load-extension "dockerfile-mode/dockerfile-mode")
      (require 'dockerfile-mode)
      (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))
  (lwarn :warning "Dockerfile mode is not found in '%s'."
         %dockerfile-mode-dir))

;;; docker.el ends here.
