;;;; react
(require-package 'web-mode)
(require-package 'flycheck)


(define-derived-mode react-mode web-mode "react")
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . react-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . react-mode))

(with-eval-after-load 'flycheck
  (flycheck-add-mode 'javascript-eslint 'react-mode))

(add-hook 'react-mode-hook
          (lambda ()
            (web-mode-set-content-type "jsx")
            (flycheck-mode)
            (flycheck-select-checker 'javascript-eslint)
            ))

;;; json
(require-package 'json-mode)

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)
            (flycheck-mode)))

(provide 'init-javascript)
