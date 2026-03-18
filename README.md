# nvim-config

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
  imports = [inputs.nvim-config.homeManagerModules.default];
  nvim-config.enable = true;
}
```

### Use in NixOS

Add to your inputs:

```nix
nvim-config.url = "github:MamoruDS/nvim-config";
```

Enable in your NixOS configuration:

```nix
{
  imports = [inputs.nvim-config.nixosModules.default];
  nvim-config = {
    enable = true;
    appName = "nvim_os";
    setDefaultAppName = true;
  };
}
```

On interactive shell login, sets `NVIM_APPNAME=nvim_os` and symlinks the config into each user's `~/.config/nvim_os/`. The symlink is refreshed automatically after NixOS rebuilds. Users can override by unsetting `NVIM_APPNAME` or removing the link.

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
