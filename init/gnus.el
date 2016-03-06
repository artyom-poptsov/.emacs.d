;;; gnus.el -- Gnus configuration


;;; Required packages

(require 'smtpmail)


;;; Global variables and constants

;; Gnus directory where user's personal configuration lives.
(defconst %gnus-dir (expand-file-name "gnus" *emacs-local-dir*))

(defvar gnus-init-file    (expand-file-name "gnus.el" %gnus-dir))
(defvar gnus-startup-file (expand-file-name ".newsrc" %gnus-dir))

;;; General options

(setq gnus-use-trees        t)
(setq mm-text-html-renderer 'w3m)
(setq imap-ssl-program      "gnutls-cli --port %p %s")

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups
      "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")


;;; Options related to signatures

(setq gnus-posting-styles
      '((".*" (signature-file (expand-file-name "signature" %gnus-dir)))))

(setq gnus-signature-separator
      '("^-- $"
	"^-- *$"
	"^----*$"
	"^ ----*$"
	"^____*$"
	"^====*$"))

(setq gnus-signature-limit '(200.0 "^---*Forwarded article"))


;;;

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)


;;; Gnus news reader

;; fix error with links in articles
(setq mm-w3m-safe-url-regexp nil)

(require 'mm-url)
(defadvice mm-url-insert (after DE-convert-atom-to-rss () )
  "Converts atom to RSS by calling xsltproc."
  (when (re-search-forward "xmlns=\"http://www.w3.org/.*/Atom\"" nil t)
    (goto-char (point-min))
    (message "Converting Atom to RSS... ")
    (call-process-region (point-min) (point-max) "xsltproc" t t nil
			 (expand-file-name "~/atom2rss.xsl") "-")
    (goto-char (point-min))
    (message "Converting Atom to RSS... done")))

(ad-activate 'mm-url-insert)


;;; Check the mail periodically

(gnus-demon-add-handler 'gnus-group-get-new-news 2 t)
(gnus-demon-init)


;;; Various options

(unless standard-display-table
  (setq standard-display-table (make-display-table)))

(defun gnus-user-format-function-thread (dummy)
  (propertize gnus-tmp-thread-tree-header-string 'gnus-face t))

;;; gnus.el ends here.
