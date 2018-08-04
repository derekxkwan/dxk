(require 'sclang)
(require 'w3m)
(setq auto-scroll-post-buffer t)

(eval-after-load "w3m"
 '(progn
 (define-key w3m-mode-map [left] 'backward-char)
 (define-key w3m-mode-map [right] 'forward-char)
 (define-key w3m-mode-map [up] 'previous-line)
 (define-key w3m-mode-map [down] 'next-line)))

(load-user-file "company-scel-backend.el")

