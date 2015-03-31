; Kyle's init.el


(defgroup dotemacs nil
  "Custom configuration for dotemacs."
  :group 'local)

(defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
  "The storage location for various persistent files."
  :group 'dotemacs)

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ; turns off tool bar
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ; turns off scroll bar
;(unless (display-graphic-p) (menu-bar-mode -1)) ; turns off menu bar

(setq inhibit-splash-screen t)

(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'cl)
(require 'init-packages)
(require 'init-core)

(defcustom dotemacs-modules
  '(init-util
    init-evil
    init-org
    ;init-jira
    ;init-zeal
    ;init-projectile ; projectile is too slow on windows.
    init-ido
    init-lisp
    init-pt
    init-csharp
    init-python
    init-salt
    init-bindings)
  "Set of modules enabled in dotemacs."
  :group 'dotemacs)

    ;init-eyecandy
    ;init-colors
    ;init-editor
    ;init-smartparens
    ;init-yasnippet
    ;init-auto-complete
    ;init-company
    ;init-helm
    ;init-ag
    ;init-ctags ;; custom tags func defined, etc
    ;init-git
    ;init-hg
    ;init-flycheck
    ;init-vim
    ;init-web
    ;init-markdown

    ;init-misc
    ;init-workgroups

(dolist (module dotemacs-modules)
  (require module))

;;; w32 hacks
(if (eq system-type 'windows-nt)
    (require 'init-windows-nt))


;;;; MISC CONFIG -- TODO: organize
; turn off alarm bell
(setq visible-bell t)
; revert buffers automatically
(global-auto-revert-mode 1)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 30)
