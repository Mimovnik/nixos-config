{pkgs, ...}: {
  home.packages = with pkgs; [
    waybar # the status bar
    swaybg # the wallpaper
    swayidle # the idle timeout
    swaylock # locking the screen
    wlogout # logout menu
    wl-clipboard # copying and pasting
    hyprpicker # color picker
    libnotify # needed for notify-send
    mako # the notification daemon, the same as dunst
    networkmanagerapplet # provide GUI app: nm-connection-editor
    pavucontrol
    light

    hyprshot # screen shot
    grim # taking screenshots
    slurp # selecting a region to screenshot
    wf-recorder # screen recording
  ];
}
