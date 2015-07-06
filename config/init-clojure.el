(require-package 'clojure-mode)
(require-package 'cider)
(require-package 'smartparens)
(require-package 'evil-smartparens)
(require-package 'clojure-cheatsheet)


;;; smartparens in clojure and cider: cool stuff
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-mode-hook 'smartparens-strict-mode)

(after 'smartparens
  (sp-pair "'" nil :actions :rem))


(provide 'init-clojure)


