{
  inputs,
  system,
  ...
}: let
  nixvim' = inputs.nixvim.packages.${system}.default;
  nvim = nixvim'.nixvimExtend {
    config.vimAlias = true;
  };
in {
  home.packages = [nvim];
}
