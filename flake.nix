{
  description = "Nvim configurations deploy with Flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    let
      lib = import ./lib.nix { inherit self; };
    in
    {
      inherit lib;

      hmModules.nvim-config =
        { ... }:
        {
          imports = [ ./home-manager-module.nix ];
          _module.args.libFns = lib;
        };
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          default = lib.mkDotfiles pkgs { };
          examples_treesitter =
            let
              ts = pkgs.symlinkJoin {
                name = "treesitter";
                paths =
                  [
                    pkgs.vimPlugins.nvim-treesitter
                  ]
                  ++ (with pkgs.vimPlugins.nvim-treesitter-parsers; [
                    json
                    nix
                  ]);
              };
            in
            lib.mkDotfiles pkgs {
              local = ''
                local config = require("dotfiles.config").config
                config.plugins.extra_plugins = {
                  {
                    tags = { "default" },
                    dir = "${ts}",
                    name = "nvim-treesitter-nix-managed",
                    main = "nvim-treesitter.configs",
                    opts = {
                      auto_install = false,
                      ensure_installed = {},
                      highlight = { enable = true };
                    },
                  }
                }
                table.insert(config.plugins.load_tags.negative, "no-native")
              '';
            };
        };
      }
    );
}
