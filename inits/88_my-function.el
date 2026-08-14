;;; -*- lexical-binding: t; -*-

(defun goto-line-beginning-or-indent (&optional $position)
  (interactive)
  (or $position (setq $position (point)))
  (let (($starting-position (progn (back-to-indentation) (point))))
    (if (eq $starting-position $position)
        (move-beginning-of-line 1))))

(defun full-screen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized))

(defun move-window ()
  (interactive)
  (make-window-when-unsplit 1)
  )

(defun move-window-opposite ()
  (interactive)
  (make-window-when-unsplit -1)
  )

(defun make-window-when-unsplit (n)
  (when (one-window-p)
    (split-window-right))
  (other-window n))

(defun kill-line-backward (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(defun kill-all-line-forward (arg)
  (interactive "p")
  (save-excursion
    (forward-page)
    (setq end-number (point)))
  (kill-line (- (- end-number (line-number-at-pos)) arg)))

(defun kill-all-line-backward (arg)
  (interactive "p")
  (kill-line (- (* -1 (line-number-at-pos)) arg)))

(defun start-and-end-macro (arg)
  (interactive "p")
  (if (or defining-kbd-macro executing-kbd-macro)
      (kmacro-end-macro arg)
    (kmacro-start-macro arg)))

(defun kill-*-buffer ()
  (interactive)
  (dolist (buf (buffer-list))
    (if (string-match "\\`\\*\\(.\\|\n\\)+\\*\\'" (buffer-name buf))
        (if (not (string= (buffer-name buf) "*scratch*"))
            (kill-buffer (buffer-name buf))))))

(defun kill-all-buffer ()
  (interactive)
  (dolist (buf (buffer-list))
    (if (not
         (or
          (string= (buffer-name buf) (buffer-name (current-buffer)))
          (string= (buffer-name buf) "*scratch*")))
        (kill-buffer (buffer-name buf)))))

(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))

(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))

(defun add-file-name-to-kill-ring (arg)
  (interactive "p")
  (if (equal arg 4)
      (kill-new buffer-file-name)
    (kill-new (file-name-nondirectory buffer-file-name))))

(defun add-file-name-to-kill-ring-and-yank (arg)
  (interactive "p")
  (add-file-name-to-kill-ring arg)
  (yank))

(defun insert-file-name (arg)
  (interactive "p")
  (if (equal arg 4)
      (insert buffer-file-name)
    (insert (file-name-nondirectory buffer-file-name))))

(defun split-window-3 ()
  (interactive)
  (split-window-horizontally-n 3))

(defun custom-transpose-char ()
  (interactive)
  (let ((tmp-char (char-to-string (following-char))))
    (save-excursion
      (forward-char 2)
      (insert tmp-char)
      (forward-char -3)
      (delete-char 1))))

(defun replace-backward-from-kill-ring ()
  (interactive)
  (kill-line-backward 1)
  (insert (cadr kill-ring)))

(defun replace-forward-from-kill-ring ()
  (interactive)
  (kill-line)
  (insert (cadr kill-ring)))

(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))

(defun save-buffer-without-hook ()
  (interactive)
  (setq exec-hook nil)
  (save-buffer)
  (setq exec-hook t))

