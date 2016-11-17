;;; java mode



;;; eclim
(use-package eclim)
(use-package flycheck)
(use-package company)
(use-package company-emacs-eclim)

(company-emacs-eclim-setup)

(global-eclim-mode)
(global-company-mode t)

(setq eclim-eclipse-dirs '("~/eclipse/java-neon/"))
(setq eclim-executable "~/eclipse/java-neon/eclim")
(setq company-emacs-eclim-ignore-case t)

(provide 'init-java)
