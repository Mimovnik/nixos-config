{
  inputs,
  system,
  lib,
  ...
}: let
  nixvim' = inputs.nixvim.packages.${system}.default;
  nvim = nixvim'.nixvimExtend {
    config.theme = lib.mkForce "decay";
    config.vimAlias = true;
  };
in {
  home.packages = [nvim];
}
