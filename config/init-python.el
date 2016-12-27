;;; python programming emacs setup

; switch to interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split window
(setq py-split-windows-on-execute-p nil)
; indentation
(setq py-smart-indentation t)


;;; jedi autocompletion
(use-package jedi)
(use-package company-jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;; company needs some help to work with jedi
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-jedi))

(provide 'init-python)
