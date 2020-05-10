{ config, pkgs, ...}:

{
  programs.sway.enable = true;
  programs.sway.extraPackages = with pkgs; [ grim i3status-rust imv kanshi mako redshift-wlr slurp swaybg swayidle swaylock wdisplays wl-clipboard wofi xwayland ];
}


