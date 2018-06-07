(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(defun jruby ()
  (interactive)
  (inf-ruby "jruby"))
