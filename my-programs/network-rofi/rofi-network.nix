{ config, pkgs, ... }:

{
  imports = [
    ./wifi-m.nix
  ];

  programs.wifi-m.enable = true;
}
