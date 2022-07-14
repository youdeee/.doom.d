(dumb-jump-mode)
(setq bm-cycle-all-buffers t)

;; (require 'lsp-mode)
;; (add-hook 'ruby-mode-hook #'lsp)

;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . react-mode))
;; ;; (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
;; ;; (add-hook 'js2-jsx-mode-hook 'flycheck-mode)
(setq js2-basic-offset 2)
;; (add-hook 'js2-mode-hook 'skewer-mode)
;; (add-hook 'css-mode-hook 'skewer-css-mode)
;; (add-hook 'html-mode-hook 'skewer-html-mode)
;; (add-hook 'js2-mode-hook 'ac-js2-mode)

(defun no-line-break ()
  (setq-local electric-layout-rules
              '((?\{ . after) (?\} . before))))
(add-hook 'js2-mode-hook 'no-line-break)

;; ;; (require 'yaml-mode)
;; ;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; ;;  ;; (add-hook 'yaml-mode-hook
;; ;;  ;;    '(lambda ()
;; ;;  ;;       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; (require 'scss-mode)
;; (add-to-list 'auto-mode-alist '("\\.\\(scss\\|css\\)\\'" . scss-mode))
;; (add-hook 'scss-mode-hook 'custom-scss-mode-hook)
;; ;; (add-hook 'scss-mode-hook 'ac-css-mode-setup)
;; ;; (add-hook 'scss-mode-hook 'auto-complete-mode)
;; ;; (add-to-list 'ac-modes 'scss-mode)

;; (defun custom-scss-mode-hook ()
;;   (setq indent-tabs-mode nil)
;;   (setq css-indent-offset 2)
;;  (setq scss-compile-at-save nil))

;; ;;mardkown-mode
;; (autoload 'markdown-mode "markdown-mode"
;;   "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; web-mode
(require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))

(defun custom-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2) ;; html indent
  (setq web-mode-css-indent-offset 2)    ;; css indent
  (setq web-mode-code-indent-offset 2)   ;; script indent(js,php,etc..)
  (setq web-mode-comment-style 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-block-padding 2)
  ;; 終了タグの自動補完をしない
  ;; (setq web-mode-disable-auto-pairing t)
  ;; (setq web-mode-disable-css-colorization t)
  (setq web-mode-enable-block-faces t)
  (setq web-mode-enable-heredoc-fontification t)
  (setq indent-tabs-mode nil))
(add-hook 'web-mode-hook  'custom-web-mode-hook)

(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
;; (add-hook 'php-mode-hook 'rainbow-mode)
;; (add-hook 'emacs-lisp-mode 'rainbow-mode)
;; ;;(add-hook 'html-mode-hook 'rainbow-mode)

;; (setq inferior-lisp-program "clisp")
;; (require 'slime)
;; (slime-setup '(slime-repl slime-fancy slime-banner))
;; (require 'ac-slime)
;; ;;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;; ;;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;; ;;(add-hook emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; ;; Apropos
;; (push '("*slime-apropos*") popwin:special-display-config)
;; ;; Macroexpand
;; (push '("*slime-macroexpansion*") popwin:special-display-config)
;; ;; Help
;; (push '("*slime-description*") popwin:special-display-config)
;; ;; Compilation
;; (push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; ;; Cross-reference
;; (push '("*slime-xref*") popwin:special-display-config)
;; ;; Debugger
;; (push '(sldb-mode :stick t) popwin:special-display-config)
;; ;; REPL
;; (push '(slime-repl-mode) popwin:special-display-config)
;; ;; Connections
;; (push '(slime-connection-list-mode) popwin:special-display-config)

(add-hook 'c-mode-hook 'my-c-mode-setup)
(defun my-c-mode-setup ()
  (define-key c-mode-base-map ";" nil))

;; (defun indent-and-save-file (file)
;;   "Indent a region if selected, otherwise the whole buffer."
;;   (interactive)
;;   (save-excursion
;;     (if (region-active-p)
;;         (progn
;;           (indent-region (region-beginning) (region-end))
;;           (message "Indented selected region."))
;;       (progn
;;         (evil-indent (point-min) (point-max))
;;         (message "Indented buffer.")))
;;     (whitespace-cleanup)
;;     (save-buffer)))

;; (defun indent-all-file-under-directory (dir)
;;   (dolist (file (f-files dir nil t))
;;     ;;(indent-and-save-file file)
;;     (save-excursion
;;       (find-file file)
;;       (indent-region (point-min) (point-max))
;;       (save-buffer))))

;; (defun ruby-mode-set-frozen-string-literal-true ()
;;   (when exec-hook
;;       (when (eq major-mode 'ruby-mode)
;;         (save-excursion
;;           (widen)
;;           (goto-char (point-min))
;;           (unless (looking-at "^# frozen_string_literal:")
;;             (insert "# frozen_string_literal: true\n\n"))))))

;; (add-hook 'ruby-mode-hook (lambda()
;;                             (add-hook 'before-save-hook 'ruby-mode-set-frozen-string-literal-true)))

;; dart
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (package-initialize)

;; (setq package-selected-packages
;;       '(dart-mode lsp-mode lsp-dart lsp-treemacs flycheck company
;;                   ;; Optional packages
;;                   lsp-ui company hover))

;; (when (cl-find-if-not #'package-installed-p package-selected-packages)
;;   (package-refresh-contents)
;;   (mapc #'package-install package-selected-packages))

(add-hook 'dart-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024))

(setq css-indent-offset 2)
(setq js-indent-level 2)
(setq web-mode-attr-indent-offset 2)
(setq web-mode-attr-value-indent-offset 2)
(setq web-mode-block-padding 2)
(setq web-mode-enable-auto-closing t)
(setq web-mode-script-padding 2)
;; (setq lsp-enable-on-type-formatting t)
