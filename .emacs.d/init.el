;note: installed packages: emms, orgmode, godmode, slime, geiser, auto-complete, ein
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "dk-personal.el")
(load-user-file "dk-emms.el")
(load-user-file "dk-misc.el")
(load-user-file "dk-org.el")
(load-user-file "dk-octave.el")
(load-user-file "dk-godmode.el")
(load-user-file "dk-slime.el")
(load-user-file "dk-twittering.el")
(load-user-file "dk-auto-complete.el")
(load-user-file "dk-sclang.el")
(load-user-file "dk-python.el")
(load-user-file "dk-ein.el")
