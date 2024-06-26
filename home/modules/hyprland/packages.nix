{pkgs, ...}: {
  home.packages = with pkgs; [
    waybar # the status bar
    hyprpaper # the wallpaper
    hypridle # the idle timeout
    hyprlock # locking the screen
    hyprpicker # color picker
    imagemagick
    libsForQt5.polkit-kde-agent

    wlogout # logout menu
    wl-clipboard # copying and pasting
    libnotify # needed for notify-send
    mako # the notification daemon, the same as dunst
    networkmanagerapplet # provide GUI app: nm-connection-editor
    pwvucontrol
    brightnessctl
    hyprshot # screen shot
    grim # taking screenshots
    slurp # selecting a region to screenshot
    wf-recorder # screen recording
    hyprcursor
    jq # json parser
  ];
}
