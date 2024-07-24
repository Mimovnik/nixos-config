{pkgs, ...}: {
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    theme = "${import ./sddm-chili-theme.nix {inherit pkgs;}}";
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };
}
