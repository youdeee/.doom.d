;; ;; コントロール用のバッファを同一フレーム内に表示
;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; ;; diff のバッファを上下ではなく左右に並べる
;; (setq ediff-split-window-function 'split-window-horizontally)

;; (smart-newline-mode 1)

;;(setq magit-last-seen-setup-instructions "1.4.0")

;; (require 'auto-complete-config)
;; (require 'fuzzy)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
;; ;; (custom-set-variables '(ac-comphist-file "~/.emacs.d/cache/ac-comphist.dat"))
;; (ac-config-default)
;; (setq ac-use-menu-map t)

;; (setq ac-auto-start 2)
;; (setq ac-use-fuzzy t)
;; (setq ac-ignore-case nil)
;; (setq ac-modes (append ac-modes '(objc-mode)))
;; (auto-complete 'ac-persist-help)

;; (setq ac-delay 0.05)  ;; 0
;; (setq ac-use-comphist t)  ;; 補完推測機能有効
;; (setq ac-auto-show-menu 0.05)  ;; 0.8
;; (setq ac-quick-help-delay 0.5)  ;; n 秒後にクイックヘルプを表示
;; (setq popup-use-optimized-column-computation nil) ;; 最適化無効でメニュー表示崩れ回避
;; (setq ac-auto-start 1)

;; (add-to-list 'ac-modes 'text-mode)
;; (add-to-list 'ac-modes 'fundamental-mode)
;; (add-to-list 'ac-modes 'org-mode)
;; (add-to-list 'ac-modes 'yatex-mode)
;; (add-to-list 'ac-modes 'markdown-mode)
;; (add-to-list 'ac-modes 'swift-mode)
;; (add-hook 'markdown-mode-hook
;;           (lambda ()
;;             (make-local-variable 'ac-ignore-case)
;;             (setq ac-ignore-case 'smart)))

;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))
;; (defalias 'exit 'save-buffers-kill-emacs)

;; (require 'indent-guide)
;; (indent-guide-global-mode)

;; (require 'lispxmp)

;; (require 'flex-autopair)
;; (flex-autopair-mode 1)

;; (require 'autopair)
;; (autopair-global-mode 1)

;; (require 'smartparens-config)
;; (smartparens-global-mode t)
;; (show-smartparens-global-mode t)
;; (sp-pair "<%" "%>")

;; (require 'key-combo)
;; ;; (key-combo-load-default)
;; (key-combo-define-global (kbd "<") '("<"))

;; (require 'undohist)
;; (undohist-initialize)


;; (require 'undo-tree)
;; (global-undo-tree-mode t)
;;M-(C-)/    C-x u :show tree   d:details
;;(global-set-key (kbd "M-/") 'undo-tree-redo)


;; (setq elscreen-prefix-key "")
;; (elscreen-start)
;; (setq elscreen-tab-display-kill-screen nil)
;; (setq elscreen-tab-display-control nil)
;; (setq elscreen-buffer-to-nickname-alist
;;       '(("^dired-mode$" .
;;          (lambda ()
;;            (format "Dired(%s)" dired-directory)))
;;         ("^Info-mode$" .
;;          (lambda ()
;;            (format "Info(%s)" (file-name-nondirectory Info-current-file))))
;;         ("^mew-draft-mode$" .
;;          (lambda ()
;;            (format "Mew(%s)" (buffer-name (current-buffer)))))
;;         ("^mew-" . "Mew")
;;         ("^irchat-" . "IRChat")
;;         ("^liece-" . "Liece")
;;         ("^lookup-" . "Lookup")))
;; (setq elscreen-mode-to-nickname-alist
;;       '(("[Ss]hell" . "shell")
;;         ("compilation" . "compile")
;;         ("-telnet" . "telnet")
;;         ("dict" . "OnlineDict")
;;         ("*WL:Message*" . "Wanderlust")))
;; (elscreen-separate-buffer-list-mode 1)
;; (elscreen-persist-mode 1)

;; (tabbar-mode 1)
;; (setq tabbar-use-images nil)
;; (setq tabbar-buffer-groups-function nil)
;; (dolist (btn '(tabbar-buffer-home-button
;;                tabbar-scroll-left-button
;;                tabbar-scroll-right-button))
;;   (set btn (cons (cons "" nil)
;;                  (cons "" nil))))

;; (desktop-save-mode 1)

;; (require 'goto-chg)

;; (require 'point-undo)


;; (require 'expand-region)

;;(require 'smarter-compile)

;;;; migemo は一度読みこむとなぜか再読込ができない。dictionary のパスは環境に依存するので 99_local で下をコピペしてパス書き換えて定義する
;; (require 'migemo)
;; (setq migemo-command "cmigemo")
;; (setq migemo-options '("-q" "--emacs"))
;; (setq migemo-dictionary "/usr/local/Cellar/cmigemo/HEAD/share/migemo/utf-8/migemo-dict")
;; (setq migemo-user-dictionary nil)
;; (setq migemo-regex-dictionary nil)
;; (setq migemo-coding-system 'utf-8-unix)
;; (migemo-init)

;; (require 'editorconfig)
;; (editorconfig-mode 1)

;; (custom-set-variables '(projectile-known-projects-file "~/.emacs.d/cache/projectile-bookmarks.eld"))

;; (setq migemo-pattern-alist-file "~/.emacs.d/cache/migemo-pattern")
;; (setq migemo-frequent-pattern-alist-file "~/.emacs.d/cache/migemo-frequent")

;;(setq auto-save-file-name-transforms '((".*" ,my-backup-dir t)))
;; (custom-set-variables '(auto-save-list-file-prefix "~/.emacs.d/cache/auto-save-list/.saves-"))

;;(setq-default ac-sources (push 'ac-source-yasnippet ac-sources))


;; タイトルバーにファイルのフルパス表示
(setq frame-title-format (format "%%f @%s" (system-name)))

;; タブの幅
;;(setq tab-width 2)
(setq-default tab-width 2 indent-tabs-mode nil)

;;前の行とインデントをあわせる
(setq indent-line-function 'indent-relative-maybe)

;; ;; 補完 大文字小文字
;; (setq completion-ignore-case t)
;; (which-function-mode 1)
;; (setq read-file-name-completion-ignore-case t)
;; (setq read-buffer-completion-ignore-case t)
;; (setq isearch-case-fold-search t)
;; (setq case-fold-search t)

;; ;; 補完可能なものを随時表示
;; (icomplete-mode 1)

;; 矩形
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; ;; 行末の空白を表示
;; ;;(setq-default show-trailing-whitespace t)
;; (require 'whitespace)
;; (setq whitespace-style '(face trailing tabs empty space-mark tab-mark))

;; (setq whitespace-display-mappings
;; '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; (defvar my/bg-color "#2F2F2F")
;; (set-face-attribute 'whitespace-empty nil :background my/bg-color)
;; (set-face-attribute 'whitespace-trailing nil
;;                     :background "#111111"
;;                     :foreground "DeepPink"
;;                     :underline t)

(setq whitespace-style '(face           ; face で可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         ;;                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))
(setq whitespace-display-mappings
      '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])
        (space-mark ?\x3000 [?\□])))
(global-whitespace-mode 1)

;; (require 'avy-migemo)
(avy-migemo-mode -1)

(setq switch-window-shortcut-style 'qwerty)

;; (setq helm-swoop-split-window-function 'spacemacs//display-helm-window)

(setq hippie-expand-try-functions-list
      '(
        try-expand-all-abbrevs
        try-expand-dabbrev
        try-expand-list
        ;; try-expand-line-all-buffers
        ;; try-expand-line
        ;; try-expand-dabbrev-visible
        ;; try-expand-whole-kill
        try-expand-dabbrev-from-kill
        try-expand-dabbrev-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(custom-set-faces
 '(mode-line ((t (:background "#464646"))))
 '(mode-line-inactive ((t (:background "#2e2e2e"))))
 '(hl-line ((t (:underline "SteelBlue4"))))
 '(doom-modeline-buffer-modified ((t (:background "#da1001"))))
 )
