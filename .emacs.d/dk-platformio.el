(require 'platformio-mode)

;; Add the required company backend.
(add-to-list 'company-backends 'company-irony)

;; Enable irony for all c++ files, and platformio-mode only
;; when needed (platformio.ini present in project root).
(add-hook 'c++-mode-hook (lambda ()
                           (irony-mode)
                           (irony-eldoc)
                           (platformio-conditionally-enable)))

;; Use irony's completion functions.
(add-hook 'irony-mode-hook
          (lambda ()
            (define-key irony-mode-map [remap completion-at-point]
              'irony-completion-at-point-async)

            (define-key irony-mode-map [remap complete-symbol]
              'irony-completion-at-point-async)

            (irony-cdb-autosetup-compile-options)))
            
;; Setup irony for flycheck.
(add-hook 'flycheck-mode-hook 'flycheck-irony-setup)
