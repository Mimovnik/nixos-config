{
  description = "NixOS configuration of Mimovnik";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:elythh/nixvim";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixvim,
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
              _module.args = {inherit hostname;};
            }

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = import ./home;

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
                users.${username} = import ./home;

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
