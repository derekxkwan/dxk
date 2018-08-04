(add-hook 'after-init-hook 'global-company-mode)

;;borrowed from emacs-wiki
(defun company-complete-or-indent ()
  (interactive)
  (if (company-manual-begin)
      (company-complete-common)
    (indent-according-to-mode)))

(defun company-indent-or-complete ()
  (interactive)
  (if (looking-at "\\_>")
      (company-complete-common)
    (indent-according-to-mode)))

(global-set-key "\t" 'company-indent-or-complete)
