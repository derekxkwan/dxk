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
