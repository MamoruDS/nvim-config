{
  config,
  lib,
  libFns,
  pkgs,
  ...
}:

let
  cfg = config.nvim-config;
in
{
  imports = [ ./options.nix ];

  config = lib.mkIf cfg.enable {
    home.file."${config.xdg.configHome}/${cfg.appName}" = {
      source = libFns.mkDotfiles pkgs { local = cfg.extraConfig; };
      recursive = true;
    };
  };
}
