(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;various prefs
;paren mode
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq x-select-enable-clipboard t) ;copy to clipboard for x

;color scheme
(custom-set-variables
 '(custom-enabled-themes (quote (manoj-dark))))
(custom-set-faces )


 ;;** EMMS
 ;; Autoload the id3-browser and bind it to F7.
 ;; You can change this to your favorite EMMS interface.
 (autoload 'emms-smart-browse "emms-browser.el" "Browse with EMMS" t)
 (global-set-key [(f7)] 'emms-smart-browse)

 (with-eval-after-load 'emms
   (emms-standard) ;; or (emms-devel) if you want all features
   (setq emms-source-file-default-directory "~/Music"
         emms-info-asynchronously t
         emms-show-format "♪ %s")

   ;; Might want to check `emms-info-functions',
   ;; `emms-info-libtag-program-name',
   ;; `emms-source-file-directory-tree-function'
   ;; as well.

   ;; Determine which player to use.
   ;; If you don't have strong preferences or don't have
   ;; exotic files from the past (wma) `emms-default-players`
   ;; is probably all you need.
   (if (executable-find "mplayer")
       (setq emms-player-list '(emms-player-mplayer))
     (emms-default-players))
   )
