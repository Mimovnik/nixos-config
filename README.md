# nixos-config

This repository holds my NixOS desktop configuration.

# Setup on NixOS

## Clone this repo

```bash
nix --extra-experimental-features "nix-command flakes" shell nixpkgs#git
git clone https:github.com/Mimovnik/nixos-config ~/.nixos-config
```

## Create host config

```bash
HNAME="hostnamegoeshere"
# Create directory from a template
cp ~/.nixos-config/hosts/template ~/.nixos-config/hosts/$HNAME

# Copy hardware-configuration
cp /etc/nixos/hardware-configuration.nix ~/.nixos-config/hosts/$HNAME
```

## Add your config to flake.nix in nixosConfigurations attribute

```nix
# Copy the template and rename it to your hostname
# here \/
hostnamegoeshere = let
  hostname = "hostnamegoeshere"; # < and here
in
 nixpkgs.lib.nixosSystem rec {
   ...
 };
```

## Change username in flake.nix

```nix
username = "usernamegoeshere"; # Change this to your username

```

## Rebuild

```bash
# Backup default config
sudo mv /etc/nixos /etc/nixos.bak

# Link
sudo ln -s ~/.nixos-config /etc/nixos

# Rebuild for hostnamegoeshere
sudo nixos-rebuild switch --flake ~/.nixos-config#hostnamegoeshere
```
