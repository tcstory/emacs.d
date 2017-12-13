(require 'org)
(require 'org-download)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/my-org"))

(setq org-log-done 'time)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-capture-templates
  '(("w" "work" entry (file+datetree "~/my-org/2018.org")
        "* TODO %? :work: \n  Logged on %U\n")
   ("l" "Life" entry (file+datetree "~/my-org/2018.org")
        "* TODO %? :life: \n  Logged on %U\n")))

(setq org-image-actual-width (/ (display-pixel-width) 3))

(provide 'init-org)
