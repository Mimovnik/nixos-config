# nixos-config

This repository holds my NixOS desktop configuration.

# 1. Setup on NixOS

## 1.1 Enter nix shell with git
```bash
nix --extra-experimental-features "nix-command flakes" shell nixpkgs#git
```

## 1.2 Clone this repo

```bash
git clone https://github.com/Mimovnik/nixos-config ~/.nixos-config
```

## 1.3 Use existing or create new host config

### 1.3.a Use existing config
```bash
# Copy hardware-configuration
cp /etc/nixos/hardware-configuration.nix ~/.nixos-config/hosts/myhostname
```

### 1.3.b Create new config

#### 1.3.b.1 Copy template
```bash
# Create directory from a template
cp -r ~/.nixos-config/hosts/template ~/.nixos-config/hosts/myhostname

# Copy hardware-configuration
cp /etc/nixos/hardware-configuration.nix ~/.nixos-config/hosts/myhostname
```

#### 1.3.b.2 Add your config to flake.nix in nixosConfigurations attribute

```nix
# Copy the template and rename it to your hostname
# here \/
myhostname = let
  hostname = "myhostname"; # < and here
in
 nixpkgs.lib.nixosSystem rec {
   ...
 };
```

#### 1.3.b.3 Customize your config to your likings

## 1.4 Change username in flake.nix

```nix
username = "myusername"; # Change this to your username

```
Warning:
This step is very important. If you enter different username then your current one your user will be deleted and you won't be able to use sudo.

Note:
You need to either delete .git folder or `git add flake.nix` for nix to acknowledge a new host

## 1.5 Rebuild

```bash
# Backup default config
sudo mv /etc/nixos /etc/nixos.bak

# Link
sudo ln -s ~/.nixos-config /etc/nixos

# Rebuild for myhostname
sudo nixos-rebuild switch --flake ~/.nixos-config#myhostname
```
