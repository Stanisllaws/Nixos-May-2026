{ config, pkgs, ... }:
{
 programs.niri.enable = true;

  programs.niri.settings = {
    binds = {
      "Mod+Enter" = { action = "spawn"; command = "alacritty"; };
      "Mod+Alt+X" = { action = "close-window"; };
      "Mod+Left" = { action = "focus-column-left"; };
      "Mod+Right" = { action = "focus-column-right"; };
      "Mod+Shift+Q" = { action = "quit"; };
      "XF86AudioRaiseVolume" = { action = "spawn"; command = "sh"; args = [ "-c" "amixer set Master 5%+" ]; };
      "F2" = { action = "spawn"; command = "sh"; args = [ "-c" "amixer set Master 5%-" ]; };
      "F3" = { action = "spawn"; command = "sh"; args = [ "-c" "amixer set Master 5%+" ]; };
    };
  };
}
