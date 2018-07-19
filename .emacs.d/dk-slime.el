(setq inferior-lisp-program "ros -Q run")
;;(load (expand-file-name "~/.roswell/helper.el"))
(require 'slime)
(slime-setup '(slime-tramp slime-asdf))
