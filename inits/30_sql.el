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
