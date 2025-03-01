{
  self,
}:

{
  mkDotfiles =
    pkgs:
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
}
