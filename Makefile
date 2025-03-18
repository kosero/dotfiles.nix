.PHONY: switch
switch:
	home-manager switch --flake .#kosero

.PHONY: clean
clean:
	nix-collect-garbage -d
