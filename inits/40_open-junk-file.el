;;; -*- lexical-binding: t; -*-

(use-package! open-junk-file
  :commands (open-junk-file)
  :config
  (setq open-junk-file-find-file-function #'find-file))

(defun open-dropbox-junk ()
  (interactive)
  (setq open-junk-file-format "~/Dropbox/junk/%Y/%m/%Y-%m-%d-%H%M%S.")
  (open-junk-file))

(defun open-0sec-memo ()
  (interactive)
  (setq open-junk-file-format "~/Dropbox/junk/0sec/%Y/%m/%d/%Y-%m-%d-%H%M%S.md")
  (open-junk-file))
