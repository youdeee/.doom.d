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
