# Nix configuration
Incomplete configuration for Nix Systems. Uses home-manager.

# Usage
## NixOS
1. Make a directory for your new machine in `machines`. We will refer to this as `<name>`.
2. Install NixOS and move resulting `configuration.nix` and `hardware-configuration.nix`
   into the `machines/<name>`.
3. Symlink the moved `configuration.nix` to `/etc/nixos/configuration.nix`.
4. Add the home-manager channel. Here we use the 20.03 release.
```
# nix-channel --add https://github.com/rycee/home-manager/archive/release-20.03.tar.gz home-manager
# nix-channel --update
```
5. Add some things to `configuration.nix`:
```
# Add this import ALONG with your other imports
imports = [ <home-manager/nixos> ];
```
You should then add a user to `home-manager.users` with modules that you want to import.
Look at notes for stuff that you might want to add to `configuration.nix` to get some stuff to work.

6. `nixos-rebuild`
## Non-NixOS
haven't tried

# Directory Structure
| Path                   | Description |
| ----                   | -----------
| `machines/`            | expressions for individual machines |
| `modules/`             | modular configuration modules that can be shared |
| `modules/system/`      | system configuration modules pertaining to `configuration.nix` |
| `modules/home/`        | configuration modules for home-manager |
| `modules/home/custom/` | self-made modules that are not in home-manager's configuration options |

# Notes
## Stuff that you might want to add into `configuration.nix`
```
# Used to enable xsession/wayland
hardware.opengl.enable = true;

# Used to enable GTK for ca.desrt.dconf
services.dbus.packages = with pkgs; [ gnome3.dconf ];
```
