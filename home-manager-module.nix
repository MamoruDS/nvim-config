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
      type = types.str;
      default = "";
    };
  };

  config = {
    home = mkIf cfg.enable {
      file = {
        "${config.xdg.configHome}/${cfg.appName}" = {
          source = libFns.mkDotfiles pkgs { };
          recursive = true;
        };
      };
    };
  };
}
