{ pkgs, config, lib, ... }:

with lib;

let

  cfg = config.programs.wofi;

in {
  options = {
    programs.wofi = {
      enable = mkEnableOption "Wofi";

      css = mkOption {
        type = types.lines;
	default = "";
	description = "The stylesheet to be used for Wofi";
	example = ''
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
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.wofi ];
    xdg.configFile."wofi/style.css".text = cfg.css;
  };
}
