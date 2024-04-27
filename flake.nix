{
  description = "NixOS configuration of Mimovnik";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.glados = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/glados

	# make home-manager as a module of nixos
	# so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
	home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.mimovnik = import ./home;

	  # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
	}
      ];
    };
  };
}
