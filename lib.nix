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
      mkdir -p $out/lua/local
      cp -r ${self}/* $out/
      cp ${localCfg} $out/lua/local/options.lua
    '';
}
