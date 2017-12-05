(require 'org)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/org"))

(setq org-log-done 'time)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-capture-templates
  '(("w" "work" entry (file+datetree "~/org/2017.org")
        "* TODO %? :work: \n  Logged on %U\n")
   ("l" "Life" entry (file+datetree "~/org/2017.org")
        "* TODO %? :life: \n  Logged on %U\n")))

(provide 'init-org)
