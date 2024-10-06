# SNS NixOs

This is my general NixOs configuration.

## How to use

There is a `Makefile` which will use the `configuration.nix` in this repo, replacing
`/etc/nixos/configuration.nix`, and running `nixos-rebuild switch`.

Assuming you have a base NixOs install, you can run the Makefile using `nix-shell`:

```bash
nix-shell -p gnumake --run "make"
```

Once you've built a generation using this configuration, you'll have GNU make installed, and can simply run `make` in this directory.

## What it does

I favour a very simple environment.  I use the i3 tiling window manager, neovim, and alacritty.  For day-to-day work communication I have Zoom and Slack
and for personal knowledge management and team documentation, I use Obsidian.  My primary development language is Rust, and to keep an eye on the health
of my system, I use htop and glances.
