{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    withNodeJs = true;

    plugins = with pkgs.vimPlugins; 
      [
        lightline-vim
        base16-vim
        coc-nvim
        vim-latex-live-preview
      ];
    extraConfig = 
      ''
      set number relativenumber
      set expandtab
      set shiftwidth=4
      set tabstop=4
      set smartindent
      set cursorline
      set undofile
      set wildmode=longest:full,full

      let base16colorspace=256
      colorscheme base16-tomorrow-night

      let g:livepreview_previewer = 'zathura'

      source ~/.config/nvim/extra.vim
      '';
  };

  xdg.configFile."nvim/extra.vim".source = ./extra.vim;
}
