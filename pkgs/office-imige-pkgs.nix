# My basic office tools and imige viewars  
{pkgs, ...}:
{
environment.systemPackages = with pkgs; [


# Stabile
pkgs.zathura #minimal pdf viewer
pkgs.onlyoffice-desktopeditors # office suit
pkgs.libreoffice-qt6-fresh
kdePackages.gwenview  #imige viewer
pkgs.kdePackages.okular #pdf viewer
pkgs.xfce.xfce4-screenshooter
pkgs.calcurse
pkgs.nemo

# Unstabile





];
}
