;; (with-eval-after-load "helm" (helm-migemo-mode +1))

;; helm-ag
;; (require 'helm-ag)
;; (when (executable-find "rg")
;;   (setq helm-ag-base-command "rg --vimgrep --no-heading"))
;; (setq helm-ag-insert-at-point 'symbol)

;; (defun helm-ag-dot-spacemacs ()
;;   ".spacemacs.d以下を検索"
;;   (interactive)
;;   (helm-ag "~/.spacemacs.d/"))

;; (require 'projectile nil t)
;; (defun helm-projectile-ag ()
;;   "Projectileと連携"
;;   (interactive)
;;   (helm-ag (projectile-project-root)))


;;(require 'helm-config)
;;(require 'migemo)

;; (helm-mode 1)
;; (helm-migemo-mode 1)
;; (helm-descbinds-mode 1)
;; (setq helm-recentf-fuzzy-match t)
;; (setq helm-buffers-fuzzy-matching t)
;; (setq helm-locate-fuzzy-match t)
;; (setq helm-gtags-auto-update t)
;; (setq helm-M-x-fuzzy-match nil)
;; (setq helm-semantic-fuzzy-match t)
;; (setq helm-imenu-fuzzy-match t)
;; (setq helm-apropos-fuzzy-match t)
;; (setq helm-lisp-fuzzy-completion t)
;; (setq helm-mode-fuzzy-match t)
;; (setq helm-completion-in-region-fuzzy-match t)
;; (setq helm-ff-fuzzy-matching t)
;; (setq helm-projectile-fuzzy-match t)
;;(setq helm-candidate-number-limit 1000)

;;(setq helm-autoresize-mode 1)
;;(setq helm-split-window-default-side 'right)
;;(setq helm-css-scss-split-direction 'split-window-horizontally)

;; ;; mini bufferでもkill ring使えるように
;; (setq helm-delete-minibuffer-contents-from-point t)
;; (add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))
;; (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
;;   (kill-new (buffer-substring (point) (field-end))))

;; ;; find fileのときにTAB押すと新しいファイル作るの防ぐ
;; (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
;;   "Execute command only if CANDIDATE exists"
;;   (when (file-exists-p candidate)
;;     ad-do-it))

;; ;; (require 'helm-migemo)
;; ;; (eval-after-load "helm-migemo"
;; ;;   '(defun helm-compile-source--candidates-in-buffer (source)
;; ;;      (helm-aif (assoc 'candidates-in-buffer source)
;; ;;          (append source
;; ;;                  `((candidates
;; ;;                     . ,(or (cdr it)
;; ;;                            (lambda ()
;; ;;                              ;; Do not use `source' because other plugins
;; ;;                              ;; (such as helm-migemo) may change it
;; ;;                              (helm-candidates-in-buffer (helm-get-current-source)))))
;; ;;                    (volatile) (match identity)))
;; ;;        source)))

;; ;; ;; フィルタリング2のロジックをいい感じ
;; ;; (defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
;; ;;   "Transform the pattern to reflect my intention"
;; ;;   (let* ((pattern (ad-get-arg 0))
;; ;;          (input-pattern (file-name-nondirectory pattern))
;; ;;          (dirname (file-name-directory pattern)))
;; ;;     (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
;; ;;     (setq ad-return-value
;; ;;           (concat dirname
;; ;;                   (if (string-match "^\\^" input-pattern)
;; ;;                       ;; '^' is a pattern for basename
;; ;;                       ;; and not required because the directory name is prepended
;; ;;                       (substring input-pattern 1)
;; ;;                     (concat ".*" input-pattern))))))
;; ;; (defun helm-buffers-list-pattern-transformer (pattern)
;; ;;   (if (equal pattern "")
;; ;;       pattern
;; ;;     ;; Escape '.' to match '.' instead of an arbitrary character
;; ;;     (setq pattern (replace-regexp-in-string "\\." "\\\\." pattern))
;; ;;     (let ((first-char (substring pattern 0 1)))
;; ;;       (cond ((equal first-char "*")
;; ;;              (concat " " pattern))
;; ;;             ((equal first-char "=")
;; ;;              (concat "*" (substring pattern 1)))
;; ;;             (t
;; ;;              pattern)))))
;; ;; (add-to-list 'helm-source-buffers-list
;; ;;              '(pattern-transformer helm-buffers-list-pattern-transformer))

;; ;; (require 'ag)
;; ;; (setq default-process-coding-system 'utf-8-unix)  ; ag 検索結果のエンコード指定
;; ;; (setq ag-highlight-search t)  ; 検索キーワードをハイライト
;; ;; (setq ag-reuse-buffers t)     ; 検索用バッファを使い回す (検索ごとに新バッファを作らない)

;; ;; ; wgrep
;; ;; (add-hook 'ag-mode-hook '(lambda ()
;; ;;                            (require 'wgrep-ag)
;; ;;                            (setq wgrep-auto-save-buffer t)  ; 編集完了と同時に保存
;; ;;                            (setq wgrep-enable-key "r")      ; "r" キーで編集モードに
;; ;;                            (wgrep-ag-setup)))
(use-package! helm
  :after helm-mode
  :init
  (setq helm-M-x-fuzzy-match nil)
  (setq helm-ff-fuzzy-matching t))

(remove-hook 'doom-first-buffer-hook #'ws-butler-global-mode)
