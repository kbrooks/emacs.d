(use-package magit)
(use-package git-gutter)
(use-package git-link)
(use-package magit-gitflow)

(global-git-gutter-mode +1)

(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

(defun my-git-link-imshealth-gitlab (hostname dirname filename branch commit start end)
  (format "https://%s/%s/blob/%s/%s#%s"
	  hostname
          dirname
	  (or branch commit)
	  filename
	  (if end
	      (format "L%s-%s" start end)
	    (format "L%s" start))))

(with-eval-after-load 'git-link
 (add-to-list 'git-link-remote-alist
    '("gitlab.imshealth.com:2222" my-git-link-imshealth-gitlab)))

(provide 'init-git)

