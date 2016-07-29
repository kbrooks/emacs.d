(require-package 'magit)
(require-package 'git-gutter)
(require-package 'git-link)
(require-package 'magit-gitflow)

(global-git-gutter-mode +1)

(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

(defun my-git-link-imshealth-gitlab (hostname dirname filename branch commit start end)
  (format "https://%s/%s/blob/%s/%s#%s"
	  (substring hostname 0 -5)
          dirname
	  (or branch commit)
	  filename
	  (if end
	      (format "L%s-%s" start end)
	    (format "L%s" start))))

(add-to-list 'git-link-remote-alist
    '("gitlab.imshealth.com:2222" my-git-link-imshealth-gitlab))

(provide 'init-git)

