(setq gnus-select-method '(nnimap "gmail"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "user@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

(setq user-full-name "Full Name")
(setq user-mail-address "user@gmail.com")
(setq send-mail-function 'smtpmail-send-it)

(setq gnus-permanently-visible-groups ".*"
      gnus-summary-insert-old-articles 50) ; doesn't quite work yet, use / o
;threading stuff
(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-subject)
(setq gnus-summary-same-subject "")
(setq gnus-sum-thread-tree-root "")
(setq gnus-sum-thread-tree-single-indent "")
(setq gnus-sum-thread-tree-leaf-with-other "+-> ")
(setq gnus-sum-thread-tree-vertical "|")
(setq gnus-sum-thread-tree-single-leaf "`-> ")

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
;; Replace [ and ] with _ in ADAPT file names
    (setq nnheader-file-name-translation-alist '((?[ . ?_) (?] . ?_)) )

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;fetching
(setq gnus-auto-select-first nil)        ; Just show the summary, don't fetch the first article.
 (setq gnus-auto-select-next nil)         ; Same thing with next article.

;sorting
(setq gnus-thread-sort-functions
      '((not gnus-thread-sort-by-number)
        gnus-thread-sort-by-score))

;;highlighting and menus
;(setq gnus-visual '(highlight))
(setq gnus-visual t)

(setq gnus-summary-line-format "%U%R %ud %I %(%[%2{ %-21,21f%} %]%) %B%s\n")

(setq gnus-group-list-all-groups t)

;other
(setq mail-signature t
    gnus-show-mime t
    gnus-show-mime-method 'gnus-article-preview-mime-message
     gnus-suppress-duplicates t
    gnus-confirm-mail-reply-to-news t
    gnus-check-new-newsgroups 'ask-server
     gnus-fetch-old-headers 'some
    )

;;dired support (new in gnus 5.10.6)
(require 'gnus-dired)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

;; Signature separators

(setq gnus-signature-separator
      '("^-- $" ; The standard
        "^-- *$" ; A common mangling
        )) 

(setq gnus-signature-limit nil)


;; to fix broken gnus attachment for pdf's
(setq mm-content-transfer-encoding-defaults
      (cons '("application/pdf" base64)
            mm-content-transfer-encoding-defaults))


;; check attachments are attached
;; from Daniel Barlow's Online Diary (http://ww.telent.net/diary/2003/1/)
(defun check-attachments-attached ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let* (
           ;; Nil when message came from outside (eg calling emacs as editor)
           ;; Non-nil marker of end of headers.
           (internal-messagep
            (re-search-forward
             (concat "^" (regexp-quote mail-header-separator) "$") nil t))
           (end-of-headers ; Start of body.
            (copy-marker
             (or internal-messagep
                 (re-search-forward "^$" nil t)
                 (point-min))))
           (limit
            (or (re-search-forward "^-- $" nil t)
                (point-max)))
           (old-case-fold-search case-fold-search))
      (unwind-protect
          (progn
            (goto-char end-of-headers)
            (when (search-forward "attach" limit t)
              (goto-char end-of-headers)
              ;; the word 'attach' has been used, can we find an
              ;; attachment?
              (unless
                  (or (re-search-forward "^<#/" limit t)
                      (y-or-n-p
                       "Found the word `attach' but no MIME attachment: send
anyway?"
                       )
                      (error "Aborted send")))))
        (set-marker end-of-headers nil)))))
                                        ;
(add-hook 'message-send-hook 'check-attachments-attached)

;;(defvar gnus-subscribe-groups-done nil
;;  "Only subscribe groups once.  Or else Gnus will NOT restart.")
;;(unless gnus-subscribe-groups-done
;;  (gnus-subscribe-hierarchically "nnimap+hotmail:Inbox")
;;  (setq gnus-subscribe-groups-done t))
