import {
  BaseConfig,
  ConfigReturn,
  ContextBuilder,
  Dpp,
  Plugin,
} from "https://deno.land/x/dpp_vim@v0.0.7/types.ts";
import { Denops, fn } from "https://deno.land/x/dpp_vim@v0.0.7/deps.ts";

type TomlInfo = {
  path: string;
  lazy: boolean;
};

type Toml = {
  hooks_file?: string;
  ftplugins?: Record<string, string>;
  plugins?: Plugin[];
};

type LazyMakeStateResult = {
  plugins: Plugin[];
  stateLines: string[];
};

export class Config extends BaseConfig {
  override async config(args: {
    denops: Denops;
    contextBuilder: ContextBuilder;
    basePath: string;
    dpp: Dpp;
  }): Promise<ConfigReturn> {
    args.contextBuilder.setGlobal({
      protocols: ["git"],
    });

    const myrc_home = Deno.env.get("MYRC_HOME");
    const [context, options] = await args.contextBuilder.get(args.denops);
    const tomls: Toml[] = [];

    const tomlinfo: TomlInfo[] = [
      {
        path: `${myrc_home}/toml/dpp.toml`,
        lazy: false,
      },
      {
        path: `${myrc_home}/toml/dpp_lazy.toml`,
        lazy: true,
      },
      {
        path: `${myrc_home}/toml/ddc.toml`,
        lazy: true,
      },
      {
        path: `${myrc_home}/toml/ddu.toml`,
        lazy: true,
      },
      {
        path: `${myrc_home}/toml/denops.toml`,
        lazy: true,
      },
    ];

    await Promise.all(tomlinfo.map(async (info) => {
      tomls.push(
        await args.dpp.extAction(
          args.denops,
          context,
          options,
          "toml",
          "load",
          {
            path: info.path,
            options: {
              lazy: info.lazy,
            },
          },
        ) as Toml,
      );
    }));

    const recordPlugins: Record<string, Plugin> = {};
    const ftplugins: Record<string, string> = {};
    const hooksFiles: string[] = [];

    tomls.forEach((toml) => {
      for (const plugin of toml.plugins) {
        recordPlugins[plugin.name] = plugin;
      }

      if(toml.ftplugins) {
        for (const filetype of Object.keys(toml.ftplugins)) {
          if (ftplugins[filetype]) {
            ftplugins[filetype] +=`\n${toml.ftplugins[filetype]}`;
          } else {
            ftplugins[filetype] = toml.ftplugins[filetype];
          }

        }
      }

      if (toml.hooks_file) {
        hooksFiles.push(toml.hooks_file);
      }
    });

    const lazyResult = await args.dpp.extAction(
      args.denops,
      context,
      options,
      "lazy",
      "makeState",
      {
        plugins: Object.values(recordPlugins),
      },
    ) as LazyMakeStateResult;

    return {
      plugins: lazyResult.plugins,
      stateLines: lazyResult.stateLines,
    };
  }

}

