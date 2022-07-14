;; (custom-set-variables '(org-agenda-restore-windows-after-quit nil))

(require 'org)

;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (define-key global-map "\C-cr" 'org-remember)
;; ;; 拡張子が org のファイルを開いた時，自動的に org-mode にする
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; ;; org-mode での強調表示を可能にする
;; (add-hook 'org-mode-hook 'turn-on-font-lock)
;; ;; 見出しの余分な*を消す
;; (setq org-hide-leading-stars t)
;; ;; org-default-notes-file のディレクトリ
;; ;; org-default-notes-file のファイル名
;; (setq org-default-notes-file "notes.org")


;; アジェンダ表示の対象ファイル
;; アジェンダ表示で下線を用いる
;; (add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))
;; (setq hl-line-face 'underline)
;; 標準の祝日を利用しない
(setq calendar-holidays nil)

(setq org-agenda-window-setup 'current-window)
;; (setq org-log-done 'time)
(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE")))
(setq system-time-locale "C")

(after! org (setq org-hide-emphasis-markers t))
(after! org
  (setq org-log-done t)
  (setq org-log-into-drawer t))
;; (add-hook! org-mode (electric-indent-local-mode -1))
;; (org-indent-mode nil)
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "#EB4255" :weight bold))
        ("DONE"   . (:foreground "#00a563" :weight bold))))

(after! org
  (setq org-startup-truncated nil)
  (setq org-startup-indented nil))

(remove-hook 'text-mode-hook 'pangu-spacing-mode)
(setq-default word-wrap nil)
(remove-hook 'text-mode-hook 'visual-line-mode)
(setq-default truncate-lines nil)

(setq org-fontify-done-headline t)

(custom-set-faces
 ;; '(org-done ((t (:foreground "PaleGreen"
 ;;                 :weight normal
 ;;                 :strike-through t))))
 '(org-level-1 ((t (:foreground "#B388FF" :weight bold :height 1.2))))
 '(org-level-2 ((t (:foreground "#8BC34A" :weight normal :height 1.1))))
 '(org-level-3 ((t (:foreground "#FFC107" :weight normal :height 1.0))))
 '(org-level-4 ((t (:foreground "#18FFFF" :weight normal :height 1.0))))
 '(org-level-5 ((t (:foreground "#FF8A80" :weight normal :height 1.0))))
 '(org-level-6 ((t (:foreground "#6fca9b" :weight normal :height 1.0))))
 '(org-date ((t (:foreground "#746e5b" :weight bold :height 1.0))))
 '(org-headline-done
   ((((class color) (min-colors 16) (background dark))
     (:foreground "#baa76e")))))

(setq org-M-RET-may-split-line '((default . t)))
