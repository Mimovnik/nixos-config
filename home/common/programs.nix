{pkgs, ...}: {
  home.packages = with pkgs; [
    # cli
    konsave
    neofetch
    zip
    unzip
    wget
    curl
    nix-output-monitor
    alejandra
    htop
    btop
    dotnet-sdk_7
    just
    playerctl
    python3
    nnn
    gcc
    gnumake
    gdb
    ssh-audit
    lynis
    android-tools

    # gui
    discord
    brave
    yakuake
    godot_4
    unityhub
    firefox
    signal-desktop
    kup
    vscode.fhs
    anki
    jetbrains.idea-community
    krita
    onlyoffice-bin
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
