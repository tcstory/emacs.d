(require 'cl)

(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )



;;add whatever packages you want here
(defvar tcstory/packages '(
				 monokai-theme
				 nodejs-repl
				 exec-path-from-shell
				 rainbow-delimiters
                 org-download
				 )  "Default packages")

(setq package-selected-packages tcstory/packages)

(defun tcstory/packages-installed-p ()
  (loop for pkg in tcstory/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (tcstory/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg tcstory/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; let emacs could find the execuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))



(load-theme 'monokai t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(provide 'init-packages)
