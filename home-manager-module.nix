{
  config,
  lib,
  libFns,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.nvim-config;
in
{
  options.nvim-config = {
    enable = mkEnableOption "deploy nvim-config dotfiles";

    appName = mkOption {
      type = types.str;
      default = "nvim";
    };

    extraConfig = mkOption {
      type = types.lines;
      default = ''
        -- config with `nvim-config.extraConfig`
      '';
      description = ''
        Extra configuration lua lines to add to
        {file}`$XDG_CONFIG_HOME/$APPNAME/lua/local/options.lua`.
      '';
    };
  };

  config = {
    home = mkIf cfg.enable {
      file = {
        "${config.xdg.configHome}/${cfg.appName}" = {
          source = libFns.mkDotfiles pkgs { local = cfg.extraConfig; };
          recursive = true;
        };
      };
    };
  };
}
