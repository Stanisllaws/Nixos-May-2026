{ config, pkgs, inputs, ... }:

{
  home.packages = [
    pkgs.starship
  ];

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      eval "$(starship init bash)"
    '';
  };

  imports = [
   ./starship-flake2.nix
  ];

  programs.starship = {
    enable = true;
  };
}
