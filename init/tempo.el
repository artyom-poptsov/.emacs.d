;;; tempo.el -- Tempo mode configuration.

(require 'tempo)


(tempo-define-template
 "scm-commentary"
 '(";;; " (p "File: " file-name ) " -- " n
   n
   ";; Copyright (C) "
   (p "Date (yy, yy-yy or 'yy, yy, ...'): " date) " "a
   (p "Author: " author-name) " "
   "<" (p "Mail: " mail-addr) ">" n
   ";; " n
   ";; " n
   n
   "" n
   ";;; Commentary:" n
   n
   ";; " n
   ";; " n
   ";; These methods are exported:" n
   ";; " n
   ";;   " n
   n
   "" n
   ";;; Code:" n
   n
   n
   ";;; " (s file-name) " ends here. ")
 "scm-com"
 "Insert a GNU Guile `commentary' section")

;;; tempo.el ends here.
