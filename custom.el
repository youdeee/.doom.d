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
;; フェイス設定は inits/30_org.el と inits/88_other.el の custom-set-faces! に一本化
;; （config.el が custom.el より先に読まれるため、ここに置くと後勝ちで上書きしてしまう）
