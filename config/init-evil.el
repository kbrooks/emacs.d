(defvar evil-want-C-u-scroll t)
(defvar evil-want-C-w-in-emacs-state t)

(defvar evil-search-module 'evil-search)
(defvar evil-magic 'very-magic)

(defvar evil-emacs-state-cursor '("red" box))
(defvar evil-normal-state-cursor '("green" box))
(defvar evil-insert-state-cursor '("orange" bar))

(defvar evilnc-hotkey-comment-operator "gc")

(add-to-list 'load-path (concat user-emacs-directory "elisp/evil"))
(require-package 'evil-leader)
(require-package 'evil-visualstar)
(require-package 'evil-nerd-commenter)
(require-package 'evil-indent-textobject)
(require-package 'evil-surround)

(require 'evil)
(require 'evil-leader)
(require 'evil-nerd-commenter)
(require 'evil-indent-textobject)
(require 'evil-visualstar)
(require 'evil-surround)

(setq evil-emacs-state-modes
      (append evil-emacs-state-modes
              '(profiler-report-mode
                magit-mode)))

(setq evil-motion-state-modes
      (append evil-motion-state-modes
              '(dired-mode
                cider-docview-mode
                cider-stacktrace-mode
                cider-browse-ns-mode
                pt-search-mode
                outline-mode)))

; get back RET and SPC in evil-motion-state (fixes dired)
; https://www.emacswiki.org/emacs/Evil#toc12
(defun my-move-key (keymap-from keymap-to key)
  "Moves key binding from one keymap to another, deleting from the old location. "
  (define-key keymap-to key (lookup-key keymap-from key))
  (define-key keymap-from key nil))
(my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(my-move-key evil-motion-state-map evil-normal-state-map " ")

(global-evil-leader-mode)
(evil-mode t)
(global-evil-surround-mode 1)

;;; Fix forward-sexp and backwards-sexp at the cost of making some movements unintuitive (like $)
(setq evil-move-cursor-back nil)

(defun my-send-string-to-terminal (string)
  (unless (display-graphic-p) (send-string-to-terminal string)))

(defun my-evil-terminal-cursor-change ()
  (when (string= (getenv "TERM_PROGRAM") "iTerm.app")
    (add-hook 'evil-insert-state-entry-hook (lambda () (my-send-string-to-terminal "\e]50;CursorShape=1\x7")))
    (add-hook 'evil-insert-state-exit-hook  (lambda () (my-send-string-to-terminal "\e]50;CursorShape=0\x7"))))
  (when (and (getenv "TMUX") (string= (getenv "TERM_PROGRAM") "iTerm.app"))
    (add-hook 'evil-insert-state-entry-hook (lambda () (my-send-string-to-terminal "\ePtmux;\e\e]50;CursorShape=1\x7\e\\")))
    (add-hook 'evil-insert-state-exit-hook  (lambda () (my-send-string-to-terminal "\ePtmux;\e\e]50;CursorShape=0\x7\e\\")))))

(add-hook 'after-make-frame-functions (lambda (frame) (my-evil-terminal-cursor-change)))
(my-evil-terminal-cursor-change)

(defun my-evil-modeline-change (default-color)
  "changes the modeline color when the evil mode changes"
  (let ((color (cond ((evil-emacs-state-p)  '("#5f0000" . "#ffffff"))
                     (t default-color))))
    (set-face-background 'mode-line (car color))
    (set-face-foreground 'mode-line (cdr color))))

(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook (lambda () (my-evil-modeline-change default-color))))

(defadvice evil-ex-search-next (after advice-for-evil-ex-search-next activate)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defadvice evil-ex-search-previous (after advice-for-evil-ex-search-previous activate)
  (evil-scroll-line-to-center (line-number-at-pos)))


(provide 'init-evil)
