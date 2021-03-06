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
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq cursor-type 'bar)
(setq inhibit-splash-screen 1)
(setq ring-bell-function 'ignore)



(provide 'init-better-defaults)
