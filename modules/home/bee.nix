{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;
    programs.home-manager.enable = true;
    imports = [
                ./neovim
                ./custom/beehive.nix
                ./alacritty.nix
                ./rustcli.nix
             ];
}
