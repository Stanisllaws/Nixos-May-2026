{ config, pkgs, pks-unstable, lib, ... }:
{
  

  # Enable mangowc
 # programs.mangowc.enable = true;
  # System packages
  environment.systemPackages = with pkgs; [
    foot
    wmenu
    wl-clipboard
    grim
    slurp
    swaybg
    firefox
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