(defun start-book-memo (title)
  (interactive "sInput book title: ")
  (let* ((file (concat "~/Dropbox/junk/book/" (format-time-string "%Y-%m-%d-%H%M_") title ".org"))
         (contents (concat "#+TITLE: " title "

* Stats
開始 " (format-time-string "%Y/%m/%d %H:%M") "
終了 
消費P 
著者 
** Reviewed
- 

* なぜこの本を読もうと思いましたか？
- 

* 要約
** 140字

** キーワード
- 
** その他
- 

* 感想
** 140字

** その他
- 

* アクションプラン
** 

* Survey/Question/Respond
** 

* Record
- 
")))
    (write-region contents nil file)
    (find-file file))
  (outline-show-all)
  (goto-char (point-min))
  (forward-line 9)
  (end-of-line))

(defun indent-and-clean-buffer ()
  (interactive)
  (save-excursion
    (progn
      (indent-region (point-min) (point-max)))
    (whitespace-cleanup))
  (save-excursion
    (goto-char (point-max))
    (delete-blank-lines)))

(defun copy-region-and-comment-out (beg end &optional region)
  "Save the region as if killed, but don't kill it.
In Transient Mark mode, deactivate the mark.
If `interprogram-cut-function' is non-nil, also save the text for a window
system cut and paste.

The copied text is filtered by `filter-buffer-substring' before it is
saved in the kill ring, so the actual saved text might be different
from what was in the buffer.

When called from Lisp, save in the kill ring the stretch of text
between BEG and END, unless the optional argument REGION is
non-nil, in which case ignore BEG and END, and save the current
region instead.

This command's old key binding has been given to `kill-ring-save'."
  ;; Pass mark first, then point, because the order matters when
  ;; calling `kill-append'.
  (interactive (list (mark) (point) 'region))
  (let ((str (if region
                 (funcall region-extract-function nil)
               (filter-buffer-substring beg end))))
    (if (eq last-command 'kill-region)
        (kill-append str (< end beg))
      (kill-new str)))
  (comment-or-uncomment-region beg end region)
  (setq deactivate-mark t)
  nil)

(defun insert-timestamp (arg)
  (interactive "p")
  (if (equal arg 4)
      (insert (format-time-string "%H:%M "))
    (insert (format-time-string "%Y/%m/%d %H:%M "))))

(defun extract-second-and-third-numbers (line)
  "与えられた行から2番目と3番目の数字を抽出する。"
  (let* ((words (split-string line " "))
         (second-number (nth 1 words))
         (third-number (nth 2 words)))
    (when (and second-number third-number)
      (list (list (string-to-number second-number) (string-to-number third-number))))))

(defun extract-purchase-amount-from-torihiki (beg end)
  "選択範囲内の各行について、4番目の要素を株数、5番目の要素を株価として扱い、合計株数と購入総額を表示する。
スペース1個で分割し、必要な要素がある行だけを処理します。"
  (interactive "r")
  (let* ((text (buffer-substring-no-properties beg end))
         (lines (split-string text "\n" t))
         (total-volume 0)
         (total-value 0))
    (dolist (line lines)
      ;; スペース1個で正確に区切る
      (let ((fields (split-string line " ")))
        (when (>= (length fields) 5)
          (let ((volume (nth 3 fields))
                (price  (nth 4 fields)))
            (when (and (string-match-p "^[0-9]+$" volume)
                       (string-match-p "^[0-9\.]+$" price))
              (setq total-volume (+ total-volume (string-to-number volume)))
              (setq total-value (+ total-value (* (string-to-number volume)
                                                  (string-to-number price)))))))))
    (message "購入総額: %d 円 / 合計株数: %d 株" total-value total-volume)
    (kill-new (format "%d\t%d" total-value total-volume))))

(defun extract-profit-from-torihiki (beg end)
  "選択されたテキストから、各行の6番目（スペース1個で区切った場合）の数値を合計する。
スペース2つ以上の部分は無視する（値がないとみなす）。"
  (interactive "r")
  (let* ((text (buffer-substring-no-properties beg end))
         (lines (split-string text "\n" t))
         (sum 0))
    (dolist (line lines)
      ;; スペース1個だけで区切る（2個以上の空白は値なしとみなすためスキップされる）
      (let ((fields (split-string line " ")))
        ;; 要素が6個以上あれば、6番目を取り出す
        (when (>= (length fields) 6)
          (let ((value (nth 5 fields)))
            (when (string-match-p "^-?[0-9]+$" value)  ; 数値だけを対象
              (setq sum (+ sum (string-to-number value))))))))
    (message "合計: %d" sum)
    (kill-new (format "%d" sum))))

(defun extract-torihiki-data (beg end)
  "選択範囲のテキストを2行ずつ処理して、TSV形式に整形し、kill-ringにコピーする。"
  (interactive "r")
  (let* ((input (buffer-substring-no-properties beg end))
         (lines (split-string input "\n" t))
         (result-lines '()))
    (while lines
      (let* ((line1 (split-string (pop lines) " " t))
             (line2 (split-string (pop lines) " " t))
             (name (nth 0 line1))
             (side (replace-regexp-in-string "新" "" (nth 1 line1)))
             (price1 (or (nth 5 line1) ""))
             (price2 (or (nth 6 line2) ""))
             (low (nth 4 line1))
             (high (nth 4 line2))
             (pl (nth 5 line2))
             (amount (number-to-string (* (string-to-number (nth 3 line1))
                                          (string-to-number (nth 4 line1)))))
             (volume (nth 3 line1))
             (start-time (replace-regexp-in-string ":" "" (substring (nth 2 line1) 0 5)))
             (end-time (replace-regexp-in-string ":" "" (substring (nth 2 line2) 0 5)))
             (duration (let ((t1 (parse-time-string (substring (nth 2 line1) 0 5)))
                             (t2 (parse-time-string (substring (nth 2 line2) 0 5))))
                         (- (+ (* 60 (nth 2 t2)) (nth 1 t2))
                            (+ (* 60 (nth 2 t1)) (nth 1 t1)))))
             (fields (list side name price1 price2 low high pl amount volume start-time end-time (number-to-string duration)))
             (tsv (string-join fields "\t")))
        (push tsv result-lines)))
    (let ((final-output (string-join (nreverse result-lines) "\n")))
      (kill-new final-output)
      (message "%s" final-output))))

;;; --- checkbox reset function ---
(defun my/org-uncheck-all-subtree ()
  (interactive)
  (save-excursion
    (let ((beg (if (org-before-first-heading-p)
                   (point-min)
                 (progn (org-back-to-heading t) (point))))
          (end (if (org-before-first-heading-p)
                   (point-max)
                 (org-end-of-subtree t t))))
      (goto-char beg)
      (while (re-search-forward "\\[[X-]\\]" end t)
        (replace-match "[ ]" t t)))))

(defun toggle-display-line-numbers ()
  "Toggle absolute line numbers, ignoring `display-line-numbers-type'."
  (interactive)
  (setq display-line-numbers (if display-line-numbers nil t)))
