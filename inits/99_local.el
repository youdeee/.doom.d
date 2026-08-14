;;; -*- lexical-binding: t; -*-

(after! org
  (setq org-agenda-files (list org-directory)))

(after! helm-ag
  (setq helm-ag-use-agignore t))
