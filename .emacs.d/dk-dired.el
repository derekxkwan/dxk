;; open directory in same buffer, courtesy emacswiki

(eval-after-load "dired"
      '(progn
         (defadvice dired-advertised-find-file (around dired-subst-directory activate)
           "Replace current buffer if file is a directory."
           (interactive)
            (let* ((orig (current-buffer))
                   ;; (filename (dired-get-filename))
                   (filename (dired-get-filename t t))
                  (bye-p (file-directory-p filename)))
             ad-do-it
             (when (and bye-p (not (string-match "[/\\\\]\\.$" filename)))
               (kill-buffer orig))))))
