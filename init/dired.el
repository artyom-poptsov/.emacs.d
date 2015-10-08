;;; dired.el -- Dired initialization

(require 'dired)

(setq dired-listing-switches		"-Dalh")
(setq list-directory-verbose-switches	"-CF")

;; Use the cache directory to store thumbnails
(setq image-dired-dir (expand-file-name "image-dired" *emacs-cache-dir*))


;;; Fix behaviour of M-< and M-> in Dired mode.
;; See <http://whattheemacsd.com//setup-dired.el-02.html>

(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

;;; Do isearch in Dired but match only at file names.
;; Requires 'dired-isearch' package.

(define-key dired-mode-map (kbd "C-s") 'dired-isearch-forward)
(define-key dired-mode-map (kbd "C-r") 'dired-isearch-backward)
(define-key dired-mode-map (kbd "ESC C-s") 'dired-isearch-forward-regexp)
(define-key dired-mode-map (kbd "ESC C-r") 'dired-isearch-backward-regexp)

;;; dired.el ends here.
