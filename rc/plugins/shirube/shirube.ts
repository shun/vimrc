import type { Context } from "idaten";

const config = {
  confirm_ui_mode: "float",
  meta: {
      "size": false,
      "permissions": false,
  },
  keymaps: {
    "<CR>": "open_cursor",
    "-": "open_parent",
    "q": "close",
    "<C-r>": "reload",
  },
  keymaps_global: {
    "-": "open_shirube",
  },
  sort: {
    group: "directories-first",
  },
  open_on_startup: true,
  log_file: "/tmp/nvim/shirube.jsonl",
} as const;

export async function hooks(ctx: Context) {
  const expr = await ctx.denops.call("string", config) as string;
  return {
    hook_add: `let g:shirube = ${expr}`,
  };
}
