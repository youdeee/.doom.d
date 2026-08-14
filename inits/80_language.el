;;; -*- lexical-binding: t; -*-

(after! bm
  (setq bm-cycle-all-buffers t))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(setq js2-basic-offset 2
      css-indent-offset 2
      js-indent-level 2
      typescript-indent-level 2
      gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024))

(after! js2-mode
  (add-hook! 'js2-mode-hook
    (defun my-js2-no-line-break-h ()
      (setq-local electric-layout-rules '((?\{ . after) (?\} . before))))))

(after! web-mode
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-comment-style 2
        web-mode-script-padding 2
        web-mode-block-padding 2
        web-mode-enable-block-faces t
        web-mode-enable-heredoc-fontification t
        web-mode-attr-indent-offset 2
        web-mode-attr-value-indent-offset 2
        web-mode-enable-auto-closing t)
  (add-hook! 'web-mode-hook
    (setq-local indent-tabs-mode nil)))

(use-package! rainbow-mode
  :hook (css-mode scss-mode))

(after! cc-mode
  (map! :map c-mode-base-map
        ";" nil))
