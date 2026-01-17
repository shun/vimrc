# 超高速起動構成（rc 明示読み込み）

この設定は自動読み込みディレクトリを使わず、`rc/` を明示的に `source` する構成です。
このリポジトリは vim/neovim のコンフィグです。設定を変更する場合は、必ず先にドキュメントを作成・修正してから設定を変更してください。

# Vimscript 前提（legacy）

`rc/` 配下の `.vim` は従来の Vimscript を使います。Vim/Neovim の両方で読み込めることを優先します。

# 読み込みタイミング

- 起動時: `init.vim` → `rc/vimrc`。
- 起動時: `rc/core/*.vim`（ファイル名順）。
- 起動時: `rc/plugins/*.vim`（ファイル名順）。
- `FileType` 発火時: `rc/ft/<filetype>.vim`（`rc/core/40-filetype.vim` が読み込み）。

# ディレクトリの役割

- `rc/core/`: 基本設定・キーマップ・autocmd。
- `rc/plugins/`: プラグイン管理と各プラグイン設定。
- `rc/ft/`: filetype ごとの設定。

# デフォルトプラグインの無効化

起動高速化のため、内蔵 runtime プラグインは `rc/core/05-disable-default-plugins.vim` で無効化します。
必要になったものは個別に無効化を外してください。

- 2html_plugin
- getscript / getscriptPlugin
- gzip
- logiPat
- man
- matchit / matchparen
- netrw / netrwFileHandlers / netrwPlugin / netrwSettings
- rrhelper
- shada_plugin
- spellfile_plugin
- tar / tarPlugin
- tutor_mode_plugin
- vimball / vimballPlugin
- zip / zipPlugin

# 標準 runtime の自動読み込み（参考）

この構成では以下の自動読み込みディレクトリを作成しないことで起動を最小化しています。
作成すると Vim/Neovim が自動で読み込みます。

- `plugin/`
- `after/plugin/`
- `ftdetect/`
- `ftplugin/`
- `after/ftplugin/`
- `indent/`
- `after/indent/`
- `syntax/`
- `after/syntax/`
- `pack/*/start/*`
- `pack/*/opt/*`
