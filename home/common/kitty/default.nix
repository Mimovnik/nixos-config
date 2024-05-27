{...}: {
  programs.kitty = {
    enable = true;
    theme = "One Dark";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    settings = {
      background_opacity = "0.99";
      enable_audio_bell = false;
      tab_bar_edge = "top";
    };
  };
}
