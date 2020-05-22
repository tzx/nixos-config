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
      bars = 
        [ 
          {
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/sway/status.toml";
          }
        ];
    };
  };

  xdg.configFile."sway/status.toml".text = 
    ''
      [[block]]
      block = "disk_space"
      path = "/"
      alias = "/"
      info_type = "available"
      unit = "GB"
      interval = 20
      warning = 20.0
      alert = 10.0

      [[block]]
      block = "memory"
      display_type = "memory"
      format_mem = "{Mup}%"
      format_swap = "{SUp}%"

      [[block]]
      block = "cpu"
      interval = 1

      [[block]]
      block = "load"
      interval = 1
      format = "{1m}"

      [[block]]
      block = "sound"

      [[block]]
      block = "time"
      interval = 60
      format = "%a %d/%m %R"
    '';

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
