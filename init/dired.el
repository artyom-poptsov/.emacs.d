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

;;; dired.el ends here.
