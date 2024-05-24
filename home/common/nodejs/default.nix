{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs_20
  ];

  home.file.".npmrc".source = ./.npmrc;
}
