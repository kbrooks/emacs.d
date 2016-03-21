;; Kyle's init.el

(let ((gc-cons-threshold most-positive-fixnum)
      (debug-on-error t)
      (file-name-handler-alist nil)
      (config-directory (concat user-emacs-directory "config/")))

  (eval-when-compile (require 'cl))

  ;;; time emacs startup
  (lexical-let ((emacs-start-time (current-time)))
    (add-hook 'emacs-startup-hook
              (lambda ()
                (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
                  (message "[Emacs initialized in %.3fs]" elapsed)))))

  (when (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;; turns off tool bar
  (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ;; turns off scroll bar
  (unless (display-graphic-p) (menu-bar-mode -1)) ;; turns off menu bar

  (setq inhibit-splash-screen t)


  (defgroup dotemacs nil
    "Custom configuration for dotemacs."
    :group 'local)

  (defgroup dotemacs nil
    "Custom configuration for dotemacs."
    :group 'local)
  
  (defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
    "The storage location for various persistent files."
    :group 'dotemacs)
  
  ;;; packages
  (setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                           ("org" . "http://orgmode.org/elpa/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("gnu" . "http://elpa.gnu.org/packages/")))
  (setq package-enable-at-startup nil)
  (package-initialize)

  (require 'init-util (concat config-directory "init-util.el"))
  
  ;;; loop over all files in ./config/
  (cl-loop for file in (directory-files config-directory t)
           when (string-match "\\.el$" file)
           do (require (intern (file-name-base file)) file))

;;;; MISC CONFIG -- TODO: organize
  ;; turn off alarm bell
;;  (setq visible-bell t)
  ;; revert buffers automatically
;;  (global-auto-revert-mode 1)

;;  (require 'recentf)
;;  (recentf-mode 1)
;;  (setq recentf-max-menu-items 30)
;;  (put 'upcase-region 'disabled nil)

  )
