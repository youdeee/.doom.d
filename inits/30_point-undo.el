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
