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
    system = "x86_64-linux";
  in {
    nixosConfigurations.glados = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/glados

        # make home-manager as a module of nixos
        # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.mimovnik = import ./home;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
            extraSpecialArgs = {
              inherit (inputs) nixvim;
              inherit system;
            };
          };
        }
      ];
    };
  };
}
