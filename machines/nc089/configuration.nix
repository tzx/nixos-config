# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      <home-manager/nixos>
      ./hardware-configuration.nix
      ../../modules/system/fonts.nix
      ../../modules/system/kernel.nix
      ../../modules/system/bitlbee.nix
    ];

  # Used to enable xsession/wayland
  hardware.opengl.enable = true;

  # Used to enable GTK for ca.desrt.dconf
  services.dbus.packages = with pkgs; [ gnome3.dconf ];

  # Used for PAM unlocking swaylock
  # Should be used for other services
  security.pam.services.swaylock = {};

  # must use unfree due to wireless drive
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nc089"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim git tmux firefox xdg_utils
  ];

  # Enable sound.
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.timmy = {
    isNormalUser = true;
    home = "/home/timmy";
    extraGroups = [ "wheel" "networkmanager" "bitlbee" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  home-manager.users.timmy = { pkgs, ... }: {
    imports = 
      [ 
        ../../modules/home/sway.nix 
        ../../modules/home/alacritty.nix
        ../../modules/home/gtk.nix
        ../../modules/home/zathura.nix
        ../../modules/home/neovim
        ../../modules/home/zsh.nix
        ../../modules/home/custom/weechat.nix
      ];
    programs.git = {
      enable = true;
      userName = "Timmy Xiao";
      userEmail = "timmyxiao1@gmail.com";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}

