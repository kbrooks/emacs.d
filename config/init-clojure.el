(use-package cider)
(use-package clj-refactor)
(use-package clojure-cheatsheet)
(use-package clojure-mode)
(use-package evil-smartparens)
(use-package flycheck)
(use-package flycheck-clojure)
(use-package smartparens)

(defun my-clojure-hook ()
  (progn
    (smartparens-strict-mode)
    (flycheck-mode)
    (clj-refactor-mode 1)))

(add-hook 'clojure-mode-hook 'my-clojure-hook)

(eval-after-load 'flycheck '(flycheck-clojure-setup))

(with-eval-after-load 'smartparens
  (sp-pair "'" nil :actions :rem))

;;;  eldoc: docs in minibuffer
(add-hook 'clojure-mode-hook 'eldoc-mode)
;;; clj-refactor setup
(setq cljr-auto-sort-ns nil)
(setq cljr-favor-prefix-notation nil)

(provide 'init-clojure)
