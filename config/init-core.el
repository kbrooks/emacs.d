;(setq inhibit-splash-screen t
      ;inhibit-startup-echo-area-message t
      ;inhibit-startup-message t)

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))


;; move cursor to the last position upon open
(require 'saveplace)
(setq save-place-file (concat user-emacs-directory ".cache/places"))
(setq-default save-place t)


;; minibuffer history
(require 'savehist)
(setq savehist-file (concat user-emacs-directory ".cache/savehist")
      savehist-additional-variables '(search ring regexp-search-ring)
      savehist-autosave-interval 60)
(savehist-mode +1)


(setq mark-ring-max 64)
(setq global-mark-ring-max 128)


;; recent files
(require 'recentf)
(setq recentf-save-file (concat user-emacs-directory ".cache/recentf")
      recentf-max-saved-items 100
      recentf-max-menu-items 50)
(recentf-mode +1)

;; smartparens everywhere!
(add-hook 'smartparens-enabled-hook 'evil-smartparens-mode)
(require-package 'smartparens)
(require-package 'evil-smartparens)


;; eshell
(defvar eshell-directory-name (concat user-emacs-directory ".cache/eshell"))
(defvar eshell-aliases-file (concat user-emacs-directory ".eshell-aliases"))

;; vc
(setq vc-make-backup-files t)

;; ediff
(setq ediff-split-window-function 'split-window-horizontally)

;; store most files in the cache
(setq backup-directory-alist
      `((".*" . ,(concat user-emacs-directory ".cache/backups")))
      auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory ".cache/backups") t))
      auto-save-list-file-prefix
      (concat user-emacs-directory ".cache/auto-save-list/.saves-"))


; ;; better scrolling
; (setq scroll-margin 3
;       scroll-conservatively 9999
;       scroll-preserve-screen-position t)


;; better buffer names for duplicates
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-ignore-buffers-re "^\\*" ; leave special buffers alone
      uniquify-after-kill-buffer-p t)


(defalias 'yes-or-no-p 'y-or-n-p)
(xterm-mouse-mode t)


(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


(which-function-mode t)
(global-visual-line-mode)
(blink-cursor-mode -1)


(setq-default
 indent-tabs-mode nil)


(provide 'init-core)
