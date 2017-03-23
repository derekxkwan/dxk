;COPYING
;from macchan of emacswiki, C-w and M-w cuts and copies lines respectively
(defadvice kill-ring-save (before slick-copy activate compile) "When called
  interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end)) (message
  "Copied line") (list (line-beginning-position) (line-beginning-position
  2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
        (line-beginning-position 2)))))


;NAVIGATION
(global-set-key (kbd "C-n")
    (lambda () (interactive) (forward-line  5)))
(global-set-key (kbd "C-p")
    (lambda () (interactive) (forward-line -5)))


; from lord ophidian of stackoverflow
(defun my-c-mode-common-hook ()
  (line-number-mode 1))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
