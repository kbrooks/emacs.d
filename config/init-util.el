(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))


(defun my-window-killer ()
  "closes the window, and deletes the buffer if it's the last window open."
  (interactive)
  (if (> buffer-display-count 1)
      (if (= (length (window-list)) 1)
          (kill-buffer)
        (delete-window))
    (kill-buffer-and-window)))

(defun require-package (package)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(defun my-minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

 (defun my-directory-parent (directory)
   (let ((parent (file-name-directory (directory-file-name directory))))
     (if (not (equal directory parent))
         parent)))

;; find project files on load
(defun my-find-project-file (regexp)
  (when buffer-file-name
    (let (current-dir-contents
          parent-dir
          (current-dir (file-name-directory (buffer-file-name))))
      (while (and current-dir
                  (not (= 1 (length (setq current-dir-contents
                                          (directory-files
                                           current-dir
                                           t regexp t))))))
        (setq current-dir (my-directory-parent current-dir)))
      (car current-dir-contents))))

;;; this is causing problems with path loading in non-cygwin emacs on windows
;; make sure $PATH is set correctly
;(require-package 'exec-path-from-shell)
;(ignore-errors ;; windows
;  (exec-path-from-shell-initialize))

(defun my-browse-file-directory ()
  "Open the current file's directory however the OS would."
  (interactive)
  (if default-directory
      (browse-url-of-file (expand-file-name default-directory))
    (error "No `default-directory' to open")))

;; pretty print xml
(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))


(provide 'init-util)
