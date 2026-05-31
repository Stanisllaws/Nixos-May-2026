self: super: {
  st = super.st.overrideAttrs (oldAttrs: {
    src = ./.;
    buildInputs = (oldAttrs.buildInputs or []) ++ [ self.harfbuzz self.fontconfig ];
  });
}   
