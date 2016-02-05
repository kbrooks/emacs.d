(require-package 'csharp-mode)
(require-package 'flycheck)
(require-package 'omnisharp)

(defun my-csharp-hook ()
  (progn
    (c-set-style "k&r")
    (omnisharp-mode)
    (flycheck-mode)))

(add-hook 'csharp-mode-hook 'my-csharp-hook)

(setq omnisharp-server-executable-path "/usr/local/bin/omnisharp")

(with-eval-after-load 'company 
  (add-to-list 'company-backends 'company-omnisharp))

(provide 'init-csharp)
