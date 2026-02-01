import { type Context } from "idaten";

export async function hooks(ctx: Context) {
  const { denops } = ctx;

  const globalJson = await denops.call("json_encode", {
    ui: "ff",
    profile: false,
    sourceOptions: {
      _: {
        matchers: ["matcher_kensaku"],
      },
      file_old: {
        matchers: ["matcher_substring", "matcher_relative", "matcher_hidden"],
      },
      file_external: {
        matchers: ["matcher_substring", "matcher_hidden"],
      },
      help: {
        defaultAction: "open",
      },
    },
    sourceParams: {
      file_external: {
        cmd: [
          "rg",
          "--ignore-case",
          "--files",
          "--glob",
          "!.git",
          "--color",
          "never",
          "--no-messages",
        ],
        updateItems: 50000,
      },
      buffer: {
        orderby: "desc",
      },
      rg: {
        args: ["--json"],
        inputType: "migemo",
        highlights: {
          path: "Blue",
          lineNr: "Green",
          word: "Orange",
        },
      },
    },
    kindOptions: {
      file: {
        defaultAction: "open",
      },
    },
    uiParams: {
      ff: {
        filterSplitDirection: "floating",
      },
    },
    filterParams: {
      matcher_kensaku: {
        highlightMatched: "Orange",
      },
    },
  }) as string;
  const globalJsonEscaped = globalJson
    .replace(/\\/g, "\\\\")
    .replace(/"/g, '\\"');

  const localJson = await denops.call("json_encode", {
    uiParams: {
      ff: {
        split: "floating",
        winCol: "&columns / 20",
        winWidth: "(&columns / 10) * 9",
        prompt: "> ",
      },
    },
  }) as string;
  const localJsonEscaped = localJson
    .replace(/\\/g, "\\\\")
    .replace(/"/g, '\\"');

  const hook_add = [
    `let g:ddu_custom_global = json_decode("${globalJsonEscaped}")`,
    `let g:ddu_custom_local = json_decode("${localJsonEscaped}")`,
    "let g:ddu_custom_local.uiParams.ff.winCol = &columns / 20",
    "let g:ddu_custom_local.uiParams.ff.winWidth = (&columns / 10) * 9",
    "let g:ddu_custom_local.uiParams.ff.split = has(\"nvim\") ? \"floating\" : \"horizontal\"",
    "autocmd User DenopsPluginPost:ddu ++once call ddu#custom#patch_global(g:ddu_custom_global)",
    "autocmd User DenopsPluginPost:ddu ++once call ddu#custom#patch_local(\"default\", g:ddu_custom_local)",
  ].join(" | ");

  return {
    hook_add,
  };
}
