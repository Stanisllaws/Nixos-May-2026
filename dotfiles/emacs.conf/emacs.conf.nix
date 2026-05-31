{ config, pkgs, ... }:
{
  home.file.".emacs.d" = {
    source = ./emacs.d;
    recursive = true;
               
};

home.packages = [

pkgs.emacsPackages.mowedline

];



programs.emacs = {
enable = true;
extraPackages = epkgs: with epkgs; [
  #epkgs.sudo-edit
  vterm  
];   

};  

}