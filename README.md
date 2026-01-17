# nvim 設定

## プラグイン管理（idaten）

- ローカル版を使う場合は `g:idaten_repo_path` を設定し、そのパスを runtimepath に追加して使用する（`rc/plugins/00-manager.vim` のコメントを外す）。
- `g:idaten_repo_path` が有効な場合は idaten が `IDATEN_DEV=1` を自動設定し、TypeScript 側もローカルの idaten を使う。
- 未設定時は `g:idaten_dir` 配下の `repos/github.com/shun/idaten.vim` を使う。
- 上記が無い場合は `g:idaten_repo_url` から自動 clone（`g:idaten_auto_clone = v:false` で無効化）。
- TypeScript 設定は `rc/plugins/idaten/idaten.ts` に置き、`g:idaten_config` で指定する。
- `idaten.ts` の `repo` は https/ssh/git の URL、またはローカルパス（`file://`/`~`/相対）を使う。
- 初回は `:Idaten sync` で `state.vim` を生成する。
- 設定は `rc/plugins/00-manager.vim` にまとめる。

### 主要設定

- `g:idaten_config`: 設定ファイルのパス。
- `g:idaten_repo_path`: idaten のローカルパス（設定時は `IDATEN_DEV` を自動で有効化）。
- `g:idaten_repo_url`: clone 用 URL。
- `g:idaten_log_enabled`: ログ出力の有効化（既定は無効）。
- `g:idaten_log_path`: ログ出力先（既定は `/tmp/idaten`）。
- `g:idaten_log_*` は必要に応じて事前に上書きする。

## lightline

- idaten で `itchyny/lightline.vim` と `itchyny/vim-gitbranch` を管理する。
- 設定は `rc/plugins/20-lightline.vim` に配置する。
- lightline 用の配色は `autoload/lightline/colorscheme/tokyonight.vim` に定義する。

## Shirube

- 設定は `rc/plugins/shirube/shirube.ts` に集約する。
- `g:shirube` は hook_add で設定する。
- `hooks(ctx)` を使って `ctx.denops.call("string", config)` で Vimscript の辞書表現に変換している。

## ファイル自動再読み込み

- 外部更新を検知したら `FocusGained` / `BufEnter` で `checktime` を実行する。
- 設定は `rc/core/10-options.vim` と `rc/core/30-autocmds.vim` に配置する。

## 起動時間の表示

- `VimEnter` 直後に `timer_start()` で遅延表示する。
- 設定は `rc/core/90-startup-time.vim` に配置する。

## カラースキーム

- storm ベースの `tokyonight-storm` を同梱（`colors/tokyonight-storm.vim`）。
- Neovim の TreeSitter は最小限のリンクのみ定義（パフォーマンス重視）。
- 端末色は上書きしない。

### 使い方

```
:colorscheme tokyonight-storm
```

起動時に適用する場合は `rc/core/00-base.vim` などに追加する。
