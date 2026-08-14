# Task Plan: Doom Emacs 設定要約 + inits リファクタ

## Goal
Helm を Vertico に、Eglot LSP を主言語へ入れ、重複キーはコメントアウトして C-c リーダーに集約する。

## Current Phase
Phase 23 (complete)

## Phases

### Phase 1–5: 設定要約
- [x] 完了（findings.md に記録済み）
- **Status:** complete

### Phase 6: Archive legacy inits
- [x] コメントのみのファイルを `inits/legacy-archive.el` に統合
- [x] 元ファイルを削除
- [x] `90_local.el` を `99_local.el` に統合
- **Status:** complete

### Phase 7: load! 経路
- [x] `config.el` から init-loader を除去し `load!` に切替
- [x] `org-directory` を config.el へ移動
- [x] `packages.el` から init-loader / bind-key を除去、rainbow-mode を追加
- **Status:** complete

### Phase 8: after! / use-package!
- [x] 実働 inits の require / パッケージ setq を遅延ロード化
- **Status:** complete

### Phase 9: 非推奨 API
- [x] linum-mode / goto-line / dumb-jump-mode / custom-set-faces / define-key を更新
- **Status:** complete

### Phase 10: map! 統一
- [x] `89_global-keys.el` を Non-Evil の map! に統一（smartrep は存置）
- [x] bind-key* は `:map override`
- **Status:** complete

### Phase 11: Vertico / LSP モジュール
- [x] Helm → Vertico+icons、lsp+eglot、tree-sitter、format、editorconfig、fold、hl-todo、yaml
- [x] 言語に +lsp +tree-sitter。php/python/rust/swift/erlang/vi-tilde-fringe を無効化
- **Status:** complete

### Phase 12: packages.el
- [x] helm-* / yaml-mode / hl-todo / origami / rainbow-mode をコメントアウト
- **Status:** complete

### Phase 13: config / inits
- [x] eglot/tide 停止をコメントアウト、50_helm の load を停止、70_lsp 追加
- **Status:** complete

### Phase 14: キー集約
- [x] 重複キーはコメントアウトで残し、C-c リーダーへ不足分を追加
- **Status:** complete

### Phase 15: リファクタ
- [x] :prefix による C-c n/s 上書きを避け、キー列で追加
- **Status:** complete

### Phase 16: 反映手順の提示
- [x] doom sync / 再起動手順をユーザーへ伝える
- **Status:** complete

### Phase 17: 旧キー機能の補完
- [x] Helm 短キー（M-o / M-O / C-x f）を Consult に割り当て
- [x] 検索結果編集（C-c C-e wgrep）をコメントで明示
- [x] avy 上下行、hi-lock、indent-and-clean、basename yank を C-c に追加
- [x] s-i fold と s-left/right workspace を復活
- **Status:** complete

### Phase 18: Corfu と window-select の試用
- [x] company → (corfu +icons +orderless +dabbrev)
- [x] window-select（ace-window）。switch-window はコメントアウト
- [x] C-: ace-window、C-; completion-at-point、corfu-map の C-h をバックスペースに
- **Status:** complete

### Phase 20: helm-show-kill-ring のみ復活
- [x] `(package! helm)`。`:completion helm` と `helm-mode` は使わない
- [x] `M-y` を `helm-show-kill-ring` に remap。swoop / ws-butler は戻さない
- **Status:** complete

### Phase 21: Corfu で LSP と yasnippet を同時表示
- [x] eglot バッファで `cape-wrap-super` により eglot + yasnippet-capf をマージ
- **Status:** complete

### Phase 22: Corfu をやめて Company に戻す
- [x] `init.el` で company を有効、corfu をコメントアウト
- [x] eglot の yasnippet-capf マージを削除
- [x] company-active-map の C-h / M-h を復活。Corfu の C-; は削除
- **Status:** complete

### Phase 23: Corfu 設定を戻す
- [x] `init.el` で corfu を有効、company をコメントアウト
- [x] eglot + yasnippet-capf マージと Corfu キーを復活
- **Status:** complete

## Key Questions
1. コメントのみの inits はどうする？ → 1 ファイルにアーカイブし load! しない
2. M-t の二重定義は？ → insert-timestamp のみ残す
3. 重複キーは消す？ → コメントアウトで残す

## Decisions Made
- 設定の意味は維持し、読み方だけを Doom 標準へ寄せる
- smartrep は map! にしない（連続入力のため :demand t）
- anzu は isearch-mode hook で初回検索時にロード
- undo-tree-history-directory-alist は未使用のため削除
- Helm → Vertico。C-o 個人プレフィックスは廃止し C-c に一本化
- 無効化キーは削除せずコメントアウト（置き換え先を併記）
- :prefix ブロックは使わず "n j" 形式で既存 C-c マップに足す
- Helm 常用の短いキーは Consult 版として復活（M-o / M-O / C-x f）
- 検索結果編集は Vertico 既定の C-c C-e（wgrep）
- 補完は Corfu（Company は使わない）
- switch-window → ace-window（window-select）
- M-y だけ helm-show-kill-ring。helm-mode は付けない

## Errors Encountered
- なし

## Notes
- 完了後は `doom sync` のあと Emacs を完全再起動
