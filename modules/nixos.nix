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

  options.nvim-config = {
    setDefaultAppName = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = ''
        Whether to set NVIM_APPNAME system-wide via environment.variables.
        When true, all users default to using this config.
        Users can override by setting their own NVIM_APPNAME or unsetting it.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    environment.etc."xdg/${cfg.appName}" = {
      source = libFns.mkDotfiles pkgs { local = cfg.extraConfig; };
    };

    environment.variables = lib.mkIf cfg.setDefaultAppName {
      NVIM_APPNAME = cfg.appName;
    };
  };
}
