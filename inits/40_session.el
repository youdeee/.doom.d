;; (require 'session)
;; (add-hook 'after-init-hook 'session-initialize)

;; ;; ファイルを前回保存した時ではなく、閉じた時のカーソル位置を記録する
;; (setq session-undo-check -1)

;; ;; M-x で実行したコマンド履歴の保存件数
;; (setq history-length 1000000)
;; (setq session-initialize '(de-saveplace session menus places keys))

;; ;; セッション管理する情報の設定
;; (setq session-globals-include
;;       '((kill-ring 1000)
;;         (session-file-alist 100 t) ;; カーソル位置100箇所
;;         (session-globals-max-size 100000)
;;         (file-name-history 300)))  ;; 開いたファイルのパス300件

;; ;; (custom-set-variables '(session-save-file "~/.emacs.d/cache/.session"))

;; ;; (require 'auto-save-buffers-enhanced)
;; ;; (setq auto-save-buffers-enhanced-interval 1) ; 指定のアイドル秒で保存
;; ;; (auto-save-buffers-enhanced t)
