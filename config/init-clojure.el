(require-package 'clojure-mode)
(require-package 'cider)
(require-package 'smartparens)

;;; smartparens in clojure and cider: cool stuff
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-mode-hook 'smartparens-strict-mode)

(provide 'init-clojure)


