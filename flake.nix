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
  } @ inputs: {
    nixosConfigurations = {
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
                users.mimovnik = import ./home;

                extraSpecialArgs = {
                  inherit inputs;
                  inherit system;
                };
              };
            }
          ];
        };
    };
  };
}
