{pkgs, ...}: {
  imports = [
    ./x11.nix
  ];

  environment.pathsToLink = ["/libexec"]; # links /libexec from derivations to /run/current-system/sw

  services.displayManager.defaultSession = "none+i3";

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;

  services.xserver = {
    desktopManager.xterm.enable = false;
    displayManager = {
      lightdm.enable = false;
      gdm.enable = true;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi # application launcher, the same as dmenu
        dunst # notification daemon
        i3blocks # status bar
        i3lock # default i3 screen locker
        autotiling
        xautolock # lock screen after some time
        i3status # provide information to i3bar
        i3-gaps # i3 with gaps
        picom # transparency and shadows
        feh # set wallpaper
        acpi # battery information
        arandr # screen layout manager
        dex # autostart applications
        xbindkeys # bind keys to commands
        xorg.xbacklight # control screen brightness
        xorg.xdpyinfo # get screen information
        sysstat # get system information
        flameshot # screenshot utility
      ];
    };
  };

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
}
