{ config, pkgs, ... }:
{
  


home.packages = with pkgs; [

pkgs.emacsPackages.mowedline
emacsPackages.pdf-tools
texliveFull

];
 


programs.emacs = {
enable = true;
extraPackages = epkgs: with epkgs; [
undo-tree
mu4e
vterm
org-pdftools
magit
treemacs




];
};



 




#services.emacs.enable = true;

}

