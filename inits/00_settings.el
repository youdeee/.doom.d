;; meta -> command
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
   (setq mac-right-option-modifier 'super)
   (setq ns-right-option-modifier 'super))

;; シンボリックリンクを開くときの質問省略
;;(setq vc-follow-symlinks t)

;; 編集時 buffer 再読み込み
;;(global-auto-revert-mode 1)

(require 'wdired)
(setq wdired-allow-to-change-permissions t)
(define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)
(setq delete-by-moving-to-trash t)

;; 特にtramp時、zshを使わない
;;(eval-after-load 'tramp '(setenv "SHELL" "/bin/zsh"))

;; マウス選択箇所を自動コピー
(setq mouse-drag-copy-region t)

(require 'generic-x)

;; ;;(setq truncate-partial-width-windows nil)

(setq save-interprogram-paste-before-kill t)
(setq yank-pop-change-selection t)

;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
(setq dired-dwim-target t)
;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)
;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

(setq set-mark-command-repeat-pop t)
(setq mark-ring-max 32)

(setq kill-ring-max 1000)
(setq persp-auto-save-num-of-backups 10)
(setq recentf-max-menu-items 500)

(setq tab-always-indent 'complete)

(setq confirm-kill-processes nil)
(setq confirm-kill-emacs nil)
