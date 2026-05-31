{ config, pkgs, pkgs-unstable, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rafal2";
  home.homeDirectory = "/home/rafal2";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Add packages for rafal2 here
    pkgs.neovim
    pkgs.git
    pkgs.firefox
    pkgs.htop
    pkgs.starship
    # pkgs-unstable.wrape-terminal 
    # Example unstable packages
    # pkgs-unstable.vscode
    
    # Custom scripts for rafal2
    (pkgs.writeShellScriptBin "update-system" ''
      #!/bin/bash
      cd /etc/nixos && sudo nixos-rebuild switch --flake .#
    '')
    
    (pkgs.writeShellScriptBin "clean-nix" ''
      #!/bin/bash
      sudo nix-collect-garbage --delete-older-than 7d
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Bash configuration
  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      ll = "ls -l";
      la = "ls -la";
      grep = "grep --color=auto";
      ".." = "cd ..";
      "..." = "cd ../..";
      
      # System management aliases
      update = "cd /etc/nixos && sudo nixos-rebuild switch --flake .#";
      nix-clean = "sudo nix-collect-garbage --delete-older-than 7d";
      nix-gen = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
    };
    bashrcExtra = ''
      # Custom bash configuration
      export HISTCONTROL=ignoredups:erasedups
      export HISTSIZE=10000
      export HISTFILESIZE=10000
      
      # Append to history file, don't overwrite
      shopt -s histappend
      
      # Check window size after each command
      shopt -s checkwinsize
      
      # Add Starship prompt
      eval "$(starship init bash)"
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
