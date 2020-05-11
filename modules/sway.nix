{ pkgs, ... }:

{
  home.packages = with pkgs; [ grim i3status-rust imv kanshi mako redshift-wlr slurp swaybg swayidle swaylock wdisplays wl-clipboard wofi xwayland ];

  wayland.windowManager.sway = {
    enable = true;
    extraSessionCommands = "export MOZ_ENABLE_WAYLAND=1";
  };
}


