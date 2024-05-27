{
  config,
  pkgs,
  ...
}: let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in {
  imports = [
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

  home.packages = with pkgs; [
    waybar # the status bar
    swaybg # the wallpaper
    swayidle # the idle timeout
    swaylock # locking the screen
    wlogout # logout menu
    wl-clipboard # copying and pasting
    hyprpicker # color picker
    mako # the notification daemon, the same as dunst
    networkmanagerapplet # provide GUI app: nm-connection-editor
    pavucontrol

    # pkgs-unstable.hyprshot # screen shot
    # grim # taking screenshots
    # slurp # selecting a region to screenshot
    # wf-recorder # screen recording
  ];
}
