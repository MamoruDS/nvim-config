{
  config,
  lib,
  libFns,
  pkgs,
  ...
}:

let
  cfg = config.nvim-config;

  configSource = libFns.mkDotfiles pkgs { local = cfg.extraConfig; };
  shellInit = ''
    export NVIM_APPNAME="${cfg.appName}"
    _nvim_link="''${XDG_CONFIG_HOME:-$HOME/.config}/${cfg.appName}"
    if [ "$(readlink "$_nvim_link" 2>/dev/null)" != "${configSource}" ]; then
      mkdir -p "$(dirname "$_nvim_link")"
      ln -sfn "${configSource}" "$_nvim_link"
    fi
    unset _nvim_link
  '';
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

    programs = {
      bash.interactiveShellInit = shellInit;
      zsh.interactiveShellInit = shellInit;
    };
  };
}
