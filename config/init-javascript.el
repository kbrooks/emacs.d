;;;; react
(require-package 'jsx-mode)
(require-package 'web-mode)
(require-package 'flycheck)

;https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking/
(after 'flycheck
  (flycheck-define-checker jsxhint-checker
    "A JSX syntax and style checker based on JSXHint."
    :command ("jsxhint" source)
    :error-patterns ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
    :modes (jsx-mode web-mode)))

(add-hook 'jsx-mode-hook
          (lambda ()
            (flycheck-select-checker 'jsxhint-checker)
            (flycheck-mode)))

(provide 'init-javascript)
