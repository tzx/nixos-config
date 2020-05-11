{
  programs.alacritty.enable = true;

  # YAML can read JSON
  programs.alacritty.settings = {
    font = {
      normal = {
        family = "Input Mono";
	style = "Regular";
      };
      bold = {
        family = "Input Mono";
	style = "Bold";
      };
      italic = {
        family = "Input Mono";
	style = "Italic";
      };
    };
  };
}
