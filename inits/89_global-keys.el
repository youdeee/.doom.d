;;; -*- lexical-binding: t; -*-

;; 残り
;; s- whitespace
;; C- ` - = - 5~9
;; C-x x
;; M- 2~9 z xw s g | ' " / ? - + _ ^ & * ( )

;; 便利
;; M系
;; j コメント付き改行
;; \ 空白削除
;; C系
;; C-M系
;; i インデント削除


;; 自作関数
(map! "C-o" #'mode-specific-command-prefix
      "C-z" #'mode-specific-command-prefix)

(map! :map override
      "C-t"     #'move-window
      "C-M-t"   #'move-window-opposite
      "C-M-k"   #'kill-all-line-forward
      "C-a"     #'goto-line-beginning-or-indent
      "C-e"     #'end-of-line
      ;; s-w押すときに間違って押してc-x c-cで強制終了することがあるのでとりあえず割り当ててる。割り当てたいコマンドできたら何かに当てたい
      "s-q"     #'window-resizer
      "M-t"     #'insert-timestamp
      "s-p"     #'add-file-name-to-kill-ring
      "C-h"     #'delete-backward-char
      "C-x k"   #'kill-current-buffer
      "C-S-v"   #'scroll-down-command
      "C-M-i"   #'delete-indentation
      "C-o C-t" (cmd! (insert "\t"))
      "C-."     (cmd! (insert "\t"))
      "C-<tab>" #'switch-to-next-buffer
      "C-S-<tab>" #'switch-to-prev-buffer
      "s-<right>" #'+workspace/switch-right
      "s-<left>" #'+workspace/switch-left
      "s-v"     #'describe-variable
      "C-?"     #'undo-fu-only-redo
      "M-r"     #'downcase-word
      "M-l"     #'move-to-window-line-top-bottom
      "C-x f"   #'helm-mini ;; '+helm/workspace-mini) なんかemacs2つにしてから死ぬ。。。
      "C-o a"   #'helm-ag
      "M-o"     #'helm-occur
      "M-O"     #'helm-ag-buffers
      "C-o r"   #'anzu-query-replace-regexp
      "C-o C-r" #'anzu-query-replace-at-cursor-thing
      "M-,"     #'highlight-symbol-at-point
      "M-."     #'unhighlight-regexp
      "C-;"     #'avy-goto-word-1
      ;; (bind-key* "C-;" 'avy-goto-char)
      ;; (bind-key* "C-\"" 'avy-goto-char-2)
      "C-'"     #'avy-goto-line
      "C-:"     #'switch-window
      "C-o C-;" #'avy-goto-line-below
      "C-o ;"   #'avy-goto-line-above
      "C-x C-z" #'open-dropbox-junk
      "M-/"     #'hippie-expand)

(map! "s-,"   #'toggle-frame-maximized
      "C-,"   #'kill-line-backward
      "C-M-," #'kill-all-line-backward
      "M-m"   #'start-and-end-macro
      "s-k"   #'kill-*-buffer
      ;;(bind-key "C-x a k" 'kill-all-buffer)
      "s-z"   #'split-window-3
      "s-w"   #'window-resizer
      "s-s"   #'save-buffer-without-hook
      "C-o =" #'indent-and-clean-buffer
      "C-M-;" #'copy-region-and-comment-out
      "C-o C-q" #'extract-purchase-amount-from-torihiki
      "C-o C-w" #'extract-profit-from-torihiki
      "C-o C-e" #'extract-torihiki-data
      "M-h"   #'backward-kill-word
      "C-x t" #'other-frame
      "s-f"   #'toggle-truncate-lines
      "s-g"   #'display-fill-column-indicator-mode
      "C-x m" #'kmacro-end-and-call-macro
      "C-x C-n" #'toggle-display-line-numbers
      "M-q"   #'quoted-insert
      "M-k"   #'kill-whole-line
      "C-x C-t" #'transpose-lines
      "s-e"   #'eval-buffer
      "M-p"   #'backward-paragraph
      "M-n"   #'forward-paragraph
      "C-j"   #'smart-newline
      "C-M-j" #'+default/newline
      "C-o f" #'helm-projectile-find-file ;;'helm-ls-git-ls)
      "M-y"   #'helm-show-kill-ring
      "C-o C-a" #'helm-do-ag-project-root
      "M-w"   #'easy-kill
      "C-x 1" #'zoom-window-zoom
      "s-i"   #'origami-toggle-node
      "s-."   #'lsp-find-definition)

;; (bind-key "M-t" 'custom-transpose-char)
;;(bind-key "C-1" 'replace-symbol-from-kill-ring)
;; (bind-key "C-o k" 'replace-forward-from-kill-ring)
;; (bind-key "C-o ," 'replace-backward-from-kill-ring)

;; defaults
;;(bind-key "s-&" 'kill-buffer)
;;(bind-key "C-x 5 o" 'transpose-words)
;;(bind-key "s-u" 'browse-url-of-file)
;; (bind-key "M-SPC" 'delete-trailing-whitespace)
;;(bind-key "s-f" 'auto-fill-mode)
;;(bind-key "C-x d" 'dired-jump)
;;(bind-key "s-r" 'revert-buffer)
;; (bind-key "M-t" 'transpose-chars)
;; (global-unset-key (kbd "s-q"))
;; (bind-key* "s-q" 'auto-complete)
;; (bind-key "C-q" 'back-to-indentation)
;; (bind-key "C-o C-f" 'fci-mode)
;; (bind-key "M-n" (lambda () (interactive) (scroll-up 1)))
;; (bind-key "M-p" (lambda () (interactive) (scroll-down 1)))
;; (bind-key "M-RET" 'newline-and-indent)

(map! :map isearch-mode-map
      "C-h" #'isearch-del-char)

;; helm
;; (bind-key* "M-."     'helm-bookmarks)
;; (bind-key* "C-x C-f" 'helm-find-files)
;; (bind-key* "M-o" (if (< 1000000 (buffer-size)) 'helm-occur 'helm-swoop))
;; (bind-key* "C-M-o" 'helm-multi-swoop-all)
;; (bind-key "C-x b" 'helm-do-ag-buffers)
;; (bind-key "C-x C-d" 'helm-dired-recent-dirs-view)
;; (bind-key "<f1> a" 'helm-apropos)
;; (require 'helm-files)
;; (bind-keys :map helm-find-files-map
;;            ("TAB" . helm-execute-persistent-action))
;; (bind-keys :map helm-read-file-map
;;            ("TAB" . helm-execute-persistent-action))
;; (define-key helm-map (kbd "C-h") 'delete-backward-char)
;; (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; yasnippet
(map! "C-x i" nil
      "C-x i i" #'yas-insert-snippet
      "C-x i n" #'yas-new-snippet
      "C-x i e" #'yas-visit-snippet-file)

(after! yasnippet
  (map! :map yas-minor-mode-map
        "TAB" nil
        "<tab>" nil
        "C-q" #'yas-expand-from-trigger-key))

;; multi-cursor
;; (bind-key "C-|" 'mc/edit-lines) ;;リージョン全てにカーソルおく
(use-package! smartrep
  :demand t
  :config
  (map! "C-\\" nil)
  (smartrep-define-key global-map "C-\\"
    '(("C-\\" . 'mc/mark-next-like-this)
      ("n"    . 'mc/mark-next-like-this)
      ("p"    . 'mc/unmark-next-like-this)
      ("P"    . 'mc/mark-previous-like-this)
      ("N"    . 'mc/unmark-previous-like-this)
      ("s"    . 'mc/skip-to-next-like-this)
      ("S"    . 'mc/skip-to-previous-like-this)
      ("m"    . 'mc/mark-more-like-this-extended)
      ("*"    . 'mc/mark-all-like-this)
      ("d"    . 'mc/mark-all-like-this-dwim)
      ("i"    . 'my/mc/insert-numbers)
      ("o"    . 'mc/sort-regions)
      ("O"    . 'mc/reverse-regions))))

;; ;; magit
;; (bind-key "s-g" 'magit-status)

;; ;; ohter
;; ;;(bind-key "C-o d" 'ag-dired)
;; (bind-key* "C-]" 'er/expand-region)
;; (bind-key* "C-}" 'er/contract-region)
;; ;;(bind-key "M-*" 'my-highlight-symbol-input)
;; ;;(bind-key "C-M-*" 'highlight-symbol-remove-all)

;; (bind-key "M-{" 'goto-last-change)
;; (bind-key "M-}" 'goto-last-change-reverse)
;; ;; (bind-key "M-[" 'point-undo)
;; ;; (bind-key "M-]" 'point-redo)
;; ;;(bind-key "C-x c" 'smarter-compile)
;; (bind-key* "C-x C-a" 'open-0sec-memo)

;; (define-key evil-emacs-state-map (kbd "C-z") nil)
;; (bind-key "C-z" 'zop-to-char)
;; ;;(bind-key "C-." 'pop-tag-mark)
;; ;;(bind-key "M-." 'find-tag)
;; ;;(bind-key "C-M-." 'helm-etags-select)
;; (bind-key "C-x C-1" 'delete-other-windows)
;; (if (require 'switch-window nil 'noerror)
;;     (bind-key* "M-T" 'switch-window))
;; (bind-key* "C-M-t" 'move-window-opposite)
;; (bind-key "C-M-b" 'bm-toggle)
;; (bind-key "s-b" 'bm-previous)
;; (bind-key "s-B" 'bm-next)
;; (bind-key "s-M-b" 'helm-bm)
;; (bind-key "C-M-n" 'dumb-jump-go)
;; ;; (bind-key "C-c C-c" 'vmd-mode markdown-mode-map)

;; ;; (bind-keys :map ac-menu-map
;; ;;            ("C-n" . ac-next)
;; ;;            ("C-p" . ac-previous))
(after! web-mode
  (map! :map web-mode-map
        "C-o C-f" #'web-mode-fold-or-unfold))
;; ;; (bind-keys :map ac-completing-map
;; ;;            ("M-/" . ac-stop))
;; ;; (bind-keys :map emacs-lisp-mode-map
;; ;;            ("C-c C-d" . lispxmp))
;; ;; (ac-set-trigger-key "<backtab>")
;; ;; (bind-keys :map isearch-mode-map
;; ;;            ("C-;" . avy-migemo-isearch))


;; (eval-after-load "emmet-mode"
;;   '(progn
;;      (define-key emmet-mode-keymap (kbd "C-j") nil)
;;      (define-key emmet-mode-keymap (kbd "TAB") nil)
;;      (define-key emmet-mode-keymap (kbd "<tab>") nil)
;;      (define-key emmet-mode-keymap (kbd "s-j") 'emmet-expand-line)))

;; ;; (require 'thingopt)
;; ;; (define-thing-commands)
;; ;; (bind-key "M-3" 'mark-word*)
;; ;; (bind-key "M-4" 'mark-string)
;; ;; (bind-key "M-5" 'mark-up-list)

;; ;; |M-b| 矩形をスペースで埋める
;; ;; |M-f| 矩形を入力された1文字で埋める
;; ;; |M-i| 矩形の各行の数値をインクリメントする
;; ;; |M-k| 矩形をキルする
;; ;; |M-n| 矩形の各行にインクリメントされた数値をフォーマットして挿入する
;; ;; |M-r| 矩形を置換する
;; ;; |M-t| 矩形を入力された文字列で埋める
;; ;; |M-|| 矩形を入力としてシェルコマンドを実行する。引数が指定されている場合はシェルコマンドの結果が矩形に埋まる
;; ;; |M-/| 矩形の正規表現にマッチする行をハイライト

;; ;; C-u C-s isearch-regexp

;; ;; helm-map
;; ;; <C-M-down>      helm-scroll-other-window
;; ;; <C-M-up>        helm-scroll-other-window-down
;; ;; M-m             helm-toggle-all-marks
;; ;; M-n             next-history-element
;; ;; M-p             previous-history-element
;; ;; C-s		Run Grep (C-u Recursive).
;; ;; M-g a		Run AG grep on current directory.
;; ;; M-g g		Run git-grep on current directory.
;; ;; M-g i		Run gid (id-utils).
;; ;; M-.		Run Etags (C-u use thing-at-point `C-u C-u' reload cache)
;; ;; M-%		Query replace on marked files.
;; ;; M-C		Copy File (C-u Follow).
;; ;; C-]		Toggle basename/fullpath.
;; ;; C-c C-y		Yank current selection into pattern.

(after! company
  (map! :map company-active-map
        "C-o" nil
        "C-h" nil
        "M-h" #'company-show-doc-buffer))

(after! org
  (map! :map org-mode-map
        "S-M-RET" #'+org/insert-item-above
        "C-," nil
        "C-o u" #'my/org-uncheck-all-subtree))
