# Ansible Playbook Runner

# Show all commands
default:
    @just --list

# Run all playbooks
all:
    ansible-playbook site.yml --ask-become-pass --ask-vault-pass

# Install/upgrade Homebrew
brew:
    ansible-playbook site.yml --tags homebrew

# Check playbooks
check:
    ansible-playbook site.yml --check --syntax-check

# Set up NFS mounts
nfs:
    ansible-playbook site.yml --tags nfs --ask-become-pass

# Install determinate-nix
nix:
    ansible-playbook site.yml --tags nix --ask-become-pass

# Change password and re-encrypt vault
rekey-vault:
    ansible-vault rekey vars/vault.yml

# Install and configure Tailscale
tailscale:
    ansible-playbook site.yml --tags tailscale --ask-become-pass --ask-vault-pass

# Manage vault
vault:
    ansible-vault edit vars/vault.yml

# Set up WiFi networks
wifi:
    ansible-playbook site.yml --tags wifi --ask-become-pass --ask-vault-pass
