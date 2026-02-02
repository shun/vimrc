import { type Context, type Plugin, ensure } from "idaten";

export async function configure(ctx: Context): Promise<Plugin[]> {
  const configPath = await ctx.denops.eval("g:idaten_config") as string;
  const rcDir = await ctx.denops.call(
    "fnamemodify",
    configPath,
    ":h:h",
  ) as string;
  return [
    ensure("https://github.com/vim-denops/denops.vim.git"),
    ensure("~/ghq/github.com/shun/shirube.vim", {
    //ensure("https://github.com/shun/shirube.vim", {
      hookFile: `${rcDir}/shirube/shirube.ts`,
    }),
    ensure("~/ghq/github.com/shun/ichimatsu.vim", {
      hookFile: `${rcDir}/ichimatsu/ichimatsu.ts`,
    }),
    ensure("https://github.com/itchyny/lightline.vim.git"),
    ensure("https://github.com/itchyny/vim-gitbranch.git"),
    // {{{ ddu
    ensure("https://github.com/Shougo/ddu.vim", {
      hookFile: `${rcDir}/ddu/ddu.ts`,
    }),
    ensure("https://github.com/Shougo/ddu-commands.vim"),
    ensure("https://github.com/Shougo/ddu-ui-ff"),
    ensure("https://github.com/Shougo/ddu-kind-file"),
    ensure("https://github.com/Shougo/ddu-filter-matcher_substring"),
    ensure("https://github.com/Shougo/ddu-source-file_old"),
    ensure("https://github.com/Shougo/ddu-filter-matcher_relative"),
    ensure("https://github.com/Shougo/ddu-filter-matcher_hidden"),
    ensure("https://github.com/matsui54/ddu-source-file_external"),
    ensure("https://github.com/Shougo/ddu-source-line"),
    ensure("https://github.com/matsui54/ddu-source-highlight"),
    ensure("https://github.com/Milly/ddu-filter-kensaku"),
    ensure("https://github.com/matsui54/ddu-source-help"),
    ensure("https://github.com/shun/ddu-source-buffer"),
    ensure("https://github.com/shun/ddu-source-rg"),
    // }}}
  ];
}
