(require-package 'company)

(after 'evil
  (custom-set-variables
   '(evil-complete-next-func 'company-select-next)
   '(evil-complete-previous-func 'company-select-previous)))

(provide 'init-company)
