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

      homeManagerModules.default =
        { ... }:
        {
          imports = [ ./modules/home-manager.nix ];
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
        };
      }
    );
}
