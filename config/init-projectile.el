(defvar projectile-cache-file (concat user-emacs-directory ".cache/projectile.cache"))
(defvar projectile-known-projects-file (concat user-emacs-directory ".cache/projectile-bookmarks.eld"))

(require-package 'projectile)
(require 'projectile)

(add-to-list 'projectile-globally-ignored-directories "elpa")
(add-to-list 'projectile-globally-ignored-directories ".cache")

(projectile-global-mode t)

;; cache in big projects
(setq projectile-enable-caching t)

(provide 'init-projectile)
