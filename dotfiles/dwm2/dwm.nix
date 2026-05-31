# modules/dwm.nix
{ pkgs, lib, config, ... }:

{
  options = {
    dwm = {
      enable = lib.mkEnableOption "Enable DWM window manager";
      src = lib.mkOption {
        type = lib.types.path;
        description = "Source path for custom DWM";
        default = ./dwm2.2; # Adjust default path as needed
      };
    };
  };

  config = lib.mkIf config.dwm.enable {
    services.xserver.windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs (_: {
        src = config.dwm.src;
      });
     extraSessionCommands = ''
        mpv ~/Sounds/StartupWMsound &
        conky &
        dwmblocks &
      '';
    };
  };
}   
