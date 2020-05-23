{ pkgs, ... }:

{
  programs.direnv.enable = true;
  programs.zsh = {
    enable = true;
    history.extended = true;
    dotDir = ".config/zsh";
    shellAliases = {
      ls = "exa";
    };

    plugins = 
      [
        {
          name = "powerlevel10k";
          file = "powerlevel10k.zsh-theme";
          src = pkgs.fetchFromGitHub {
            owner = "romkatv";
            repo = "powerlevel10k";
            rev = "v1.10.0";
            sha256 = "1kpwvsamxc3whbcspbm4ijz28y9hr328h4h0fqazgqcvfqz3aa51";
          };
        }
        {
          name = "powerlevel10k-config";
          file = "config/p10k-pure.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "romkatv";
            repo = "powerlevel10k";
            rev = "v1.10.0";
            sha256 = "1kpwvsamxc3whbcspbm4ijz28y9hr328h4h0fqazgqcvfqz3aa51";
          };
        }
      ];
  };
}
