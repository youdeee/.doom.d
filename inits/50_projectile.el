;; (projectile-global-mode)
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)
;; (setq projectile-switch-project-action 'helm-projectile)

;; (projectile-global-mode t)

;; Helm バッファを下部ポップアップに表示する
;; (setq helm-display-function
;;       (lambda (buf)
;;         (display-buffer
;;          buf
;;          '((display-buffer-reuse-window
;;             display-buffer-at-bottom)
;;            (window-height . 10))))) ;; 高さ 10 行に調整可能
