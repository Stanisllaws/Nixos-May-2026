{ config, pkgs, ...}:
let 
  dotfles = import ./default.nix;

  in 

{

services.xserver.windowManager.xmonad.enable = true;
services.xserver.windowManager.xmonad.config = ./xmonad.hs;
services.xserver.windowManager.xmonad.enableContribAndExtras = true;



#services.xserver.displayManager.sessionCommands = ''
#${pkgs.xmobar}/bin/xmobar ${builtins.toString ./xmobarrc} #&
#'';



environment.systemPackages = with pkgs; [
 pkgs.xmobar 
  haskellPackages.xmonad-contrib haskell-language-server
pkgs.xorg.libX11



];


}
