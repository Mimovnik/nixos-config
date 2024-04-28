{ ... }:
{
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the KDE Plasma Desktop Environment.
    desktopManager.plasma5.enable = true;

    # Configure keymap in X11
    xkb.variant = "";
    xkb.layout = "pl";
  };

  services.displayManager.sddm.enable = true;

  # Configure console keymap
  console.keyMap = "pl2";
}
