(require-package 'magit)
(require-package 'git-gutter)
(require-package 'git-link)
(require-package 'magit-gitflow)

(global-git-gutter-mode +1)

(with-eval-after-load 'magit-gitflow
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(provide 'init-git)
