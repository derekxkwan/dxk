;;GENERAL CONFIG
(setq python-shell-interpreter "/usr/bin/python3")

;;COPYING
;;from macchan of emacswiki, C-w and M-w cuts and copies lines respectively
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


;;NAVIGATION
(global-set-key (kbd "C-n")
    (lambda () (interactive) (forward-line  5)))
(global-set-key (kbd "C-p")
    (lambda () (interactive) (forward-line -5)))

;;from emacswiki
(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key (kbd "C-%") 'goto-match-paren)

;; from lord ophidian of stackoverflow
(defun my-c-mode-common-hook ()
  (line-number-mode 1))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;ido mode stuff
(ido-mode 1)
(setq ido-separator "\n")

;; WINDOW SPLIT STUFF
;; changing window split sizes from phils of stackoverflow
(defun halve-other-window-height ()
  "Expand current window to use half of the other window's lines."
  (interactive)
  (enlarge-window (/ (window-height (next-window)) 2)))

(global-set-key (kbd "C-c 2") 'halve-other-window-height)

(defun twothird-other-window-width ()
  "Expand current window to use half of the other window's width."
  (interactive)
  (enlarge-window-horizontally (/ (window-width (next-window)) 3)))

(global-set-key (kbd "C-c 3") 'twothird-other-window-width)

;;toggle window split mode from jeffdwork of emacswiki
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)

;;recentfiles stuff
(recentf-mode 1)
(setq recentf-max-menu-items 100)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

