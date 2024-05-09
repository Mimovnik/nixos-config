{...}: {
  imports = [
    ./x11.nix
  ];

  # Enable the GNOME Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = false;
  };
}
