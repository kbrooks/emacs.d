(require-package 'smart-mode-line)
(add-hook 'after-init-hook (sml/setup))


;; (require-package 'pretty-mode)
;; (global-pretty-mode)


(require-package 'smooth-scroll)
(require 'smooth-scroll)
(setq smooth-scroll/vscroll-step-size 8)
(smooth-scroll-mode t)


(require-package 'diminish)
(with-eval-after-load 'diminish-autoloads
  (diminish 'global-visual-line-mode)
  (with-eval-after-load 'undo-tree (diminish 'undo-tree-mode))
  (with-eval-after-load 'auto-complete (diminish 'auto-complete-mode))
  (with-eval-after-load 'projectile (diminish 'projectile-mode))
  (with-eval-after-load 'yasnippet (diminish 'yas-minor-mode))
  (with-eval-after-load 'guide-key (diminish 'guide-key-mode))
  (with-eval-after-load 'eldoc (diminish 'eldoc-mode))
  (with-eval-after-load 'smartparens (diminish 'smartparens-mode))
  (with-eval-after-load 'company (diminish 'company-mode))
  ;(with-eval-after-load 'git-gutter+ (diminish 'git-gutter+-mode))
  (with-eval-after-load 'pretty-mode (diminish 'smooth-scroll-mode)))


;(global-hl-line-mode +1)


(require 'linum)
(setq linum-format "%4d ")
(global-linum-mode t)


(provide 'init-eyecandy)
