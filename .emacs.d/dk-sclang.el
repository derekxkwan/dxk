(require 'sclang)
(require 'w3m)
(setq auto-scroll-post-buffer t)

(eval-after-load "w3m"
 '(progn
 (define-key w3m-mode-map [left] 'backward-char)
 (define-key w3m-mode-map [right] 'forward-char)
 (define-key w3m-mode-map [up] 'previous-line)
 (define-key w3m-mode-map [down] 'next-line)))

(load-user-file "company-sclang-backend.el")

;; need this since it doesn't seem to follow under a prog mode
(defun sclang-mode-line-hook ()
  (if (version<= "26.0.50" emacs-version )
      (display-line-numbers-mode 1)
    (linum-mode 1))
  )


(add-hook 'sclang-mode-hook #'display-line-numbers-mode)
