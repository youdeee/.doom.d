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

(defun timestamp ()
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M")))

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
  (goto-line 10)
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
