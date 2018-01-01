;; all from gnu website
;; add .m hook

(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; abbrevs, auto-fill, font-lock, etc.

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))
