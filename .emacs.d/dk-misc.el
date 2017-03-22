;COPYING
; from user nathan of stackoverflow
(defun duplicate-line()                                                                       
  (interactive)                                                                               
  (move-beginning-of-line 1)                                                                  
  (kill-line)                                                                                 
  (yank)                                                                                      
  (newline)                                                                                   
  (yank)                                                                                      
  )                                                                                           
 
(global-set-key (kbd "C-d") 'duplicate-line) 

;NAVIGATION
(global-set-key (kbd "C-n")
    (lambda () (interactive) (forward-line  5)))
(global-set-key (kbd "C-p")
    (lambda () (interactive) (forward-line -5)))


; from lord ophidian of stackoverflow
(defun my-c-mode-common-hook ()
  (line-number-mode 1))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
