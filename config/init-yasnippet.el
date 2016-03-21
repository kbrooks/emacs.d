(require-package 'yasnippet)

;; (setq yas-fallback-behavior 'return-nil)
;; (setq yas-also-auto-indent-first-line t)
;; (setq yas-prompt-functions '(yas/ido-prompt yas/completing-prompt))

(setq yas-snippet-dirs
      `(,(concat user-emacs-directory "snippets")))

(yas-global-mode 1)

(provide 'init-yasnippet)
