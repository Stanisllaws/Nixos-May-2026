{ config, pkgs, ... }: {
  home.file.".config/hypr" = {
source = ./hypr;
recursive = true;
};

  home.packages = [

pkgs.hyprlauncher

  ];

    
  # programs.hyprland = {

   # enable = true;

  # };

    
}


#
  
