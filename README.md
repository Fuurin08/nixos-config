# NixOS
## flake
更新
```
nix flake update <configuration_file_patch>
sudo nixos-rebuild switch
```
## home-manager
第一次使用时
```
nix-shell -p home-manager
home-manager switch --flake '<file_patch>#user_name'
```
后续使用
```
home-manager switch --flake '<file_patch>#user_name'
```
