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

(map! :g "C-z" nil)
(map! :map override
      "C-t"     #'move-window
      "C-M-t"   #'move-window-opposite
      "C-M-k"   #'kill-all-line-forward
      "C-a"     #'goto-line-beginning-or-indent
      "C-e"     #'end-of-line
      ;; s-w押すときに間違って押してc-x c-cで強制終了することがあるのでとりあえず割り当ててる。割り当てたいコマンドできたら何かに当てたい
      "s-q"     #'window-resizer
      "M-t"     #'insert-timestamp
      "s-p"     #'add-file-name-to-kill-ring ; C-c f n（basename）/ C-c f y
      "C-h"     #'delete-backward-char
      "C-x k"   #'kill-current-buffer
      "C-S-v"   #'scroll-down-command
      "C-M-i"   #'delete-indentation
      ;; "C-o C-t" (cmd! (insert "\t")) ; C-. と重複
      "C-."     (cmd! (insert "\t"))
      "C-<tab>" #'switch-to-next-buffer
      "C-S-<tab>" #'switch-to-prev-buffer
      "s-<right>" #'+workspace/switch-right
      "s-<left>"  #'+workspace/switch-left
      "s-v"     #'describe-variable
      "C-?"     #'undo-fu-only-redo
      "M-r"     #'downcase-word
      "M-l"     #'move-to-window-line-top-bottom
      ;; "C-x f"   #'helm-mini ;; '+helm/workspace-mini) なんかemacs2つにしてから死ぬ。。。 ; C-x b
      "C-x f"   #'consult-buffer
      "M-o"     #'consult-line
      "M-O"     (cmd!! #'consult-line-multi 'all-buffers)
      "C-;"     #'avy-goto-word-1 ; avy は C-c j j
      "C-:"     #'avy-goto-line ; imenu。avy は C-c j l
      "C-z"     #'ace-window
      "C-x C-z" #'open-dropbox-junk ; C-c n j
      "M-/"     #'hippie-expand)

(map! "s-,"   #'toggle-frame-maximized
      "C-,"   #'kill-line-backward
      "C-M-," #'kill-all-line-backward
      "M-m"   #'start-and-end-macro
      "s-k"   #'kill-*-buffer
      ;;(bind-key "C-x a k" 'kill-all-buffer)
      "s-z"   #'split-window-3
      "s-w"   #'window-resizer
      "s-s"   #'save-buffer
      "C-M-;" #'copy-region-and-comment-out
      "M-h"   #'backward-kill-word
      "C-x t" #'other-frame
      "s-f"   #'toggle-truncate-lines
      "s-g"   #'display-fill-column-indicator-mode ; C-c t c
      "C-x m" #'kmacro-end-and-call-macro
      "C-x C-n" #'toggle-display-line-numbers ; C-c t l
      "M-q"   #'quoted-insert
      "M-k"   #'kill-whole-line
      "C-x C-t" #'transpose-lines
      "s-e"   #'eval-buffer
      "M-p"   #'backward-paragraph
      "M-n"   #'forward-paragraph
      "C-j"   #'smart-newline
      "C-M-j" #'+default/newline
      "M-w"   #'easy-kill
      "C-x 1" #'zoom-window-zoom
      "C-x b" #'my/consult-ripgrep-junk
      ;; M-y は [remap yank-pop] (inits/50_helm.el) で helm-show-kill-ring
      )

;; C-o の既存割り当てを解除し、Prefix キーとして定義
(map! :leader
      :desc "My custom prefix" "o" nil) ; ※もし leader キー経由で使う予定がない場合は不要

(map! :g "C-o" nil)

(map! :prefix "C-o"
      :desc "Search Cwd"       "a" #'+default/search-cwd
      :desc "Search Project"       "C-a" #'+default/search-project
      :desc "Search File"       "f" #'projectile-find-file
      :desc "Anzu"   "r" #'anzu-query-replace-regexp
      :desc "Anzu at Cursor"   "C-r" #'anzu-query-replace-at-cursor-thing
      :desc "Indent and Clear Buffer" "=" #'indent-and-clean-buffer
      :desc "Torihiki Purchase"   "C-q" #'extract-purchase-amount-from-torihiki
      :desc "Torihiki Profit"   "C-w" #'extract-profit-from-torihiki
      :desc "Torihiki Data"   "C-e" #'extract-torihiki-data)


;; Doom 非 Evil の C-c リーダーへ、既存ツリーを壊さず不足分だけ足す
;; プロジェクト検索は C-c s p / カレントは C-c s d。結果を編集するときは minibuffer で C-c C-e → C-c C-c
(map! :leader
      :desc "Dropbox junk file"      "n j" #'open-dropbox-junk
      :desc "0sec memo"              "n m" #'open-0sec-memo
      :desc "Book memo"              "n b" #'start-book-memo
      :desc "Search junk dir"        "s j" #'my/consult-ripgrep-junk
      :desc "Uncheck subtree"        "n u" #'my/org-uncheck-all-subtree
      :desc "Denote: new note"       "n d n" #'denote
      :desc "Denote: link"           "n d l" #'denote-link
      :desc "Denote: find"           "n d f" #'consult-denote-find
      :desc "Denote: grep"           "n d g" #'consult-denote-grep
      :desc "Anzu replace at point"  "s r" #'anzu-query-replace-at-cursor-thing
      :desc "Highlight symbol"       "h h" #'highlight-symbol-at-point
      :desc "Unhighlight"            "h u" #'unhighlight-regexp
      :desc "Avy word"               "j j" #'avy-goto-word-1
      :desc "Avy line"               "j l" #'avy-goto-line
      :desc "Avy char"               "j c" #'avy-goto-char-timer
      :desc "Avy line below"         "j n" #'avy-goto-line-below
      :desc "Avy line above"         "j p" #'avy-goto-line-above
      :desc "Indent and clean"       "c =" #'indent-and-clean-buffer
      :desc "Yank file basename"     "f n" #'add-file-name-to-kill-ring
      :desc "Purchase amount"        "x q" #'extract-purchase-amount-from-torihiki
      :desc "Profit"                 "x w" #'extract-profit-from-torihiki
      :desc "Torihiki TSV"           "x e" #'extract-torihiki-data)

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
  ;; 1. C-\ の既存割り当て（toggle-input-method 等）を解放
  (global-unset-key (kbd "C-\\"))

  ;; 2. C-\ をプレフィックスキーとして smartrep を定義
  (smartrep-define-key global-map "C-\\"
    '(("C-\\" . mc/mark-next-like-this)
      ("n"    . mc/mark-next-like-this)
      ("p"    . mc/unmark-next-like-this)
      ("P"    . mc/mark-previous-like-this)
      ("N"    . mc/unmark-previous-like-this)
      ("s"    . mc/skip-to-next-like-this)
      ("S"    . mc/skip-to-previous-like-this)
      ("m"    . mc/mark-more-like-this-extended)
      ("*"    . mc/mark-all-like-this)
      ("d"    . mc/mark-all-like-this-dwim)
      ("i"    . mc/insert-numbers)
      ("o"    . mc/sort-regions)
      ("O"    . mc/reverse-regions))))
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
;; :editor fold (C-c C-f C-f) に移行
;; (after! web-mode
;;   (map! :map web-mode-map
;;         "C-o C-f" #'web-mode-fold-or-unfold))
;; ;; (bind-keys :map ac-completing-map
;; ;;            ("M-/" . ac-stop))
;; ;; (bind-keys :map emacs-lisp-mode-map
;; ;;            ("C-c C-d" . lispxmp))
;; ;; (ac-set-trigger-key "<backtab>")
;; ;; (bind-keys :map isearch-mode-map
;; ;;            ("C-;" . avy-migemo-isearch))


;; C-j は smart-newline に取られているため emmet 側から外す。展開は s-j へ。
(after! emmet-mode
  (map! :map emmet-mode-keymap
        "C-j"   nil
        "TAB"   nil
        "<tab>" nil
        "s-j"   #'emmet-expand-line))

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

;; (after! company
;;   (map! :map company-active-map
;;         "C-h" nil
;;         "M-h" #'company-show-doc-buffer))

(after! corfu
  (map! :map corfu-map
        "C-h" nil))
;; C-; は override の avy-goto-word-1（46 行目）を維持。補完は TAB / M-/ で足りる。

(after! org
  (map! :map org-mode-map
        "S-M-RET" #'+org/insert-item-above
        "C-," nil
        ;; "C-o u" #'my/org-uncheck-all-subtree ; C-c n u
        ))

;; 1. Vertico でのページ移動キーバインド & 2. ディレクトリ移動設定
;; 検索プレビューは C-j。file 補完だけ従来どおりディレクトリ進入
;; (after! consult
;;   (consult-customize
;;    consult-ripgrep consult-git-grep consult-grep
;;    consult-bookmark consult-recent-file
;;    consult--source-recent-file consult--source-project-recent-file
;;    consult--source-bookmark
;;    +default/search-project +default/search-other-project
;;    +default/search-project-for-symbol-at-point
;;    +default/search-cwd +default/search-other-cwd
;;    +default/search-emacsd
;;    :preview-key "C-j"))

(after! consult
  (consult-customize
   consult-ripgrep consult-git-grep consult-grep
   +default/search-project +default/search-other-project
   +default/search-project-for-symbol-at-point
   +default/search-cwd +default/search-other-cwd
   +default/search-emacsd
   my/consult-ripgrep-junk
   :preview-key '(:debounce 0.2 any)))

(after! vertico
  (define-key vertico-map (kbd "C-v") #'vertico-scroll-up)
  (define-key vertico-map (kbd "M-v") #'vertico-scroll-down)

  ;; vertico-directory の読み込み (バックスペースで親ディレクトリへ)
  (require 'vertico-directory)
  (define-key vertico-map (kbd "C-l") #'vertico-directory-delete-char)
  (define-key vertico-map (kbd "C-j")
    (cmd! (when (eq 'file (vertico--metadata-get 'category))
            (call-interactively #'vertico-directory-enter)))))

(after! corfu
  (define-key corfu-map (kbd "C-m") #'corfu-insert)
  (define-key corfu-map (kbd "C-v") #'corfu-scroll-up)
  (define-key corfu-map (kbd "M-v") #'corfu-scroll-down)

  ;; 最初の候補 / 最後の候補へ一気にジャンプする（M-< / M->）
  (define-key corfu-map (kbd "M-<") #'corfu-first)
  (define-key corfu-map (kbd "M->") #'corfu-last))
