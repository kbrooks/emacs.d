;; ctags
(setq path-to-ctags "C:\\Chocolatey\\bin\\ctags.bat") ;; <- your ctags path here
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "ctags -f %s -e -R %s" path-to-ctags (directory-file-name dir-name)))
)

(provide 'init-ctags)
