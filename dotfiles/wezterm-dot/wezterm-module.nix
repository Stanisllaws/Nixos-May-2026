# wezterm-module.nix
{ pkgs, ... }:
{
  home.file.".config/wezterm/wezterm.lua".text = builtins.readFile ./wezterm.lua;
  environment.systemPackages = [ pkgs.wezterm ];
}   
