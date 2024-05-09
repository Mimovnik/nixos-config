{...}: {
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Configure keymap in X11
    xkb.variant = "";
    xkb.layout = "pl";
  };

  # Configure console keymap
  console.keyMap = "pl2";
}
