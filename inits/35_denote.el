;;; -*- lexical-binding: t; -*-
;; denote は open-junk-file 運用と並置。~/Dropbox/junk/notes/ 配下のみ管理する。

(use-package! denote
  :commands (denote denote-link)
  :config
  (setq denote-directory (expand-file-name "~/Dropbox/junk/notes/")
        denote-file-type 'org
        denote-known-keywords '("work" "idea" "book" "log")))

(use-package! consult-denote
  :commands (consult-denote-find consult-denote-grep))
