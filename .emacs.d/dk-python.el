;;from pythonnut on emacs-stack exchange to use local python on M-x run-python
(defun run-python-locally (&rest args)
  (interactive (progn (require 'nadvice)
                      (advice-eval-interactive-spec
                       (cadr (interactive-form #'run-python)))))
  (let ((default-directory user-emacs-directory))
    (apply #'run-python args)))

;;from pythonnut on emacs-stackex to use python-shell-send-string, python-shell-send-region, etc.
(eval-when-compile (require 'cl-lib))
(defun nadvice/python-shell-send-string/fix-local-process
    (old-fun string &optional process)
  (cl-letf ((old-psstf (symbol-function #'python-shell--save-temp-file))
            ((symbol-function #'python-shell--save-temp-file)
             (lambda (string)
               (let ((default-directory
                       ;; if buffer is a remote file, but the process is not
                       ;; save the temp file locally, instead of remotely
                       (if (and buffer-file-name
                                (file-remote-p buffer-file-name)
                                (not (plist-get 'remote-tty
                                                (process-plist process))))
                           user-emacs-directory
                         default-directory)))
                 (funcall old-psstf string)))))
    (funcall old-fun string process)))

(advice-add 'python-shell-send-string :around
            #'nadvice/python-shell-send-string/fix-local-process)
