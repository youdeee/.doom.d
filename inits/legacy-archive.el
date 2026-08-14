;;; inits/legacy-archive.el -*- lexical-binding: t; -*-
;;;
;;; ロードしないアーカイブ。
;;; Spacemacs / vanilla Emacs 時代のコメントアウト済み設定を、元ファイル単位で保管している。
;;; config.el の load! からは読まないこと。


;;; ---- 30_popwin.el ----

;; (require 'popwin)
;; (popwin-mode 1)
;; (setq display-buffer-function 'popwin:display-buffer)
;; (push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)
;; (setq popwin:popup-window-height 0.55)
;; ;;(setq popwin:close-popup-window-if-necessary t)
;; ;;(setq popwin:adjust-other-windows t)

;;; ---- 30_sticky.el ----

;; (require 'sticky)
;; (use-sticky-key ?\; sticky-alist:en)

;;; ---- 30_highlight-symbol.el ----

;; (require 'highlight-symbol)

;; (setq highlight-symbol-colors '("#D500F9" "#3D5AFE" "#76FF03" "#FF9100" "#ff1744" "#00E5FF"))

;; (defun highlight-symbol-or-region (highlight-symbol &rest args)
;;   (cond ((and (called-interactively-p 'interactive) transient-mark-mode (not mark-active))
;;          (apply highlight-symbol args))
;;         (t
;;          (let ((symbol (buffer-substring-no-properties (mark) (point))))
;;            (if (highlight-symbol-symbol-highlighted-p symbol)
;;                (highlight-symbol-remove-symbol symbol)
;;              (highlight-symbol-add-symbol symbol)
;;              (when (member 'explicit highlight-symbol-occurrence-message)
;;                (highlight-symbol-count symbol t))))
;;          (deactivate-mark)
;;          )))
;; (advice-add 'highlight-symbol :around 'highlight-symbol-or-region)

;; (defun my-highlight-symbol-input (arg)
;;   (interactive "sHighlight string: ")
;;   (let ((symbol arg))
;;     (if (highlight-symbol-symbol-highlighted-p symbol)
;;         (highlight-symbol-remove-symbol symbol)
;;       (highlight-symbol-add-symbol symbol)
;;       (when (member 'explicit highlight-symbol-occurrence-message)
;;         (highlight-symbol-count symbol t)))))

;; ;;"yellow" "DeepPink" "cyan" "MediumPurple1" "SpringGreen1" "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"
;; ;;("DarkOrange" "DodgerBlue1" "DeepPink1"))

;; ;; (require 'auto-highlight-symbol)
;; ;; (global-auto-highlight-symbol-mode t )

;;; ---- 30_point-undo.el ----

;; (require 'point-undo)

;; (defvar prev-time nil)
;; (make-variable-buffer-local 'prev-time)

;; ;; override
;; (defun point-undo-pre-command-hook ()
;;   (message (format "%s/%s" (format-time-string "%s") prev-time))
;;   (unless (or (eq this-command 'point-undo)
;;               (eq this-command 'point-redo)
;;               (= (string-to-number (format-time-string "%s")) (string-to-number prev-time)))

;;     (let ((cell (cons (point) (window-start))))
;;       (unless (equal cell (car point-undo-list))
;;        (setq point-undo-list (cons cell point-undo-list))))
;;     (setq point-redo-list nil))
;;   (setq prev-time (format-time-string "%s")))
;; (add-hook 'pre-command-hook 'point-undo-pre-command-hook)

;;; ---- 30_sql.el ----

;; (require 'sql)
;; ;;(defalias 'sql-get-login 'ignore)


;; (defun my-sql-save-history-hook ()
;;   (let ((lval 'sql-input-ring-file-name)
;;         (rval 'sql-product))
;;     (if (symbol-value rval)
;;         (let ((filename
;;                (concat "~/.emacs.d/sql/"
;;                        (symbol-name (symbol-value rval))
;;                        "-history.sql")))
;;           (set (make-local-variable lval) filename))
;;       (error
;;        (format "SQL history will not be saved because %s is nil"
;;                (symbol-name rval))))))

;; (add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)


;; ;; (defvar sql-last-prompt-pos 1
;; ;;   "position of last prompt when added recording started")
;; ;; (make-variable-buffer-local 'sql-last-prompt-pos)
;; ;; (put 'sql-last-prompt-pos 'permanent-local t)

;; ;; (defun sql-add-newline-first (output)
;; ;;   "Add newline to beginning of OUTPUT for `comint-preoutput-filter-functions'
;; ;;     This fixes up the display of queries sent to the inferior buffer
;; ;;     programatically."
;; ;;   (let ((begin-of-prompt
;; ;;          (or (and comint-last-prompt-overlay
;; ;;                   ;; sometimes this overlay is not on prompt
;; ;;                   (save-excursion
;; ;;                     (goto-char (overlay-start comint-last-prompt-overlay))
;; ;;                     (looking-at-p comint-prompt-regexp)
;; ;;                     (point)))
;; ;;              1)))
;; ;;     (if (> begin-of-prompt sql-last-prompt-pos)
;; ;;         (progn
;; ;;           (setq sql-last-prompt-pos begin-of-prompt)
;; ;;           (concat "\n" output))
;; ;;       output)))

;; ;; (defun sqli-add-hooks ()
;; ;;   "Add hooks to `sql-interactive-mode-hook'."
;; ;;   (add-hook 'comint-preoutput-filter-functions
;; ;;             'sql-add-newline-first))

;; ;;(add-hook 'sql-interactive-mode-hook 'sqli-add-hooks)


;; (defun upcase-sql-keywords ()
;;   (interactive)
;;   (save-excursion
;;     (dolist (keywords sql-mode-postgres-font-lock-keywords)
;;       (goto-char (point-min))
;;       (while (re-search-forward (car keywords) nil t)
;;         (goto-char (+ 1 (match-beginning 0)))
;;         (when (eql font-lock-keyword-face (face-at-point))
;;           (backward-char)
;;           (upcase-word 1)
;;           (forward-char))))))

;; (add-hook 'sql-interactive-mode-hook
;;           (lambda ()
;;             (toggle-truncate-lines t)))


;; (defun my-sql-save-history-hook ()
;;   (let ((lval 'sql-input-ring-file-name)
;;         (rval 'sql-product))
;;     (if (symbol-value rval)
;;         (let ((filename (expand-file-name
;;                          (cdr (assoc (symbol-value rval)
;;                                      '((postgres . "~/.psql_history")
;;                                        (mysql    . "~/.mysql_history")
;;                                        (sqlite   . "~/.sqlite_history")
;;                                        (oracle   . "~/.sqlhistory")))))))
;;           (set (make-local-variable lval) filename))
;;       (error
;;        (format "SQL history will not be saved because %s is nil"
;;                (symbol-name rval))))))
;; (add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)
;; (setq sql-input-ring-separator "\n")
;; (setq coding-system-for-read 'utf-8)
;; (setq coding-system-for-write 'utf-8)

;;; ---- 40_uniquify.el ----

;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; ---- 40_recentf.el ----

;; (require 'recentf)

;; (require 'recentf-ext)

;; (recentf-mode t)
;; ;; (custom-set-variables '(recentf-save-file "~/.emacs.d/cache/.recentf"))
;; (setq recentf-exclude '(".recentf"))
;; (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))

;; (defmacro with-suppressed-message (&rest body)
;;   "Suppress new messages temporarily in the echo area and the `*Messages*' buffer while BODY is evaluated."
;;   (declare (indent 0))
;;   (let ((message-log-max nil))
;;     `(with-temp-message (or (current-message) "") ,@body)))

;;; ---- 40_keychord.el ----

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

;;; ---- 40_session.el ----

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

;;; ---- 50_yasnippet.el ----

;; (require 'yasnippet)
;; (setq yas-snippet-dirs '("~/.spacemacs.d/snippets" yas-installed-snippets-dir))

;; ;; (require 'helm-c-yasnippet)
;; ;; (setq helm-yas-space-match-any-greedy t)
;; ;; (push '("emacs.+/snippets/" . snippet-mode) auto-mode-alist)
;; (yas-global-mode 1)


;; ;; ;;; フィールドの編集で smartchr が効かなくなる問題の修正
;; ;; (remove-hook 'c-mode-common-hook
;; ;;              '(lambda ()
;; ;;                 (dolist (k '(":" ">" ";" "<" "{" "}"))
;; ;;                   (define-key (symbol-value (make-local-variable 'yas-keymap))
;; ;;                     k 'self-insert-command))))

;; ;; ;;; キーが重複したときに yas-snippet-dirs のリストで先頭に近い
;; ;; ;;; ディレクトリのスニペットが挿入されるように修正
;; ;; (defun yas--prompt-for-template (templates &optional prompt)
;; ;;   (when templates
;; ;;     (some #'(lambda (fn)
;; ;;               (funcall fn (or prompt "Choose a snippet: ")
;; ;;                        templates
;; ;;                        #'yas--template-name))
;; ;;           yas-prompt-functions)))

;; ;; (defun my-yas/prompt (prompt choices &optional display-fn)
;; ;;   (let* ((names (loop for choice in choices
;; ;;                       collect (or (and display-fn (funcall display-fn choice))
;; ;;                                   choice)))
;; ;;          (selected (helm-other-buffer
;; ;;                     `(((name . ,(format "%s" prompt))
;; ;;                        (candidates . names)
;; ;;                        (action . (("Insert snippet" . (lambda (arg) arg))))))
;; ;;                     "*helm yas/prompt*")))
;; ;;     (if selected
;; ;;         (let (((not  ) (position selected names :test 'equal)))
;; ;;           (nth n choices))
;; ;;       (signal 'quit "user quit!"))))

;;; ---- 50_projectile.el ----

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

;;; ---- 81_csv.el ----

;; (add-to-list 'auto-mode-alist '("\\.[Tt][Ss][Vv]\\'" . csv-mode))

;; (add-hook 'csv-mode-hook
;;           (lambda ()
;;             (if (equal (file-name-extension buffer-file-name) "tsv")
;;                 (setq-local csv-separators '("\t" ","))
;;               (setq-local csv-separators '("," "\t")))))

;; (defun csv-separators-toggle ()
;;   (interactive)
;;   (cond ((equal (car csv-separators) ",")
;;          (setq-local csv-separators '("\t" ","))
;;          (message "Separator -> TAB"))
;;         (t
;;          (setq-local csv-separators '("," "\t"))
;;          (message "Separator -> ,"))))

;;; ---- 88_custom-function.el ----

;; (defun kill-region-or-word (kill-region &rest args)
;;   (cond ((and (called-interactively-p 'interactive) transient-mark-mode (not mark-active))
;;          ;;(backward-word 1)
;;          ;;(kill-word 1)
;;          ;;(er/expand-region 1)
;;          ;;(apply kill-region args)
;;          (kill-symbol))
;;         (t
;;          (apply kill-region args))))
;; (advice-add 'kill-region :around 'kill-region-or-word)

;; (defun replace-symbol-from-kill-ring ()
;;   (interactive)
;;   (kill-symbol)
;;   ;;(let ((copied (cadr kill-ring)))
;;   ;;    (kill-new copied)
;;   (insert (cadr kill-ring)))

;;; ---- 90_local.el ----

;; (require 'migemo)
;; (setq migemo-command "cmigemo")
;; (setq migemo-options '("-q" "--emacs"))
;; (setq migemo-dictionary "/usr/local/Cellar/cmigemo/HEAD-5c014a8/share/migemo/utf-8/migemo-dict")
;; (setq migemo-user-dictionary nil)
;; (setq migemo-regex-dictionary nil)
;; (setq migemo-coding-system 'utf-8-unix)
;; (migemo-init)
(setq org-directory "~/Dropbox/junk/org/")
(setq org-agenda-files (list org-directory))
;; (setq lsp-dart-sdk-dir "~/fvm/versions/3.22.3/bin/cache/dart-sdk/")
;; (setq lsp-dart-flutter-sdk-dir "~/fvm/versions/3.22.3/")
;; (setq lsp-dart-flutter-executable "fvm flutter")
;; (setq mc/list-file "~/.emacs.d/.cache/.mc-lists.el")
;; (setq undohist-directory "~/.emacs.d/.cache/undohist")
(setq helm-ag-use-agignore t)
