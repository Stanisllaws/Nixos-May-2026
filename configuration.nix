# kalendarzcmd  Edit this configuration file to define what should be installed on


# your system.  Help is available in the configuration.nix(5) man page

# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, pkgs-unstable, ... }:

{

imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
     #./dotfiles/niri/niri-setup.nix
     ./dotfiles/dwm2/dwm.nix 
    # ./dotfiles/dwl/dwl.nix
     ./dotfiles/stumpwm.conf/stumpwm.nix
      
#<home-manager/nixos>
     ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

# REMOVE AFTER UPDATE KERNEL 6.12.85 (NEW VERSION OF NIXOS RELISE)
boot.kernelParams = ["initcall_blacklist=algif_aead_init"];

# Upadtes for nix channels create 13.09.25r.
   

  system.autoUpgrade = {
    enable = true;
    dates = "12:00";
   # Proper flake update flags
    flags = [
      "--update-input" "nixpkgs"
      "--update-input" "nixpkgs-unstable"
      "--update-input" "home-manager"
      "--commit-lock-file"
    ];
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

hardware.bluetooth.enable = true;
hardware.bluetooth.package = pkgs.bluez;
services.blueman.enable = true;   






  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;   

####################################################
#           MY-PROGRAMS AND CUSTUME                #
####################################################

#sleep pc & helloWorld etc.
nixpkgs.overlays = [
  (self: super: {
    #sleepc = super.callPackage ./my-programs/sleept {};
    helloworld = super.callPackage ./my-programs/test1 {};
    #st = super.callPackage ./dotfiles/st.4 {};
    #arrayst = super.callPackage ./my-programs/arrayst2 {};
    dwmblocks = super.callPackage ./dotfiles/dwmblocks  {};
  })
];

########################################
# My-programs , desktop-depencise, etc #
########################################
  # Self configure Pkgs
  environment.systemPackages = with pkgs; [
  
   helloworld #my test program
   #sleepc #my second test program
   #arrayst #test3 
   
# CUSTIME
  # dwmblocks 
   st 
   
# DESKTOP AND CRUCIAL PKG
   # desktop esecial pkgs: 
   pkgs.xmobar 
   pkgs.alsa-utils
   pkgs.xclip
   pkgs.system-config-printer
   pkgs.brightnessctl
   pkgs.xsecurelock
   pkgs.xorg.libX11
   pkgs.i3lock
   haskellPackages.xmonad-contrib haskell-language-server
   pkgs.sxhkd



];





########################
# WM AND DESKTOPS     #
########################

# Window-manager coustem impots

dwm.enable = true;
dwm.src = ./dotfiles/dwm2/dwm2.2;



#dwl.enable = true;
#dwl.src = ./dotfiles/dwl/dwl.nix;





# Xmonad
#services.xserver.windowManager.xmonad.enable = true;
#services.xserver.windowManager.xmonad.enableContribAndExtras = true;

#i3 wm 
#services.xserver.windowManager.i3.enable = true;

#BERRY WM
#services.xserver.windowManager.berry.enable = true;

#programs.dwl.enable = true;


#leftwm
#services.xserver.windowManager.leftwm.enable = true;   

#Stumpwm
#services.xserver.windowManager.stumpwm.enable = true;   

#Spectrwm 
#services.xserver.windowManager.spectrwm.enable = true;  
   
#Sway
 #programs.sway.enable = true; 
  
#Hyperland
programs.hyprland.enable = true; 

#River-wm
#programs.river.enable = true;

# niri
 #programs.niri.enable = true;

  # Enable the KDE Plasma Desktop Environment.
 #services.displayManager.sddm.enable = true;
   # services.displayManager.sddm.enable = true;



#  programs.niri.enable = true;

 #programs.niri.configFile = ./dotfiles/niri/config.kdl;
 #programs.niri = {
  #enable = true;
  
 #extraConfig = builtins.readFile ./dotfiles/niri/config.kdl;
#};   
 

  
 



   # Display managers
  services.displayManager.ly.enable = true; 
##    services.displayManager.gdm.enable = true; 
   #services.xserver.displayManager.lightdm.enable = true;
   
   #KDE PLASMA
   #services.desktopManager.plasma6.enable = true;
   # services.kdeconnect.enable = true;


# Cosmic desktop 
#services.displayManager.cosmic-greeter.enable = true;
services.desktopManager.cosmic.enable = true;



  # Configure keymap in X11
  services.xserver.xkb = {
    #exportConfiguration = true; #new
    layout = "us,pl";
    #xkbOptions = "grp:alt_shift_toggle";   # new
variant = "";
};


#########################################
#         CUPS AND PRINTERS             #
#########################################                                       
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    gutenprint
    gutenprintBin
    hplip
    hplipWithPlugin
    epson-escpr
    epson-escpr2
    brlaser
    brgenml1lpr
    brgenml1cupswrapper
    cnijfilter2
    carps-cups
    samsung-unified-linux-driver
    splix
  ];
  
  # Enable Avahi for network printer discovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

###########################
# SOUNDS, ALSA, PIPEWIRE  #
###########################
  
  # Enable sound with pipewire.
 services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };



