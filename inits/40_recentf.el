;; (require 'recentf)

;; (require 'recentf-ext)

;; (recentf-mode t)
;; ;; (custom-set-variables '(recentf-save-file "~/.emacs.d/cache/.recentf"))
;; (setq recentf-exclude '(".recentf"))
;; (setq recentf-auto-cleanup 'never)
;; (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))

;; (defmacro with-suppressed-message (&rest body)
;;   "Suppress new messages temporarily in the echo area and the `*Messages*' buffer while BODY is evaluated."
;;   (declare (indent 0))
;;   (let ((message-log-max nil))
;;     `(with-temp-message (or (current-message) "") ,@body)))
