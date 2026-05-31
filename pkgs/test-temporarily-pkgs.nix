#List of packges for test 


{pkgs, pkgs-unstable, ...}:
{

# export NIXPKGS_ALLOW_UNFREE=1;
# export NIXPKGS_ALLOW_INSECURE=;


environment.systemPackages = with pkgs-unstable; [
 pkgs.rofi-network-manager
# pkgs.mangowc


#pkgs.emacsPackages.centaur-tabs


#termonad
#haskellPackages.ghc





];


#nixpkgs.config.permittedInsecurePackages = [
 #               "ventoy-1.1.12"
  #            ];





}