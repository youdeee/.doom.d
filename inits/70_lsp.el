;;; -*- lexical-binding: t; -*-

(defun my/eglot-yasnippet-capf ()
  "Merge Eglot and Yasnippet so both appear in one Corfu popup."
  (cape-wrap-super #'eglot-completion-at-point #'yasnippet-capf))

(defun my/eglot-setup-yasnippet-capf ()
  "Prefer a merged Eglot+Yasnippet CAPF in Eglot-managed buffers."
  (when (bound-and-true-p eglot-managed-mode)
    (require 'cape)
    (require 'yasnippet-capf)
    (setq-local completion-at-point-functions
                (cons #'my/eglot-yasnippet-capf
                      (seq-difference completion-at-point-functions
                                      '(eglot-completion-at-point
                                        yasnippet-capf
                                        my/eglot-yasnippet-capf))))))

(after! eglot
  (setq eglot-autoshutdown t
        eglot-report-progress nil)
  (add-hook 'eglot-managed-mode-hook #'my/eglot-setup-yasnippet-capf 10))

(after! eglot
  (add-to-list 'eglot-server-programs
               '((elixir-mode heex-mode elixir-ts-mode) . ("~/workspace/elixir-ls-v0.29.2/language_server.sh"))))
