{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "dwmblocks";
  version = "0.1.0";

  src = ./.;

  buildInputs = with pkgs; [
    xorg.libX11
  ];

  buildPhase = ''
    cp blocks.def.h blocks.h
    ${pkgs.stdenv.cc}/bin/cc -o dwmblocks dwmblocks.c \
      -pedantic -Wall -Wno-deprecated-declarations -Os \
      -lX11 \
      -I${pkgs.xorg.libX11}/include \
      -L${pkgs.xorg.libX11}/lib
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -D -m 755 dwmblocks $out/bin/dwmblocks
  '';

  meta = with pkgs.lib; {
    description = "Modular status bar for dwm";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
