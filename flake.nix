{
  description = "My NixOS system with Home Manager and stable/unstable packages";

  inputs = {
    # Stable channel (25.11)
    nixpkgs.url = "nixpkgs/nixos-26.05";




    # Unstable channel
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    # Home Manager (using stable branch)
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };


  #outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, my-c-program, ... }:

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
   let
    lib = nixpkgs.lib;
    system = "x86_64-linux";

    # Configuration for allowing unfree packages
    config = {
      allowUnfree = true;
    };

    # Stable packages with config
    pkgs = import nixpkgs {
      inherit system;
      inherit config;
    };

    # Unstable packages with config (allows unfree)
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      inherit config;
    };

   in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;

        # Make both stable and unstable packages available
        specialArgs = {
          inherit pkgs-unstable;
        };

        modules = [
	./configuration.nix
        ./pkgs/stable.pkgs.nix
        ./pkgs/unstable.pkgs.nix
        ./pkgs/art-music-pkgs.nix 
        ./pkgs/devel-pkgs.nix
        ./pkgs/importen-tool-pkg.nix
	./pkgs/office-imige-pkgs.nix
        ./pkgs/emacs-pkgs.nix
         ./pkgs/test-temporarily-pkgs.nix
        ./prywatne/firewall-ip-settings.nix	
        ./dotfiles/st/st-declare.nix
        ./dotfiles/xmonad.conf/xmonad-declar.nix
        ./virtual-machines.nix
     # ./auto-login.nix
       #./my-programs/network-rofi/rofi-network.nix      
 # Make home-manager available as a NixOS module
          home-manager.nixosModules.home-manager
          {  
	    home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.rafal = import ./home.nix;
          }
        ];
      };
    };
  };
}

# Notes and commments
# xmonad is declare in home.nix and .#./dotfiles/xmonad.conf/xmonad-declar.nix
 
