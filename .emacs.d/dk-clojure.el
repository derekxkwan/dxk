;;stuff for inf-clojure

(defun figwheel-repl ()
  (interactive)
  (inf-clojure "lein figwheel"))

(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)

(defun figwheel-repl-running ()
  (interactive)
  (inf-clojure "lein trampoline run -m clojure.main script/repl.clj"))

;; for socket repl
(setf inf-clojure-boot-cmd '("localhost" . 5555))
(setf inf-clojure-tools-deps-cmd '("localhost" . 5555)):
(setf inf-clojure-lein-cmd '("localhost" . 5555))

;;script/repl.clj = (use 'figwheel-sidecar.repl-api)
;;(start-figwheel!)
;;(cljs-repl)
