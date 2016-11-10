(require-package 'yasnippet)

(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))

(yas-global-mode 1)

(yas-recompile-all)

(provide 'init-yasnippet)
