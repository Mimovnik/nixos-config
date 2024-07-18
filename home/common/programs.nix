{pkgs, ...}: {
  home.packages = with pkgs; [
    # cli
    zip
    unzip
    wget
    curl
    dig
    nix-output-monitor
    alejandra
    htop
    btop
    dotnet-sdk_7
    just
    playerctl
    python3
    gcc
    gnumake
    gdb
    traceroute
    imv # simple image viewer
    gnupg

    # gui
    kitty
    discord
    brave
    godot_4
    unityhub
    firefox
    signal-desktop
    kup
    vscode.fhs
    anki
    krita
    onlyoffice-bin
    obsidian
    qbittorrent
    gnome.nautilus
    nextcloud-client
  ];

  programs = {
    git = {
      enable = true;
      userName = "mimovnik";
      userEmail = "mimovnik@protonmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
    };
  };
}
