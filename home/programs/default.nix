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

    # gui
    discord
    brave
    yakuake
    godot_4
    unityhub
    firefox
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
