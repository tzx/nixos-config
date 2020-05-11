{ config, pkgs, ...}:

{

  fonts = {
    enableDefaultFonts = true; 

    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      lato
      input-fonts
    ];

    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
	monospace =  [ "Input Mono" ];
	serif = [ "Noto Serif" ]; 
	sansSerif = [ "Noto Sans" ];
      };
    };
  };
}
