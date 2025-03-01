## Deploy

```shell
git clone https://github.com/MamoruDS/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}/nvim-deploy"

export NVIM_APPNAME=nvim-deploy nvim
```

### Use in Home Manager

Add to your inputs:

```nix
nvim-config.url = "github:MamoruDS/nvim-config";
```

Enable in your configuration:

```nix
{
  imports = [inputs.nvim-config.hmModules.nvim-config];
  nvim-config.enable = true;
}
```

## Configuration

You can customize this Neovim configuration to suit your local setup.
It is recommended to define your changes in `nvim/lua/local/options.lua`:

```lua
local config = require("dotfiles.config").config

config.lsp_clients = {
  nixd = {
    config = {
      settings = {
        nixd = {
          nixpkgs = { expr = "import <nixpkgs> { }" },
          options = {
            home_manager = {
              expr = '(builtins.getFlake "/Users/mamoru/.config/home-manager").homeConfigurations.mamoru.options',
            },
          },
        },
      },
    },
  },
}

```

### Config in Home Manager

```nix
{
  nvim-config = {
    enable = true;
    appName = "nvim_test"; #  use with `$NVIM_APPNAME`
    extraConfig = ''
      local config = require("dotfiles.config").config

      config.appearances.dark_mode = false
      config.appearances.transparent_bg = true
      -- ...
    '';
  };
}
```
