(defmacro bind (&rest commands)
  "Convience macro which creates a lambda interactive command."
  `(lambda ()
     (interactive)
     ,@commands))

(use-package guide-key)
(use-package nlinum)
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" "<SPC>"))
(setq guide-key/recursive-key-sequence-flag t)
(guide-key-mode 1)

(with-eval-after-load 'evil-leader
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "SPC" 'helm-M-x
    "C" 'customize-group
    "E" 'eval-defun
    "P" 'package-list-packages
    "b b" 'helm-mini
    "e" 'eval-last-sexp
    "f" 'pt-regexp
    "g" 'magit-status
    "l" 'nlinum-mode
    "o" 'my-browse-file-directory
    "r" 'helm-recentf
    "s" 'helm-swoop
    "w" 'delete-trailing-whitespace
    "y" 'helm-show-kill-ring
    )
  (with-eval-after-load 'projectile
    (evil-leader/set-key
      "p" projectile-command-map)
    ))

(with-eval-after-load 'helm
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z 
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-m") 'helm-M-x)
  (global-set-key (kbd "C-c C-m") 'helm-M-x))

(with-eval-after-load 'smartparens
  (local-set-key (kbd "s-<left>") 'sp-forward-barf-sexp)
  (local-set-key (kbd "s-<right>") 'sp-forward-slurp-sexp)
  (local-set-key (kbd "M-<left>") 'sp-backward-slurp-sexp)
  (local-set-key (kbd "M-<right>") 'sp-backward-barf-sexp)
  ;; change sexp movements
  (local-set-key (kbd "C-M-n") 'sp-next-sexp)
  (local-set-key (kbd "C-M-p") 'sp-previous-sexp)
  (local-set-key (kbd "C-M-u") 'sp-up-sexp)
  (local-set-key (kbd "C-M-d") 'sp-down-sexp)
  (local-set-key (kbd "C-M-a") 'sp-beginning-of-sexp))

(with-eval-after-load 'multiple-cursors
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(with-eval-after-load 'evil
  (use-package key-chord)
  (key-chord-mode 1)

  ;;(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)

  (define-key evil-normal-state-map (kbd "C-w C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-w C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-w C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-w C-l") 'evil-window-right)


  ;(define-key evil-motion-state-map "j" 'evil-next-visual-line)
  ;(define-key evil-motion-state-map "k" 'evil-previous-visual-line)

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
  ;;(use-package jumpc)
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


;(with-eval-after-load 'comint
  ;(define-key comint-mode-map [up] 'comint-previous-input)
  ;(define-key comint-mode-map [down] 'comint-next-input))


;(with-eval-after-load 'auto-complete
  ;(define-key ac-completing-map "\t" 'ac-expand)
  ;(define-key ac-completing-map [tab] 'ac-expand)
  ;(define-key ac-completing-map (kbd "C-n") 'ac-next)
  ;(define-key ac-completing-map (kbd "C-p") 'ac-previous))


;; mouse scrolling in terminal
; (unless (display-graphic-p)
;   (global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
;   (global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1))))


;; have no use for these default bindings
;(global-unset-key (kbd "C-x m"))


;; replace with [r]eally [q]uit
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") (bind (message "Quit with C-x r q")))
(with-eval-after-load 'evil
  (defadvice evil-quit (around advice-for-evil-quit activate)
    (message "Quit with C-x r q"))
  (defadvice evil-quit-all (around advice-for-evil-quit-all activate)
    (message "Quit with C-x r q")))

  
(provide 'init-bindings)
