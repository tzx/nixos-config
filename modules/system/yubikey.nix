{ pkgs, ... }:

{
  services.udev.packages = [ pkgs.yubikey-personalization pkgs.libu2f-host ];
  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [ gnupg pinentry-curses ];
  programs = {
      ssh.startAgent = false;
      gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
      };
  };
}
