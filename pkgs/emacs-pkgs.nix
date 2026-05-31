# My programs to be declared in nixos

{pkgs, pkgs-unstable, ...}: 
{ 
environment.systemPackages = with pkgs; [
#pkgs-unstable.emacs
#pkgs.emacsPackages.fira-code-mode
];

}




