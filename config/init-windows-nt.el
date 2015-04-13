
;;; SYMANTEC!!! *shakes fist*
(setq w32-get-true-file-attributes nil)

;;; projectile hack
(after 'projectile
  (setq projectile-indexing-method 'alien))

(provide 'init-windows-nt)

