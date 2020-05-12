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
      border: 1px solid #81a2be;
      background-color: #81a2be;
    }
    
    #input {
    margin: 5px;
      border: 1px solid #1d1f21;
      background-color: #c5c8c6;
    }
    
    #inner-box {
    margin: 5px;
      border: 2px solid #1d1f21;
      background-color: #1d1f21;
    }
    
    #outer-box {
    margin: 5px;
      border: 2px solid #1d1f21;
      background-color: #1d1f21;
    }
    
    #scroll {
    margin: 5px;
      border: 2px solid #1d1f21;
      background-color: #1d1f21;
    }
    
    #text {
    margin: 5px;
      color: #f0c674;
    } 
  '';
}
