;;;; emacs.el -- Main initialization of the Emacs

(desktop-save-mode t)

(setq adaptive-fill-mode t)
(setq column-number-mode t)
(setq show-paren-mode    t)
(setq fringe-mode        nil)
(setq-default indicate-empty-lines t)

;; The menu bar is OK.
(menu-bar-mode   1)

;; Turn off some useless things.
(scroll-bar-mode 0)
(tool-bar-mode   0)

(global-font-lock-mode 1)
(show-paren-mode 1)

(setq tempo-interactive t)

(global-ede-mode 1)

(add-hook 'prog-mode-hook
          (lambda ()
            (when (fboundp 'idle-highlight)
              (idle-highlight t))
            (font-lock-add-keywords nil
                                    '(("\\<\\(FIXME\\|TODO\\|BUG\\|XXX\\):"
                                       1 font-lock-warning-face t)))
            (setq show-trailing-whitespace t)))

(setq bookmark-file (expand-file-name "bookmarks" *emacs-local-dir*))


;;; ELPA

(require 'url-http)
(require 'url)
(require 'package)

(package-initialize)

(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/") t)


;;; Custom font faces.

(defconst font-lock-firm-comment-semi-face 'font-lock-firm-comment-semi-face)
(defface font-lock-firm-comment-semi-face
  '((default (:background "gray21")))
  "PLT-like comments highlighting.")

(defconst font-lock-firm-comment-text-face 'font-lock-firm-comment-text-face)
(defface font-lock-firm-comment-text-face
  '((default (:inherit font-lock-firm-comment-semi-face :foreground "DarkSeaGreen3")))
  "PLT-like comments highlighting.")


;;; Abbrev Mode

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)
;; turn on abbrev mode globally
(setq-default abbrev-mode t)


;;;

(require 'page-break-lines)
(setq page-break-lines-char (string-to-char "┄"))


;;; GNU Global

(add-hook 'c-mode-hook
          '(lambda () (gtags-mode t)))
(add-hook 'java-mode-hook
          (lambda () (gtags-mode t)))


;;; Company

(add-hook 'after-init-hook 'global-company-mode)

;;;; emacs.el ends here.
