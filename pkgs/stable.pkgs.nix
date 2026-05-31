# My programs to be declared in nixos

{pkgs, ...}: 
{ 
environment.systemPackages = with pkgs; [
  
# Virtual machines
pkgs.virt-manager #KVM and QMU virtual-machine

#pkgs.emacsPackages.pdf-tools



# Unknow 
 pkgs.gnupg
 openssh
# wget
dmenu
# pkgs.blueberry # bluetooth gui
# hyperland pkgs:
      wofi  waybar hyprpaper 
      xmobar # Xmonad status bar
      haskellPackages.xmonad-contrib haskell-language-server  
    pkgs.swaybg 
   # vim pkgs:
   pkgs.conky
   alsa-utils
   pkgs.xclip      
    system-config-printer
      pkgs.brightnessctl # screen brightness
      pkgs.xsecurelock # screenlock for X11 
     pkgs.xorg.libX11 # X11 tools
	  pkgs.mpv # terminal mp3 player
          # Screen saving and locking packages
          pkgs.i3lock         
	                       # Simple screen locker
          pkgs.xss-lock        # Automatic screen locking
          pkgs.xautolock       # Alternative screen locker
          pkgs.xscreensaver    # Traditional X11 screensaver
          pkgs.rofi


     



];
}
