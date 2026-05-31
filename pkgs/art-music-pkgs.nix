# My programs to be declared in nixos

{pkgs, ...}: 
{ 
environment.systemPackages = with pkgs; [
# Audio, Music
pkgs.audacity
pkgs.gimp


# UNCOMENT IF IT THERE IS NO OFFICE PACKGES FILES 
 kdePackages.gwenview  #imige viewer






];
}

