{ lib, ... }:

with lib;
{
  options.nvim-config = {
    enable = mkEnableOption "deploy nvim-config dotfiles";

    appName = mkOption {
      type = types.str;
      default = "nvim";
      description = "Name used for $NVIM_APPNAME and the config directory name.";
    };

    extraConfig = mkOption {
      type = types.lines;
      default = ''
        -- config with `nvim-config.extraConfig`
      '';
      description = ''
        Extra configuration lua lines to add to
        {file}`lua/local/options.lua`.
      '';
    };
  };
}
