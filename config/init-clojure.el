(require-package 'cider)
(require-package 'clj-refactor)
(require-package 'clojure-cheatsheet)
(require-package 'clojure-mode)
(require-package 'evil-smartparens)
(require-package 'flycheck)
(require-package 'flycheck-clojure)
(require-package 'smartparens)


(defun my-clojure-hook ()
  (progn
    (smartparens-strict-mode)
    (flycheck-mode)
    (clj-refactor-mode 1)
))

;;; smartparens in clojure: cool stuff
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
