(require-package 'magit)
(require-package 'git-gutter)
(require-package 'git-link)
(require-package 'magit-gitflow)

(global-git-gutter-mode +1)

(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;;; generates link to code.amazon.com
(defun my-git-link-amazon-gitlab (hostname dirname filename branch commit start end)
  (format "https://code.amazon.com/packages/%s/blobs/%s/--/%s#%s"
          (if (string= (substring dirname 0 4) "pkg/")
              (substring dirname 4)
            dirname)
          (or branch commit)
          filename
          (if end
              (format "L%s-%s" start end)
            (format "L%s" start))))

(with-eval-after-load 'git-link
 (add-to-list 'git-link-remote-alist
    '("git.amazon.com" my-git-link-amazon-gitlab)))

(provide 'init-git)
