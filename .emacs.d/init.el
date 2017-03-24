;note: installed packages: emms, orgmode, godmode
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
(load-user-file "dk-godmode.el")
