CONFIG_FILE = configuration.nix
TARGET_DIR = /etc/nixos

all: switch

move:
	@echo "Copying $(CONFIG_FILE) to $(TARGET_DIR)..."
	sudo cp $(CONFIG_FILE) $(TARGET_DIR)

switch: move
	@echo "Rebuilding and switching to the new configuration..."
	sudo nixos-rebuild switch

clean:
	@echo "Cleaning up..."

.PHONY: all move switch clean

