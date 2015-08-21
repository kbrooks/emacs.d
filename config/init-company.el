(require-package 'company)

(after 'evil
  (custom-set-variables
   '(evil-complete-next-func 'company-select-next)
   '(evil-complete-previous-func 'company-select-previous)))

(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company)
