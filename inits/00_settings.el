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

;; (defadvice! my/kill-emacs-hook-identify-a (orig hook)
;;   "Name the failing `kill-emacs-hook' function in the quit prompt and a log file."
;;   :around #'run-hook-query-error-with-timeout
;;   (if (not (eq hook 'kill-emacs-hook))
;;       (funcall orig hook)
;;     (run-hook-wrapped
;;      hook
;;      (lambda (fun)
;;        (condition-case err
;;            (funcall fun)
;;          (error
;;           (let ((name (if (symbolp fun) fun 'lambda))
;;                 (log (expand-file-name "kill-emacs-hook-error.log" doom-cache-dir)))
;;             (with-temp-file log
;;               (insert (format "FAILED: %S\nERROR: %S\nHOOKS: %S\n"
;;                               name err kill-emacs-hook)))
;;             (unless (y-or-n-p-with-timeout
;;                      (format "Error in %s: %s; continue?" name err)
;;                      5 t)
;;               (signal (car err) (cdr err))))))
;;        nil))))

;; (after! persp-mode
;;   (setq persp-auto-save-num-of-backups 10))

;; (after! savehist
;;   (defun my/savehist-take-proper (value)
;;     "Return a proper-list prefix of VALUE, dropping a non-list tail."
;;     (let (out)
;;       (while (consp value)
;;         (push (car value) out)
;;         (setq value (cdr value)))
;;       (when value
;;         (message "savehist: dropped non-list tail %S" value))
;;       (nreverse out)))

;;   (add-hook! 'savehist-save-hook :depth -100
;;     (defun my/savehist-sanitize-h ()
;;       "Drop non-list savehist values so `savehist-save' cannot signal listp errors."
;;       (unless (proper-list-p kill-ring)
;;         (setq kill-ring
;;               (cl-remove-if-not #'stringp (my/savehist-take-proper kill-ring))))
;;       (when (boundp 'register-alist)
;;         (setq register-alist
;;               (cl-loop for elt in (my/savehist-take-proper register-alist)
;;                        if (consp elt) collect elt
;;                        else do (message "savehist: skip register entry %S" elt))))
;;       (setq savehist-additional-variables
;;             (my/savehist-take-proper savehist-additional-variables))
;;       (setq savehist-minibuffer-history-variables
;;             (cl-loop for sym in (my/savehist-take-proper
;;                                  savehist-minibuffer-history-variables)
;;                      if (not (symbolp sym))
;;                      do (message "savehist: skip non-symbol %S" sym)
;;                      else if (or (not (boundp sym))
;;                                  (proper-list-p (symbol-value sym)))
;;                      collect sym
;;                      else do (message "savehist: skip %S (value %S)"
;;                                       sym (symbol-value sym)))))))

(after! recentf
  (setq recentf-max-menu-items 500))

(remove-hook 'doom-first-buffer-hook #'ws-butler-global-mode)

;; FVM のパスを Emacs の exec-path と PATH に追加（~ は展開しないと素通りする）
(let ((fvm-bin (expand-file-name "~/fvm/default/bin")))
  (add-to-list 'exec-path fvm-bin)
  (setenv "PATH" (concat fvm-bin ":" (getenv "PATH"))))
