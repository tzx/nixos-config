{ config, pkgs, ...}:

{

  fonts = {
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
        monospace =  [ "Input Mono" "Noto Color Emoji" ];
        serif = [ "Noto Serif" ]; 
        sansSerif = [ "Lato" ];
      };
    };
  };
}
