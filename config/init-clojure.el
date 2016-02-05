(require-package 'clojure-mode)
(require-package 'cider)
(require-package 'smartparens)
(require-package 'evil-smartparens)
(require-package 'clojure-cheatsheet)


;;; smartparens in clojure: cool stuff
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)

(with-eval-after-load 'smartparens
  (sp-pair "'" nil :actions :rem))


(provide 'init-clojure)


