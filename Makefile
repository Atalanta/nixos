NIX_CONF_DIR ?= /etc/nixos
SOURCE_DIR ?= .

all: switch

move:
	@echo "Copying config files to $(NIX_CONF_DIR)..."
	sudo rsync --archive \
	 --exclude='.git' \
	 --exclude='Makefile' \
	 --exclude='README*' \
	 $(SOURCE_DIR) $(NIX_CONF_DIR)/
	@echo "Success!"

switch: move
	@echo "Rebuilding and switching to the new configuration..."
	sudo nixos-rebuild switch || { echo "nixos-rebuild failed"; exit 1; }

clean:
	@echo "Cleaning up..."

.PHONY: all move switch clean

