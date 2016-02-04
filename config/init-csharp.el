(require-package 'csharp-mode)
(require-package 'flycheck)
(require-package 'omnisharp)

(add-hook 'csharp-mode-hook
          (lambda ()
            '(c-set-style "k&r")
            'omnisharp-mode
            'flycheck-mode))

(setq omnisharp-server-executable-path "/usr/local/bin/omnisharp")

(after 'company 
  (add-to-list 'company-backends 'company-omnisharp)
  (omnisharp-company-ignore-case nil))

(provide 'init-csharp)
