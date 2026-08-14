;;; -*- lexical-binding: t; -*-

(use-package! anzu
  :hook (isearch-mode . global-anzu-mode)
  :config
  (setq anzu-minimum-input-length 2
        anzu-deactivate-region t
        anzu-search-threshold 500))

(setq query-replace-skip-read-only t)
