;;;; WINDOWS SPECIFIC CONFIGURATION OPTIONS

;; SYMANTEC!!! *shakes fist*
(if (eq system-type 'windows-nt)
    (progn 
      (setq w32-get-true-file-attributes nil)

      ;; projectile hack
      (with-eval-after-load 'projectile
        (setq projectile-indexing-method 'alien))

      (defun my-remove-dos-eol ()
        "Do not show ^M in files containing mixed UNIX and DOS line endings."
        (interactive)
        (setq buffer-display-table (make-display-table))
        (aset buffer-display-table ?\^M []))

      ;; Remove ^M from clojure repl in windows
      (with-eval-after-load 'cider-mode
        (add-hook 'cider-repl-mode-hook 'my-remove-dos-eol))))

(provide 'init-windows-nt)

