;(require 'package)
;(add-to-list 'package-archives 
;   '("marmalade" .
;     "http://marmalade-repo.org/packages/"))
;(package-initialize)
(setq load-path (cons "~/.emacs.d/tidal/" load-path))
(require 'haskell-mode)
(require 'tidal)
(load-user-file "company-tidal-backend.el")
(setq tidal-interpreter "/home/dxk/.ghcup/bin/ghci")
(setq tidal-boot-script-path "/home/dxk/tidalstuff/config/BootTidal.hs")
(add-hook 'tidal-mode-hook (lambda () (interactive-haskell-mode -1)))
