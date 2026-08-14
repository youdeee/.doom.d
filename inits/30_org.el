;;; -*- lexical-binding: t; -*-

(setq calendar-holidays nil
      system-time-locale "C")

(setq-default word-wrap nil
              truncate-lines nil)

(remove-hook 'text-mode-hook #'pangu-spacing-mode)
(remove-hook 'text-mode-hook #'visual-line-mode)

(after! org
  (setq org-hide-emphasis-markers t
        org-log-done t
        org-log-into-drawer t
        org-startup-truncated nil
        org-startup-indented nil
        org-agenda-window-setup 'current-window
        org-todo-keywords '((sequence "TODO" "|" "DONE"))
        org-todo-keyword-faces
        '(("TODO" . (:foreground "#EB4255" :weight bold))
          ("DONE" . (:foreground "#00a563" :weight bold)))
        org-fontify-done-headline t
        org-M-RET-may-split-line '((default . t)))
  (add-to-list 'org-emphasis-alist '("/" (:background "yellow green" :foreground "black"))))

(custom-set-faces!
  '(org-level-1 :foreground "#B388FF" :weight bold :height 1.2)
  '(org-level-2 :foreground "#8BC34A" :weight normal :height 1.1)
  '(org-level-3 :foreground "#FFC107" :weight normal :height 1.0)
  '(org-level-4 :foreground "#18FFFF" :weight normal :height 1.0)
  '(org-level-5 :foreground "#FF8A80" :weight normal :height 1.0)
  '(org-level-6 :foreground "#6fca9b" :weight normal :height 1.0)
  '(org-date :foreground "#746e5b" :weight bold :height 1.0)
  '(org-headline-done :foreground "#baa76e"))
