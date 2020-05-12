{ pkgs, ... }:

{
  gtk = {
    enable = true;
    iconTheme.name = "Arc";
    iconTheme.package = pkgs.arc-icon-theme;
    theme.name = "Arc-Darker";
    theme.package = pkgs.arc-theme;
  };
}
