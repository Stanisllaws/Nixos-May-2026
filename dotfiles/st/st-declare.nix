    ########################
    # ST COUSTOME BINERY   #
    ########################

{ config, pkgs, ...}:
{

nixpkgs.config.packageOverrides = pkgs: {
  st = pkgs.st.overrideAttrs (oldAttrs:
    let
    in {
      src = ./st.2;
      buildInputs = (oldAttrs.buildInputs or []) ++ [ pkgs.harfbuzz ];
    });
};

 environment.systemPackages = with pkgs; [
 st

 ];

 }