####################
#  TOUCH SCREEN    #                       
####################
#Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Screen saving configuration - 30 minutes timeout
  # X11 screensaver and power management settings
  services.xserver.displayManager.sessionCommands = ''
    # Set screen blanking timeout (screen goes black after 30 minutes of inactivity)
    ${pkgs.xorg.xset}/bin/xset s 300 300
    # Set DPMS (Display Power Management Signaling) timeouts
    # Monitor standby after 35 minutes, suspend after 40 minutes, off after 45 minutes
    ${pkgs.xorg.xset}/bin/xset dpms 2100 2400 2700
  '';




#############################
# SCREEN LOCKING AND SAVE   # 
#############################
# Enable screen locking with xss-lock (works with X11 sessions)
  programs.xss-lock = {
    enable = false;
    # Use i3lock as the screen locker (simple black screen)
    lockerCommand = "${pkgs.i3lock}/bin/i3lock -c 000000";
  };

  # Laptop lid handling - Power Management Configuration
  services.logind = {
    # What to do when laptop lid is closed
    lidSwitch = "suspend";           # Options: suspend, hibernate, poweroff, ignore, lock
    lidSwitchDocked = "ignore";      # What to do when lid is closed and docked to external monitor
    lidSwitchExternalPower = "suspend";  # What to do when on external power
    
    # Power button behavior
    powerKey = "suspend";            # Options: suspend, hibernate, poweroff, ignore
    
    # Additional power management settings
    powerKeyLongPress = "poweroff";  # Long press power button
    rebootKey = "reboot";
    suspendKey = "suspend";
    hibernateKey = "hibernate";
  };

  # Enable suspend-then-hibernate (suspend for a while, then hibernate to save battery)
  # systemd.sleep.extraConfig = ''
  #  HibernateDelaySec=2h
  #  SuspendState=mem
  # '';
#systemd.sleep.settings = {
 # Sleep = {
  #  HibernateDelaySec=2h ;
   # SuspendState=mem ;
  #};
#};





# For Plasma/KDE users: KDE has its own power management
  # You can configure screen saving in System Settings > Power Management
  # or through the following service (uncomment if needed):

##################  
# Wifi -service  #
##################
programs.nm-applet.enable = false;


##################
# USERS COMPUTER #
##################
 # services.kdeconnect.enable = true;
  # New user account - rafal2
#  users.users.rafal2 = {
#    isNormalUser = true;
#    description = "Rafal 2";
#    extraGroups = [ "networkmanager" "wheel" ];  # Remove "wheel" if you don't want sudo access
#    packages = with pkgs; [
#      # User-specific packages can go here or in home-manager
#    ];
#  };
 


  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.rafal = {
    isNormalUser = true;
    description = "rafal";
    extraGroups = [ "networkmanager" "wheel""libvirtd" ];
    packages = with pkgs; [
      kdePackages.kate  
      #vim 
       

    #  thunderbird
    ];
  };

  # Home Manager configuration
  # Home Manager configuration is now handled via flake.nix

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  #nixpkgs.config.allowInsecure = true;

# List packages installed in system profile. To search, run:
  # $ nix search wget

  


  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.   
       






  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

#Modefien 2 May 2026
#system.stateVersion = "unstable";

nix.settings.experimental-features = ["nix-command" "flakes" ];

}

