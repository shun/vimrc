import { type Context, type Plugin, ensure } from "idaten";

export async function configure(_ctx: Context): Promise<Plugin[]> {
  return [
    ensure("https://github.com/vim-denops/denops.vim.git"),
    ensure("https://github.com/shun/shirube.vim", {
    //ensure("~/ghq/github.com/shun/shirube.vim", {
      hookAdd: "~/.config/nvim/rc/plugins/shirube/shirube.ts",
    }),
    ensure("~/ghq/github.com/shun/ichimatsu.vim", {
      hookAdd: "~/.config/nvim/rc/plugins/ichimatsu/ichimatsu.ts",
    }),
    ensure("https://github.com/itchyny/lightline.vim.git"),
    ensure("https://github.com/itchyny/vim-gitbranch.git"),
  ];
}
