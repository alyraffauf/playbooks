# Ansible Roles

Reusable roles for system configuration.

## Available Roles

See available roles:
```bash
just list
```

## Usage

Run roles individually using just:

```bash
just brew          # Install/upgrade Homebrew
just nfs           # Set up NFS mounts
just nix           # Install Nix
just tailscale     # Install and configure Tailscale
just wifi          # Configure WiFi networks
just all           # Run all roles
```

Or use ansible-playbook directly with tags:

```bash
ansible-playbook site.yml --tags nfs --ask-become-pass
```

## Configuration

- `vars/vault.yml` - Encrypted credentials (WiFi passwords, Tailscale auth key)
- `vars/nfs_mounts.yml` - NFS mount definitions
- `roles/*/defaults/main.yml` - Default variables for each role

Edit vault:
```bash
just vault
```
