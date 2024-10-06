# SNS NixOs

This is my general NixOs configuration.  This is very much both an experiment and
a work in progress.  Feel free to crib anything from this that you find useful.

## Features

- Distinguishes between legacy bios and UEFI
- Creates an sns user
- Installs my default i3 window manager
- Installs tools that I use frequently

## How to use

Given a machine running NixOs, clone this repo and run the Makefile:

```bash
nix-shell -p git --run "git clone https://github.com/Atalanta/nixos"
cd nixos
nix-shell -p gnumake --run "make"
```

If your intention is a fresh install, you will need to set a password for the sns user before you can log in.

Once you've built a generation using this configuration, you'll have GNU make installed, and can continue to use the repo as the base for your future configurations, simply running `make` in this directory to do the rebuild and switch.

## Limitations

There are some things I haven't yet brought into Nix configuration, such as specific i3 configuration, and neovim configuration.  That should follow in due course.

There are some unpackaged tools that I need, and I've not yet ported this installation to Nix.

I am very much a novice in the Nix language, and this must not be taken in any way to be indicative of best practice.

I have not yet worked out how to test the config other than by running it and seeing if it fails.
