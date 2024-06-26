{pkgs, ...}: {
  # Due to the way desktop configuration works in Nixpkgs, we have to install
  # an X server even if we only use Wayland.
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };

    excludePackages =
      [pkgs.xterm]
      ++ (with pkgs.xorg; [
        iceauth
        xauth
        xf86inputevdev
        xinput
        xlsclients
        xorgserver
        xprop
        xrandr
        xrdb
        xset
        xsetroot
      ]);
  };

  environment = {
    gnome.excludePackages = with pkgs.gnome; [
      geary
      pkgs.gnome-tour
      pkgs.orca
    ];

    systemPackages = with pkgs; [
      gnomeExtensions.only-window-maximize
      gnomeExtensions.appindicator
      gnome-themes-extra
    ];
  };

  programs.dconf.enable = true;

  services.udev.packages = with pkgs; [gnome.gnome-settings-daemon];
}
