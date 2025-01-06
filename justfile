# List all the just command
default:
  @just --list

# Test
[group('nix')]
test:
  nixos-rebuild test --flake . --show-trace --print-build-logs --verbose

# Update flake inputs
[group('flake')]
up:
  nix flake update

# Upadte specific input
[group('flake')]
up-i input:
  nix flake update {{input}}

# Rebuild system
[group('nix')]
switch:
  sudo nixos-rebuild switch --flake .

# Rebuild specific system
[group('nix')]
switch-i input:
  sudo nixos-rebuild switch --flake .#{{input}}

# List all generations of the system profile
[group('nix')]
history:
  nix profile history --profile /nix/var/nix/profiles/system

# Remove all generations older than 7 days
[group('nix')]
clean:
  sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system

# Garbage collect all unused nix store
[group('nix')]
gc:
  # for system
  sudo nix-collect-garbage --delete-older-than 7d
  # for the user homemanager
  nix-collect-garbage --delete-older-than 7d
