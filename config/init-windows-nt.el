
;;; SYMANTEC!!! *shakes fist*
(setq w32-get-true-file-attributes nil)

;;; projectile hack
(after 'projectile
  (setq projectile-indexing-method 'alien))

(defun my-remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'cider-repl-mode-hook 'my-remove-dos-eol) ;Remove ^M from clojure repl in windows

(provide 'init-windows-nt)

