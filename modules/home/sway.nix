{ pkgs, ... }:

{

  imports = 
    [
      ./custom/wofi.nix
    ];

  home.packages = with pkgs; [ grim i3status-rust imv kanshi mako redshift-wlr slurp swaybg swayidle swaylock wdisplays wl-clipboard xwayland ];

  wayland.windowManager.sway = {
    enable = true;
    extraSessionCommands = "export MOZ_ENABLE_WAYLAND=1";

    config = {
      modifier = "Mod4";
      terminal = "${pkgs.alacritty}/bin/alacritty";
      menu = "${pkgs.wofi}/bin/wofi --show run";
    };
  };

  programs.wofi.enable = true;
  programs.wofi.css = ''
    window {
    margin: 5px;
    border: 2px solid red;
    background-color: red;
    }

    #input {
    margin: 5px;
    border: 2px solid blue;
    background-color: blue;
    }

    #inner-box {
    margin: 5px;
    border: 2px solid yellow;
    background-color: yellow;
    }

    #outer-box {
    margin: 5px;
    border: 2px solid green;
    background-color: green;
    }

    #scroll {
    margin: 5px;
    border: 2px solid orange;
    background-color: orange;
    }

    #text {
    margin: 5px;
    border: 2px solid cyan;
    background-color: cyan;
    }
  '';
}
