;;; -*- lexical-binding: t; -*-

(setq frame-title-format (format "%%f @%s" (system-name))
      indent-line-function #'indent-relative-maybe
      hippie-expand-try-functions-list
      '(try-expand-all-abbrevs
        try-expand-dabbrev
        try-expand-list
        try-expand-dabbrev-from-kill
        try-expand-dabbrev-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(setq-default tab-width 2
              indent-tabs-mode nil)

(cua-mode +1)
(setq cua-enable-cua-keys nil)

(use-package! whitespace
  :init
  (setq whitespace-style '(face trailing tabs space-mark tab-mark)
        whitespace-display-mappings
        '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])
          (space-mark ?\x3000 [?\□])))
  :hook (doom-first-buffer . global-whitespace-mode)
  :config
  (setq whitespace-style (cl-set-difference whitespace-style '(lines lines-tail))))

(after! migemo
  (setq migemo-dictionary "/opt/homebrew/share/migemo/utf-8/migemo-dict")
  (when (process-live-p migemo-process)
    (delete-process migemo-process)
    (setq migemo-process nil))
  (migemo-init))

(after! avy
  (setq avy-all-windows nil))

(after! avy-migemo
  (defadvice! my/avy-generic-jump-drop-style-a (fn regex window-flip &rest rest)
    :around #'avy--generic-jump
    (when (and rest (symbolp (car rest)))
      (setq rest (cdr rest)))
    (apply fn regex window-flip rest))
  (avy-migemo-mode 1))

(after! ace-window
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (custom-set-faces!
    '(aw-leading-char-face :weight bold :height 2.0)))

(custom-set-faces!
  '(mode-line :background "#464646")
  '(mode-line-inactive :background "#2e2e2e")
  '(hl-line :underline "SteelBlue4")
  '(doom-modeline-buffer-modified :background "#da1001")
  `(corfu-current :background ,(face-background 'region nil t) :extend t))

(after! hl-todo
  (setq hl-todo-keyword-faces
        '(("HOLD" . "#d0bf8f")
          ("TODO" . "#cc9393")
          ("NEXT" . "#dca3a3")
          ("THEM" . "#dc8cc3")
          ("PROG" . "#7cb8bb")
          ("OKAY" . "#7cb8bb")
          ("DONT" . "#5f7f5f")
          ("FAIL" . "#8c5353")
          ("DONE" . "#afd8af")
          ("FIXME" . "#cc9393")
          ("XXX" . "#cc9393")
          ("XXXX" . "#cc9393")
          ("???" . "#cc9393"))))
