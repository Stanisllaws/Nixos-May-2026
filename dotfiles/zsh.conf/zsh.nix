{ config, pkgs, ... }:
{
  home.file.".zshrc" = {
    source = ./zshrc;
    recursive = true;
               
};
home.packages = [
pkgs.zsh


];


  
   

}   


##
