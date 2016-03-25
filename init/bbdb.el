;;; bbdb.el --  Big Brother Data Base (BBDB) intialization

(when (require 'bbdb "bbdb" t)
  ;; Path to DB
  (setq bbdb-file (expand-file-name "bbdb" *emacs-local-dir*))

  ;; Init
  (bbdb-initialize)

  ;; It allows to use BBDB's autcompletion features in the Gnus.
  (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

  ;; Set variables.
  (setq bbdb-offer-save 1                        ; 1 means save-without-asking
        bbdb-use-pop-up t                        ; allow popups for addresses

        bbdb-electric-p t                        ; be disposable with SPC
        bbdb-popup-target-lines  1               ; very small

        bbdb-dwim-net-address-allow-redundancy t ; always use full name
        bbdb-quiet-about-name-mismatches 2       ; show name-mismatches 2 secs

        ;; add new addresses to existing...
        bbdb-always-add-address t
        ;; ...contacts automatically
        bbdb-canonicalize-redundant-nets-p t     ; x@foo.bar.cx => x@bar.cx

        bbdb-completion-type nil                 ; complete on anything

        bbdb-complete-name-allow-cycling t       ; cycle through matches
        ;; this only works partially

        bbbd-message-caching-enabled t           ; be fast
        bbdb-use-alternate-names t               ; use AKA

        bbdb-elided-display t                    ; single-line addresses

        ;; auto-create addresses from mail
        bbdb/mail-auto-create-p 'bbdb-ignore-some-messages-hook

        ;; don't ask about fake addresses
        ;; NOTE: there can be only one entry per header (such as To, From)
        ;; http://flex.ee.uec.ac.jp/texi/bbdb/bbdb_11.html
        bbdb-ignore-some-messages-alist '(( "From" . "no.?reply\\|twitter"))))

;;; bbdb.el ends here.
