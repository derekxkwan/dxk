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
(set-frame-font "Inconsolata 14" nil t)

;;color scheme
(custom-set-variables
 '(custom-enabled-themes (quote (manoj-dark))))
(custom-set-faces )

;;disable newline after enter
(setq-default electric-indent-inhibit t)
