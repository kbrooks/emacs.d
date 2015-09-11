
;;; python programming emacs setup

;;; ipython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

; switch to interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split window
(setq py-split-windows-on-execute-p nil)
; indentation
(setq py-smart-indentation t)


;;; jedi autocompletion
(require-package 'jedi)
(require-package 'company-jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;; company needs some help to work with jedi
(after 'company
  (add-to-list 'company-backends 'company-jedi))

;;; i like ipython
(require-package 'ipython)

(provide 'init-python)
