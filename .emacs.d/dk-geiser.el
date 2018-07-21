;;(setq geiser-repl-read-only-prompt-p nil)
;;(setq geiser-racket--prompt-regexp "<pkgs>.*> \\|\\(mzscheme\\|racket\\)@[^ ]*> ")
(setq geiser-racket--prompt-regexp "(-|racket@|\"[^ ]*\.rkt\")[^ ]*> ")
(setq geiser-racket-init-file "~/.racketrc")
