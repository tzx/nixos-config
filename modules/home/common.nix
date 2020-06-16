{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;
    programs.home-manager.enable = true;
    imports = [
                ./neovim
                ./zsh.nix
                ./alacritty.nix
                ./rustcli.nix
             ];
}

