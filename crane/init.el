;;; init.el -- Crane initialization.

(require 'bytecomp)


;;; Global variables

(defconst *emacs-dir* (expand-file-name ".emacs.d" "~")
  "Root emacs directory.")
(defconst *emacs-init-dir* (expand-file-name "init" *emacs-dir*)
  "Directory that contains Emacs initialization files.")
(defconst *emacs-lisp-dir* (expand-file-name "lisp" *emacs-dir*)
  "Emacs extensions directory.")


;; Honor the XDG specs:
;; <http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html>

(defconst *emacs-cache-dir*
  (expand-file-name ".cache/emacs/" (getenv "HOME"))
  "Emacs cache.")
(defconst *emacs-local-dir*
  (expand-file-name ".local/share/emacs/" (getenv "HOME"))
  "User's private files.")


;;; Useful procedures

(defun crane:compile-if-older (file)
  "Compile FILE if it is older or if a compiled version is not
exist."
  (let ((el-file  (concat file ".el"))
        (elc-file (concat file ".elc")))
    (when (or (not (file-exists-p elc-file))
              (file-newer-than-file-p el-file elc-file))
      (byte-compile-file el-file))))

(defun crane:load-module (name dir)
  "Load module NAME from DIR."
  (let* ((file     (expand-file-name name dir))
         (elc-file (concat file ".elc"))
         (el-file  (concat file ".el")))
    (crane:compile-if-older file)
    (if (file-exists-p (expand-file-name elc-file dir))
        (load-file (expand-file-name elc-file dir))
      (load-file (expand-file-name el-file dir)))))

(defun crane:load-init (name)
  "Load initialization module NAME."
  (crane:load-module name *emacs-init-dir*))

(defun crane:load-extension (name)
  "Load Emacs extension NAME."
  (crane:load-module name *emacs-lisp-dir*))

(defun crane:load-local (name)
  "Load a local file NAME."
  (crane:load-module name *emacs-local-dir*))

;;; init.el ends here
