(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
;;(package-initialize)

;;various prefs
;;paren mode
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq x-select-enable-clipboard t) ;copy to clipboard for x

;;font
(set-frame-font "DejaVu Sans Mono 13" nil t)

(setq python-shell-interpreter "/usr/bin/python3" python-shell-interpreter-args "-i")

(load-theme 'monokai t)

;; fix dull highlight 
(set-face-attribute 'region nil :background "#666" :foreground "#ffffff")

;;disable newline after enter
(setq-default electric-indent-inhibit t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show line numbers for "prog-mode derived major modes"
(if (version<= "26.0.50" emacs-version )
    (add-hook 'prog-mode-hook #'display-line-numbers-mode)
    (add-hook 'prog-mode-hook #'linum-mode)
  )

;; disable truncate lines in prog mode
(add-hook 'prog-mode-hook (lambda () (setq truncate-lines nil)))



