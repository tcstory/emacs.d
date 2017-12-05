(require 'cl)

(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )



;;add whatever packages you want here
(defvar tcstory/packages '(
				 company
				 monokai-theme
				 smartparens
				 nodejs-repl
				 exec-path-from-shell
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



(global-company-mode t)

;; smartparens
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)

(load-theme 'monokai t)


(provide 'init-packages)
