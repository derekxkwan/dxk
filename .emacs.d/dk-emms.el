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
