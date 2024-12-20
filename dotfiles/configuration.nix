# Edit this configuration fie to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "dylan-pc"; 
  networking.networkmanager.enable = true;  
  time.timeZone = "America/Chicago";

  environment.persistence."/persist" = {
    enable = true;  # NB: Defaults to true, not needed
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
    ];
    files = [
      "/etc/machine-id"
      { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
    ];
  };

  programs = {
    git = {
      enable = true;
      config = {
	user.email = "krecker@keemail.me";
	user.name = "dy17n";
	credential.credentialStore = "plaintext";
      };
    };
  
   zsh = {
     enable = true;
     oh-my-zsh = {
       enable = true;
       theme = "lambda";
     };
   };

  }; 


  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;
  users.mutableUsers = false;
  users.users.dylan = {
    initialPassword = "7538";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    vim 
    git-credential-manager
  ];

  system.stateVersion = "24.11"; # Did you read the comment?

}

