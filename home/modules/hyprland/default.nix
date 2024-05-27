{config, ...}: let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in {
  imports = [
    ./packages.nix
    ./anyrun.nix
  ];

  # IMPURE
  home.file.".config/hypr/hyprland.conf" = {
    source = mkOutOfStoreSymlink "/home/mimovnik/.nixos-config/home/modules/hyprland/config/hypr/hyprland.conf";
  };
  home.file.".config/hypr/scripts" = {
    source = mkOutOfStoreSymlink "/home/mimovnik/.nixos-config/home/modules/hyprland/config/hypr/scripts";
    recursive = true;
  };
  home.file.".config/hypr/mako" = {
    source = mkOutOfStoreSymlink "/home/mimovnik/.nixos-config/home/modules/hyprland/config/hypr/mako";
    recursive = true;
  };
  home.file.".config/hypr/waybar" = {
    source = mkOutOfStoreSymlink "/home/mimovnik/.nixos-config/home/modules/hyprland/config/hypr/waybar";
    recursive = true;
  };
  home.file.".config/hypr/wlogout" = {
    source = mkOutOfStoreSymlink "/home/mimovnik/.nixos-config/home/modules/hyprland/config/hypr/wlogout";
    recursive = true;
  };
}
