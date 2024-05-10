{pkgs, ...}: {
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    systemPackages = with pkgs; [
      waybar
      dunst
      libnotify
      kitty

      rofi-wayland
    ];
  };
}
