(load-library "inf-haskell")

(defun my-inf-haskell-hook ()
  (setq comint-prompt-regexp 
        (concat comint-prompt-regexp "\\|^.> ")))

(add-to-list 'inferior-haskell-mode-hook 'my-inf-haskell-hook)
