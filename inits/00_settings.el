;;; -*- lexical-binding: t; -*-

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta
        mac-option-modifier 'super
        mac-right-option-modifier 'super
        ns-command-modifier 'meta
        ns-alternate-modifier 'super
        ns-right-option-modifier 'super))

(after! wdired
  (setq wdired-allow-to-change-permissions t))

(after! dired
  (setq delete-by-moving-to-trash t
        ;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
        dired-dwim-target t
        ;; ディレクトリを再帰的にコピーする
        dired-recursive-copies 'always
        ;; diredバッファでC-sした時にファイル名だけにマッチするように
        dired-isearch-filenames t)
  (map! :map dired-mode-map
        "e" #'wdired-change-to-wdired-mode))

(use-package! generic-x
  :demand t)

(setq mouse-drag-copy-region t
      save-interprogram-paste-before-kill t
      yank-pop-change-selection t
      set-mark-command-repeat-pop t
      mark-ring-max 32
      kill-ring-max 1000
      tab-always-indent 'complete
      confirm-kill-processes nil
      confirm-kill-emacs nil)

(add-to-list 'safe-local-variable-values
             '(flycheck-emacs-lisp-load-path . inherit))

(after! persp-mode
  (setq persp-auto-save-num-of-backups 10))

(after! recentf
  (setq recentf-max-menu-items 500))
