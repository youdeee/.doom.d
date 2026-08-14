# Task Plan: Doom Emacs 設定要約 + inits リファクタ

## Goal
Doom 設定を `load!` / `use-package!` / `after!` / `map!` に寄せ、レガシー inits をアーカイブし、非推奨 API を更新する。

## Current Phase
Phase 10 (complete)

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

## Key Questions
1. コメントのみの inits はどうする？ → 1 ファイルにアーカイブし load! しない
2. M-t の二重定義は？ → insert-timestamp のみ残す

## Decisions Made
- 設定の意味は維持し、読み方だけを Doom 標準へ寄せる
- smartrep は map! にしない（連続入力のため :demand t）
- anzu は isearch-mode hook で初回検索時にロード
- undo-tree-history-directory-alist は未使用のため削除

## Errors Encountered
- なし

## Notes
- 完了後は `doom sync` のあと `M-x doom/reload`
