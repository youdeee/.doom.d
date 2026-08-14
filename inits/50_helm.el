;;; -*- lexical-binding: t; -*-
;; Helm は kill-ring 専用。:completion helm と helm-mode は使わない（Vertico を奪わない）。

(use-package! helm
  :defer t
  :commands helm-show-kill-ring)

(map! [remap yank-pop] #'helm-show-kill-ring)
