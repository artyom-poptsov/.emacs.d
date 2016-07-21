;;;; init.el -- General Emacs initialization

(load-file "~/.emacs.d/crane/init.elc")


;;; ELPA

(require 'url-http)
(require 'url)
(require 'package)

(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/") t)

(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))


;; List of packages.
(setq package-list '(company
                     geiser
                     gitignore-mode
                     dired-isearch
                     js2-mode
                     js-comint
                     paredit
                     page-break-lines
                     pretty-lambdada
                     dockerfile-mode
                     idle-highlight-mode
                     inf-ruby
                     markdown-mode
                     nodejs-repl
                     ruby-block
                     ruby-compilation
                     ruby-tools
                     rvm
                     xlicense
                     yaml-mode
                     smartparens
                     wtf
                     zenburn-theme
                     nurumacs))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


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
        "sql"
        "nurumacs-init"))

;; Load user configuration
(crane:load-local "init")


;;; Themes

(load-theme 'zenburn)


;;; Required packages

(unless (require 'column-marker "column-marker" t)
  (message "Extension 'column-marker' is not installed"))

(require 'linum)
(require 'tramp)
(require 'cedet)
(require 'ede)
;(require 'ecb)
(require 'xml)
(require 'nnir)

(unless (require 'gnus-notify "gnus-notify" t)
  (message "Extension 'gnus-notify' is not installed"))


;;; Guix

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
(require 'guix-init nil t)


;;; Heap

;; Make Emacs see local Info files.
(push "/usr/local/share/info" Info-directory-list)

(add-hook 'before-save-hook 'time-stamp)


(add-to-list 'load-path "/usr/share/emacs/site-lisp/tex-utils")

(unless (require 'xdvi-search "xdvi-search" t)
  (message "Extension 'xdvi-search' is not installed"))

;;;; init.el ends here.
