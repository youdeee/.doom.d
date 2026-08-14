;;; -*- lexical-binding: t; -*-

(after! helm
  (setq helm-move-to-line-cycle-in-source nil
        helm-M-x-fuzzy-match nil
        helm-ff-fuzzy-matching t))

(remove-hook 'doom-first-buffer-hook #'ws-butler-global-mode)

(use-package! helm-swoop
  :defer t
  :config
  (setq helm-swoop-split-window-function
        (lambda (buf &rest _args)
          (display-buffer
           buf
           '((display-buffer-reuse-window
              display-buffer-at-bottom)
             (window-height . 30))))))
