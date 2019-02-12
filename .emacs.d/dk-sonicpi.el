(add-to-list 'load-path "~/.emacs.d/sonic-pi.el/")
(require 'sonic-pi)
(setq sonic-pi-path "/usr/lib/sonic-pi/") ; Must end with "/"

;; Optionally define a hook
(add-hook 'sonic-pi-mode-hook
          (lambda ()
            ;; This setq can go here instead if you wish
            (inf-ruby-minor-mode -1)
            ;;(define-key ruby-mode-map "\C-c\M-j" 'sonic-pi-jack-in)
            ;;(define-key ruby-mode-map "\C-c\M-c" 'sonic-pi-connect)
            ;;(define-key ruby-mode-map "\C-c\C-k" 'sonic-pi-send-buffer)
            ;;(define-key ruby-mode-map "\C-c\C-r" 'sonic-pi-send-region)
            ;;(define-key ruby-mode-map "\C-c\C-q" 'sonic-pi-quit)
            ;;(define-key ruby-mode-map "\C-c\C-b" 'sonic-pi-stop-all)
            ;;(define-key ruby-mode-map "\C-c\C-c" 'sonic-pi-send-live-loop)
            ))
