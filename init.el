;;;; init.el -- General Emacs initialization

(load-file "~/.emacs.d/crane/init.elc")


;;; Load files

;; Load Emacs extensions
(mapc (lambda (name) (crane:load-extension name))
      '("wikipedia-mode"
        "column-marker"
        "epubmode"
        "gnus-notify"
        "xquery-mode/xquery-mode"
        "xquery-mode/setup"))

;; Load initialization files
(mapc (lambda (name) (crane:load-init name))
      '("arduino"
        "bbdb"
        "bnf"
        "c"
        "dired"
        "emacs"
        "ac"
        "emms"
        "epa"
        "eshell"
        "gnuplot"
        "gnus"
        "java"
        "lisp"
        "markdown"
        "jabber"
        "tempo"
        "orgmode"
        "newsticker"
        "ruby"
        "semantic"
        "shell-script"
        "tex"
        "arduino"
        "sql"))

;; Load user configuration
(crane:load-local "init")


;;; Themes

(load-theme 'zenburn)


;;; Required packages

(require 'column-marker)
(require 'linum)
(require 'tramp)
(require 'cedet)
(require 'ede)
;(require 'ecb)
(require 'xml)
(require 'nnir)
(require 'gnus-notify)


;;; Guix

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
(require 'guix-init nil t)


;;; Heap

;; Make Emacs see local Info files.
(push "/usr/local/share/info" Info-directory-list)

(add-hook 'before-save-hook 'time-stamp)


(add-to-list 'load-path "/usr/share/emacs/site-lisp/tex-utils")
(require 'xdvi-search)

;;;; init.el ends here.
