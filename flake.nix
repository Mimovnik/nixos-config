{
  description = "NixOS configuration of Mimovnik";

  # the nixConfig here only affects the flake itself, not the system configuration!
  # for more information, see:
  #     https://nixos-and-flakes.thiscute.world/nixos-with-flakes/add-custom-cache-servers
  nixConfig = {
    # substituers will be appended to the default substituters when fetching packages
    extra-substituters = [
      # "https://anyrun.cachix.org"
      # "https://hyprland.cachix.org"
      # "https://nixpkgs-wayland.cachix.org"
    ];
    extra-trusted-public-keys = [
      # "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      # "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      # "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:Mimovnik/nixvim";
    };

    # anyrun - a wayland launcher
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixvim,
    # anyrun,
    ...
  } @ inputs: let
    username = "mimovnik"; # Change this to your username
  in {
    nixosConfigurations = {
      # Copy the template and rename it to your hostname
      # here \/
      template = let
        hostname = "template"; # < and here
      in
        nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          modules = [
            ./hosts/${hostname}
            {
              _module.args = {
                inherit hostname;
                inherit username;
              };
            }

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = import ./hosts/${hostname}/home.nix;

                extraSpecialArgs = {
                  inherit inputs;
                  inherit system;
                  inherit username;
                };
              };
            }
          ];
        };
      walle = let
        hostname = "walle";
      in
        nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          modules = [
            ./hosts/${hostname}
            {
              _module.args = {
                inherit hostname;
                inherit username;
              };
            }

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = import ./hosts/${hostname}/home.nix;

                extraSpecialArgs = {
                  inherit inputs;
                  inherit system;
                  inherit username;
                };
              };
            }
          ];
        };
      glados = let
        hostname = "glados";
      in
        nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          modules = [
            ./hosts/${hostname}
            {
              _module.args = {inherit hostname;};
            }

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = import ./hosts/${hostname}/home.nix;

                extraSpecialArgs = {
                  inherit inputs;
                  inherit system;
                  inherit username;
                };
              };
            }
          ];
        };
    };
  };
}
