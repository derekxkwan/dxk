(defun my-hook ()
  (local-set-key ";" 'self-insert-command))

(add-hook 'asm-mode-hook 'my-hook)
