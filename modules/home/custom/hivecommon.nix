{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;
    programs.home-manager.enable = true;
    imports = [
                ../neovim
                ./beeshell.nix
                ../alacritty.nix
                ../rustcli.nix
             ];
}

