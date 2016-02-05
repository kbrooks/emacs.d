(require-package 'company)

(with-eval-after-load 'evil
  (custom-set-variables
   '(evil-complete-next-func 'company-select-next)
   '(evil-complete-previous-func 'company-select-previous)))

(add-hook 'after-init-hook 'global-company-mode)

(with-eval-after-load 'helm
  (require-package 'helm-company))

;; if this isn't set, company will do toLowerCase on all completions.
(setq company-dabbrev-downcase nil)

(provide 'init-company)
