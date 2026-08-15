;;; -*- lexical-binding: t; -*-
;; Helm は kill-ring 専用。:completion helm と helm-mode は使わない（Vertico を奪わない）。

(use-package! helm
  :defer t
  :commands helm-show-kill-ring)

(map! [remap yank-pop] #'helm-show-kill-ring)

;; cua-mode（00_settings.el で有効）が [remap yank-pop] を cua-paste-pop に
;; 奪っており、emulation-mode-map-alists 上で上の remap より先に評価されるため
;; M-y が届かない。CUA 側のその remap だけを外して降ろす。
(defun my/cua-unclaim-yank-pop-h ()
  "cua-mode の [remap yank-pop] (cua-paste-pop) をこの1つだけ外す。
起動直後は cua-mode のキーマップがまだ構築途中で `after! cua-base' 直後の
ミューテートが後で上書きされるため、起動が完全に落ち着く doom-after-init-hook
で当てる。"
  (let ((keymap (cdr (assq 'cua-mode cua--keymap-alist))))
    (when (keymapp keymap)
      (define-key keymap [remap yank-pop] nil))))

(add-hook 'doom-after-init-hook #'my/cua-unclaim-yank-pop-h 95)
