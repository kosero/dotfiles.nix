.PHONY: home
switch:
	home-manager switch --flake .#kosero

.PHONY: nixos
nixos:
	sudo mkdir -p /etc/nixos/modules
	sudo cp ./system/configuration.nix /etc/nixos/configuration.nix
	sudo cp -r ./system/modules /etc/nixos
	sudo nixos-rebuild switch

.PHONY: clean
clean:
	nix-collect-garbage -d

