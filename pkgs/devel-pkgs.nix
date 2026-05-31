# My programs to be declared in nixos

{pkgs, pkgs-unstable, ...}: 
{ 
environment.systemPackages = with pkgs; [
# Development tools
   git # new 17.09
   pkgs.neovim
        #depency for neovim
        pkgs.lua-language-server
        pkgs.ripgrep #Nvim
        pkgs.fd #Nvim
        pkgs.gnumake #Nvim
        pkgs.stylua
        pkgs.sbcl
        emacsPackages.slime
pkgs.gcc
   wget

     # COMMON LISP 
      sbcl
     pkgs.emacsPackages.sly
   
#UNSTABLE

pkgs-unstable.zellij
pkgs-unstable.ghostty
pkgs-unstable.tmux

];

}


































