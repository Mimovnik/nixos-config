{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    file
    which
    tree
    ripgrep
    bat
    fzf
  ];

  programs = {
    zsh = {
        enable = true;

        history = {
          size = 10000;
          path = "${config.xdg.dataHome}/zsh/history";
          ignorePatterns = [
            "*rm*"
          ];
        };

        defaultKeymap = "emacs";

        initExtra = ''
          POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true;
          unset SSH_ASKPASS;
        '';

        enableAutosuggestions = true;

        shellAliases = {
          rbld = "sudo nixos-rebuild";
        };

        plugins = [
          {
            name = "powerlevel10k";
            src = pkgs.zsh-powerlevel10k;
            file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
          }
          {
            name = "powerlevel10k-config";
            src = ./.; # Current directory
            file = ".p10k.zsh";
          }
        ];
      };

      zoxide = {
        enable = true;
      };
  
      eza = {
        enable = true;
        enableAliases = true;
        git = true;
        icons = true;
      };
    };
}
