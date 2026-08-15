(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("87fa3605a6501f9b90d337ed4d832213155e3a2e36a512984f83e847102a42f4"
     "b7a09eb77a1e9b98cafba8ef1bd58871f91958538f6671b22976ea38c2580755"
     "720838034f1dd3b3da66f6bd4d053ee67c93a747b219d1c546c41c4e425daf93" default))
 '(ignored-local-variable-values
   '((eval progn
      (setq-local package-lint--sane-prefixes
       (rx
        (or (regexp package-lint--sane-prefixes)
            (seq string-start "helm-source-")))))
     (eval progn (pp-buffer) (indent-buffer)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-buffer-modified ((t (:background "#da1001"))))
 '(hl-line ((t (:underline "SteelBlue4"))))
 '(mode-line ((t (:background "#476375"))))
 '(mode-line-inactive ((t (:background "#2e2e2e"))))
 '(org-date ((t (:foreground "#746e5b" :weight bold :height 1.0))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "#baa76e"))))
 '(org-level-1 ((t (:foreground "#B388FF" :weight bold :height 1.2))))
 '(org-level-2 ((t (:foreground "#8BC34A" :weight normal :height 1.1))))
 '(org-level-3 ((t (:foreground "#FFC107" :weight normal :height 1.0))))
 '(org-level-4 ((t (:foreground "#18FFFF" :weight normal :height 1.0))))
 '(org-level-5 ((t (:foreground "#FF8A80" :weight normal :height 1.0))))
 '(org-level-6 ((t (:foreground "#6fca9b" :weight normal :height 1.0)))))
