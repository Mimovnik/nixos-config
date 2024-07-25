{pkgs, ...}: {
  home.file.".config/i3/config".source = ./config;
  home.file.".config/i3/i3blocks.conf".source = ./i3blocks.conf;
  home.file.".config/i3/scripts" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };
  home.file.".config/i3/wallpaper.png".source = ../../../wallpapers/desert.png;

  home.packages = with pkgs; [
    libsForQt5.polkit-kde-agent
  ];
}
