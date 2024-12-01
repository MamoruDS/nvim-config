## Deploy

```shell
git clone https://github.com/MamoruDS/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}/nvim-deploy"

export NVIM_APPNAME=nvim-deploy nvim
```

## Configuration

You can customize this Neovim configuration to suit your local setup.
It is recommended to define your changes in `nvim/lua/local/options.lua`:

```lua
local config = require("dotfiles.config").config

config.lsp_client = {
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
