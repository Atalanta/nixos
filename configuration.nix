{ config, lib, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # time.timeZone = "Europe/Amsterdam";

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

  environment.systemPackages = with pkgs; [
    (import <nixos-unstable> {}).neovim
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
    xclip
    xsel
    clipman
    flameshot
  ];

  services.xserver.windowManager.i3.enable = true;

}

