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
