(require-package 'company)

;; need to double bag this shit
(with-eval-after-load 'evil
  (with-eval-after-load 'company
    (custom-set-variables
     ;; we need to ignore the passed 'arg'
     '(evil-complete-next-func (lambda (arg) (company-complete)))
     '(evil-complete-previous-func (lambda (arg) (company-complete))))))

(add-hook 'after-init-hook 'global-company-mode)

(with-eval-after-load 'helm
  (require-package 'helm-company))

;; if this isn't set, company will do toLowerCase on all completions.
(setq company-dabbrev-downcase nil)

(add-hook 'after-init-hook 'global-company-mode)


(provide 'init-company)
