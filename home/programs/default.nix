{pkgs, ...}: {
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    konsave
    neofetch

    # archives
    zip
    unzip

    wget
    curl
    xclip

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor
    alejandra

    htop
    btop # replacement of htop/nmon

    dotnet-sdk_7

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
