# /etc/nixos/dotfiles/home-modules/niri-wrapper.nix
{ pkgs, lib, ... }:

let
  myNiri = pkgs.buildEnv {
    name = "my-niri";
    paths = [ pkgs.niri ];  # or wherever your niri binary is
  };
in
{
  programs.niri = {
    enable = true;
    package = myNiri;
    settings = {
      binds = {
        "Mod+Enter" = { action = "spawn"; command = "alacritty"; };
        "Mod+Shift+Q" = { action = "quit"; };
      };
      layout.gaps = 5;
      input.keyboard.xkb.layout = "us,ua";
    };
  };
}
