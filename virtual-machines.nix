# VIRTUALIZATION
#





{ config, pkgs, pkgs-unstable, ... }:
{

# vistualisation
virtualisation.virtualbox.host.enable = true;
virtualisation.virtualbox.host.enableExtensionPack = true;
users.extraGroups.vboxusers.members = [ "rafal" ];
# NEW LINE 27.luty.2025
# KVM/QEMU virtualisation
virtualisation.libvirtd.enable = true;
programs.virt-manager.enable = true;


environment.systemPackages = with pkgs; [
pkgs.virt-manager 



];










}
