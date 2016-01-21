;; There is an issue with visual-bell on El Capitan. We need to change the ring-bell-function.
(setq ring-bell-function (lambda () (message "*woop*")))

(provide 'init-mac)
