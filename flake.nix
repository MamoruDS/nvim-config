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
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        mkDotfiles =
          {
            local ? null,
          }:
          let
            localCfg = pkgs.writeTextFile {
              name = "options.lua";
              text = if local == null then "-- modify config here" else local;
            };
          in
          pkgs.runCommand "nvim-config" { } ''
            mkdir -p $out/nvim/lua/local
            cp -r ${self}/* $out/nvim/
            cp ${localCfg} $out/nvim/lua/local/options.lua
          '';
      in
      {
        lib.mkDotfiles = mkDotfiles;

        packages.default = mkDotfiles { };
      }
    );
}
