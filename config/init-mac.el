;; MAC OS X SPECIFIC CONFIGURATION OPTIONS.

(if (eq system-type 'darwin)
    (progn
      ;; There is an issue with visual-bell on El Capitan.
      ;; We need to change the ring-bell-function.
      (setq ring-bell-function (lambda () (message "*woop*")))
      ;; mac doesnt load path correctly
      (require-package 'exec-path-from-shell)
      (exec-path-from-shell-initialize)
      ;; mac's ls doesn't have --dired
      (setq dired-use-ls-dired nil)))

(provide 'init-mac)
