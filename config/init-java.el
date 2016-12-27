;;;; java mode
;;;; java c style.

(defconst eclipse-java-style
  '((c-basic-offset . 4)
    (c-comment-only-line-offset . (0 . 0))
    ;; the following preserves Javadoc starter lines
    (c-offsets-alist . ((inline-open . 0)
                        (topmost-intro-cont    . +)
                        (statement-block-intro . +)
                        (knr-argdecl-intro     . 5)
                        (substatement-open     . +)
                        (substatement-label    . +)
                        (label                 . +)
                        (statement-case-open   . +)
                        (statement-cont        . +)
                        (arglist-intro  . c-lineup-arglist-intro-after-paren)
                        (arglist-close  . c-lineup-arglist)
                        (access-label   . 0)
                        (inher-cont     . c-lineup-java-inher)
                        (func-decl-cont . c-lineup-java-throws)
                        (arglist-cont-nonempty . ++))))
  "Eclipse Java Programming Style")

(c-add-style "eclipse" eclipse-java-style)

(defun my-java-hook ()
  (progn
    (c-set-style "eclipse")))

(add-hook 'java-mode-hook 'my-java-hook)

;;;; eclim
(require-package 'eclim)
(require-package 'flycheck)
(require-package 'company)
(require-package 'company-emacs-eclim)
;
(company-emacs-eclim-setup)
;
;(global-eclim-mode)
;(global-company-mode t)
;
;; TODO: move to machine-specific configuration
(setq eclim-eclipse-dirs '("~/eclipse/java-neon/"))
(setq eclim-executable "~/eclipse/java-neon/eclim")
(setq company-emacs-eclim-ignore-case t)

;; make 
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
;
(provide 'init-java)
