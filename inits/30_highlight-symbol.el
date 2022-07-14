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
