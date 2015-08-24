(defmacro bind (&rest commands)
  "Convience macro which creates a lambda interactive command."
  `(lambda ()
     (interactive)
     ,@commands))

(require-package 'guide-key)
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" "<SPC>"))
(setq guide-key/recursive-key-sequence-flag t)
(guide-key-mode 1)

(after 'evil-leader
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "SPC" 'helm-M-x
    "C" 'customize-group
    "E" 'eval-defun
    "P" 'package-list-packages
    "b b" 'helm-mini
    "b d" 'kill-this-buffer
    "e" 'eval-last-sexp
    "f" 'pt-regexp
    "g" 'magit-status
    "h" help-map
    "l" 'linum-mode
    "o" 'my-browse-file-directory
    "p" projectile-command-map
    "r" 'helm-recentf
    "s" 'helm-swoop
    "y" 'helm-show-kill-ring
))

(after 'helm
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z 
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-m") 'helm-M-x)
  (global-set-key (kbd "C-c C-m") 'helm-M-x))

(after 'smartparens
  (local-set-key (kbd "C-<left>") 'sp-forward-barf-sexp)
  (local-set-key (kbd "C-<right>") 'sp-forward-slurp-sexp)
  (local-set-key (kbd "M-<left>") 'sp-backward-slurp-sexp)
  (local-set-key (kbd "M-<right>") 'sp-backward-barf-sexp))

(after 'multiple-cursors
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(after 'evil
  (require-package 'key-chord)
  (key-chord-mode 1)


  ;(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)

  (define-key evil-normal-state-map (kbd "C-w C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-w C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-w C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-w C-l") 'evil-window-right)


  ;(define-key evil-motion-state-map "j" 'evil-next-visual-line)
  ;(define-key evil-motion-state-map "k" 'evil-previous-visual-line)

  (define-key evil-normal-state-map (kbd "Q") 'my-window-killer)
  (define-key evil-normal-state-map (kbd "Y") (kbd "y$"))

  ; get universal-argument in evil mode
  (define-key evil-normal-state-map (kbd "U") 'universal-argument)

  ;(define-key evil-visual-state-map (kbd ", e") 'eval-region)

  (define-key evil-insert-state-map (kbd "RET") 'evil-ret-and-indent)
  (define-key evil-insert-state-map (kbd "RET") 'evil-ret)
  (evil-define-key 'insert eshell-mode-map (kbd "RET") 'eshell-send-input)

  ;; emacs lisp
  (evil-define-key 'normal emacs-lisp-mode-map (kbd "K") (kbd ", h f RET"))

  ;; proper jump lists ;; broken...
  ;;(require-package 'jumpc)
  ;(jumpc)
  ;(define-key evil-normal-state-map (kbd "C-o") 'jumpc-jump-backward)
  ;(define-key evil-normal-state-map (kbd "C-i") 'jumpc-jump-forward)

  )

;;; escape minibuffer
(define-key minibuffer-local-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'my-minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'my-minibuffer-keyboard-quit)


;(after 'comint
  ;(define-key comint-mode-map [up] 'comint-previous-input)
  ;(define-key comint-mode-map [down] 'comint-next-input))


;(after 'auto-complete
  ;(define-key ac-completing-map "\t" 'ac-expand)
  ;(define-key ac-completing-map [tab] 'ac-expand)
  ;(define-key ac-completing-map (kbd "C-n") 'ac-next)
  ;(define-key ac-completing-map (kbd "C-p") 'ac-previous))


;(after 'company
  ;(define-key company-active-map "\t" 'my-company-tab)
  ;(define-key company-active-map [tab] 'my-company-tab)
  ;(define-key company-active-map (kbd "C-n") 'company-select-next)
  ;(define-key company-active-map (kbd "C-p") 'company-select-previous))


;; mouse scrolling in terminal
(unless (display-graphic-p)
  (global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
  (global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1))))


;; have no use for these default bindings
;(global-unset-key (kbd "C-x m"))


;; replace with [r]eally [q]uit
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") (bind (message "Quit with C-x r q")))
(after 'evil
  (defadvice evil-quit (around advice-for-evil-quit activate)
    (message "Quit with C-x r q"))
  (defadvice evil-quit-all (around advice-for-evil-quit-all activate)
    (message "Quit with C-x r q")))

  
(provide 'init-bindings)
