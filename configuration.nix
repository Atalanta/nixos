{ config, lib, pkgs, ... }:

let
  isLegacyBios = !builtins.pathExists "/sys/firmware/efi";
  diskConfig = if isLegacyBios then ./disk-bios.nix else ./disk-uefi.nix;
in

{
  imports = [ 
    ./hardware-configuration.nix
    diskConfig
  ];

  networking.hostName = "lobachevsky";
  time.timeZone = "Europe/London";

  services.xserver.enable = true;
  services.xserver.xkb.options = "ctrl:nocaps";

  nixpkgs.config.allowUnfree = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  users.users.sns = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Inconsolata" ]; })
  ];

  nixpkgs.overlays = [
    (self: super: {
      unstable = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
      }) {};
    })
  ];

  environment.systemPackages = with pkgs; [
    unstable.neovim
    gnumake
    firefox
    gcc
    unzip
    nodejs
    zoom-us
    slack
    htop
    glances
    alacritty
    neofetch
    git
    ripgrep
    rustup
    openconnect
    obsidian
    clipman
    flameshot
  ];

  services.xserver.windowManager.i3.enable = true;

}

