# My programs to be declared in nixos

{pkgs-unstable, ...}: 
{ 
environment.systemPackages = with pkgs-unstable; [
 pkgs-unstable.chromium
    pkgs-unstable.brave
    pkgs-unstable.localsend
    pkgs-unstable.qutebrowser    



];
}
