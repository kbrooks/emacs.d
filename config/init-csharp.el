(defun my-csharp-hook ()
  (progn
    (c-set-style "java")
    (c-set-offset 'arglist-intro '+)
    (omnisharp-mode)
    (flycheck-mode)))
(use-package flycheck)
(use-package omnisharp)
(use-package yasnippet)


(add-hook 'csharp-mode-hook 'my-csharp-hook)

(setq omnisharp-server-executable-path "/usr/local/bin/omnisharp")

(with-eval-after-load 'company 
  (add-to-list 'company-backends 'company-omnisharp))

(provide 'init-csharp)
