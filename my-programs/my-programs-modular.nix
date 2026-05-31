{ config, pkgs, pkgs-unstable, ... }:

{

####################################################
#          TEST C MADE PAKGS                       #
####################################################

#sleep pc & helloWorld etc.
nixpkgs.overlays = [
  (self: super: {
    #sleepc = super.callPackage ./my-programs/sleept {};
    helloworld = super.callPackage ./my-programs/test1 {};
    dwmblocks = super.callPackage ./dotfiles/dwmblocks  {};
  })
];

  # Self configure Pkgs
  environment.systemPackages = with pkgs; [
  
   helloworld #my test program
   #sleepc #my second test program
   #arrayst #test3 
   dwmblocks 
   st 
   # desktop esecial pkgs: 

];


}


