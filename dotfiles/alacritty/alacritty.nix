{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { x = 10; y = 10; };
        opacity = 1.0;
      };
      font = {
        #normal.family = "JetBrains Mono";
        size = 12;
      };
      colors = {
        primary = {
          background = "#1d1f21";
          foreground = "#d8d8d8";
        };
      };
    };
  };
}
