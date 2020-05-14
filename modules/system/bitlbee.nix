{ pkgs, ... }:

{
  services.bitlbee = {
    enable = true;
    libpurple_plugins = with pkgs; [ purple-slack ];
    plugins = with pkgs; [ bitlbee-facebook bitlbee-discord ];
  };
}
