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

; from lord ophidian of stackoverflow
(defun my-c-mode-common-hook ()
  (line-number-mode 1))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
