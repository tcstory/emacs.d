 (when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		smartparens
		;; --- Minor Mode ---
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		) "Default packages")
 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

;; 重新加载配置文件用 M-x load-file
;; 或则使用 M-x eval-buffer 去执行当前缓冲区的所有Lisp命令
;; 或则使用 C-x C-e 来执行某一行的Lisp代码
;; 或则使用 C-j 来执行代码,他会在buffer中插入当前运算的结果
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq cursor-type 'bar)
(setq inhibit-splash-screen 1)

;; 禁止emacs自动生成备份文件
(setq make-backup-files nil)
;; 选中一段文字后,输入的字符会替换掉被选中的文字
(delete-selection-mode 1)
;; 高亮当前行
(global-hl-line-mode 1)


;; Org-mode文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)


(load-theme 'monokai 1)

;; 开启全局 Company 补全
(global-company-mode 1)

;; smartparens
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
