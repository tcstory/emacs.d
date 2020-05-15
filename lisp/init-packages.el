(require 'cl)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))



;;add whatever packages you want here
(defvar tcstory/packages '(
                           monokai-theme
                           rainbow-delimiters
                           org-download
                           all-the-icons
                           smart-input-source
                           use-package
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


(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(load-theme 'monokai t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


(use-package smart-input-source
             :config
             (setq smart-input-source-english-input-source
                   "com.apple.keylayout.US")
             (setq smart-input-source-other-input-source
                   "com.sogou.inputmethod.sogou.pinyin")
             (add-hook 'text-mode-hook #'smart-input-source-mode)
             (add-hook 'prog-mode-hook #'smart-input-source-mode))
(require 'subr-x)
(setq smart-input-source-external-ism "fcitx-remote")
(setq smart-input-source-english-input-source "1")
(setq smart-input-source-other-input-source "2")
(setq smart-input-source-do-get-input-source
      (lambda()
        (string-trim
          (shell-command-to-string
            smart-input-source-external-ism))))
(setq smart-input-source-do-set-input-source
      (lambda(source)
        (pcase source
               ("1" (string-trim (shell-command-to-string
                                   (concat smart-input-source-external-ism " -c"))))
               ("2" (string-trim (shell-command-to-string
                                   (concat smart-input-source-external-ism " -o")))))))

(provide 'init-packages)

