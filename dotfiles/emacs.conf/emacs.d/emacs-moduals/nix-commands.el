;;NIX COMMANDS
;;/nix-commands.el

(defun nix-test ()
  "Run nixos-rebuild dry-activate"
  (interactive)
  (let ((default-directory "/sudo::/"))
    (shell-command "nixos-rebuild dry-activate --flake /etc/nixos/"
                   "*NixOS Rebuild Output*")))

(global-set-key (kbd "C-c n") 'nix-test)

(defun rebuild-nix ()
  "Run nixos-rebuild switch --flake "
  (interactive)
  (let ((default-directory "/sudo::/"))
    (shell-command "nixos-rebuild switch --flake /etc/nixos/"
                   "*NixOS Rebuild Output*")))

(global-set-key (kbd "C-c r") 'rebuild-nix)





