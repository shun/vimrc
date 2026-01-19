import type { Context } from "idaten";

const config = {
  redraw_debounce: 50,
  redraw_threshold: 5,
  log_file: '/tmp/ichimatsu/ichimatsu.jsonl',
} as const;

export async function hooks(ctx: Context) {
  const expr = await ctx.denops.call("string", config) as string;
  return {
    hook_add: `let g:ichimatsu_config = ${expr}`,
  };
}
