;; (require 'key-chord)
;; (setq key-chord-two-keys-delay 0.02)
;; (key-chord-mode 1)

;; (key-chord-define-global "jk" 'view-mode)
;; (key-chord-define-global "df" 'helm-descbinds)
;; (key-chord-define-global "sb" 'switch-to-last-buffer)
;; ;; (key-chord-define-global "sl" 'mark-word*)
;; ;; (key-chord-define-global "so" 'mark-paragraph)
;; ;; (key-chord-define-global "s." 'mark-sexp*)
;; ;; (key-chord-define-global "wl" 'copy-word)
;; ;; (key-chord-define-global "wo" 'copy-paragraph)
;; ;; (key-chord-define-global "w." 'copy-sexp)
;; ;; (key-chord-define-global "xl" 'kill-word*)
;; ;; (key-chord-define-global "xo" 'kill-paragraph*)
;; ;; (key-chord-define-global "x." 'kill-sexp*)

;; (defun switch-to-last-buffer ()
;;   (interactive)
;;   (switch-to-buffer nil))

;; ;; ;; key-chord.el の input-method-function が勝手に nil にされることがあるので修正
;; ;; ;; http://d.hatena.ne.jp/grandVin/20080917/1221653750
;; ;; (defadvice toggle-input-method (around toggle-input-method-around activate)
;; ;;   (let ((input-method-function-save input-method-function))
;; ;;     ad-do-it
;; ;;     (setq input-method-function input-method-function-save)))

;; ;; ;; 書き込み不能なファイルはview-modeで開くように
;; ;; (defadvice find-file
;; ;;     (around find-file-switch-to-view-file (file &optional wild) activate)
;; ;;   (if (and (not (file-writable-p file))
;; ;;            (not (file-directory-p file)))
;; ;;       (view-file file)
;; ;;     ad-do-it))

;; ;; ;; 書き込み不能な場合はview-modeを抜けないように
;; ;; (defvar view-mode-force-exit nil)
;; ;; (defmacro do-not-exit-view-mode-unless-writable-advice (f)
;; ;;   `(defadvice ,f (around do-not-exit-view-mode-unless-writable activate)
;; ;;      (if (and (buffer-file-name)
;; ;;               (not view-mode-force-exit)
;; ;;               (not (file-writable-p (buffer-file-name))))
;; ;;          (message "File is unwritable, so stay in view-mode.")
;; ;;        ad-do-it)))
;; ;; (do-not-exit-view-mode-unless-writable-advice view-mode-exit)
;; ;; (do-not-exit-view-mode-unless-writable-advice view-mode-disable)

;; ;; ;;リージョン選択機能の拡張（単語選択など）
;; ;; (require 'thingopt)
;; ;; (define-thing-commands)
;; ;; (key-chord-define-global "ii" 'mark-word*)   ;; i連続押しで現在の単語を選択
;; ;; (global-set-key (kbd "C-c 2") 'mark-string)  ;; ストリングを選択
;; ;; (global-set-key (kbd "C-c 8") 'mark-up-list) ;; リスト（...）を選択
;; ;; (global-set-key (kbd "C-c 7") 'mark-symbol)  ;; シンボル'...を選択(シングルクォート)
