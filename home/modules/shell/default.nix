{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    file
    which
    tree
    ripgrep
    bat
    fzf
    keychain
    bitwarden-cli
    xclip
    sshpass
    (pkgs.fetchgit {
      url = "https://github.com/Mimovnik/NeedSsh.git";
      sha256 = "sha256-ElwaE7C8MlVhwgnzyIbkl2fCqfWBe6CtmgzYHdZgeNU=";
    })
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

        zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

        bindkey  "^[[H"   beginning-of-line
        bindkey  "^[[F"   end-of-line
        bindkey  "^[[3~"  delete-char

        getpass() {
          bw get password $1 | xclip -selection clipboard
        }

        eval $(keychain --eval --quiet --agents ssh);

        export PATH=~/.npm-packages/bin:$PATH
        export NODE_PATH=~/.npm-packages/lib/node_modules
        export MIMODISK=/run/media/mimovnik/MimoDisk
      '';

      autosuggestion.enable = true;

      shellAliases = {
        ssh = "kitten ssh";
        xcopy = "xclip -selection clipboard";
      
        gs = "git status";
        gd = "git diff";
        ga = "git add";
        gc = "git commit";
        gl = "git log";
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
      options = [
        "--cmd cd" # Alias to cd (cdi for interactive)
      ];
    };

    eza = {
      enable = true;
      git = true;
      icons = true;
    };
  };
}
