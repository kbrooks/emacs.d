;;; make sls files read as yaml

(use-package yaml-mode)
(use-package jinja2-mode)

(define-derived-mode saltstack-mode yaml-mode "SaltStack"
  "Minimal Saltstack mode, based on `yaml-mode'."
  (setq tab-width 2
        indent-tabs-mode nil))

(add-to-list 'auto-mode-alist '("\\.sls\\'" . saltstack-mode))

(provide 'init-salt)

