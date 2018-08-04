(package-initialize)
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(add-to-list 'load-path (expand-file-name "lisp/" user-emacs-directory))

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
(load-user-file "dk-geiser.el")
(load-user-file "dk-twittering.el")
(load-user-file "dk-company.el")
(load-user-file "dk-sclang.el")
(load-user-file "dk-python.el")
(load-user-file "dk-ein.el")
(load-user-file "dk-nov.el")
(load-user-file "dk-ruby.el")
(load-user-file "dk-asm.el")
(load-user-file "dk-platformio.el")
(load-user-file "dk-processing.el")
(load-user-file "dk-clojure.el")
(load-user-file "dk-bufmove.el")
