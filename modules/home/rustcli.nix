{ pkgs, ...}:

{
  home.packages = with pkgs; [ ripgrep exa fd bat zenith ];
}
