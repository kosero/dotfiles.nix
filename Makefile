.PHONY: home
switch:
	home-manager switch --flake .#kosero

.PHONY: nixos
nixos:
	nixos-rebuild switch --flake .#kosero

.PHONY: clean
clean:
	nix-collect-garbage -d

