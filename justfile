# Ansible Playbook Runner

# Show all commands
default:
    @just --list

# Install/upgrade Homebrew
brew:
    ansible-playbook site.yml --tags homebrew

# Install determinate-nix
nix:
    ansible-playbook site.yml --tags nix --ask-become-pass

# Set up WiFi networks
wifi:
    ansible-playbook site.yml --tags wifi --ask-become-pass --ask-vault-pass

# Set up NFS mounts
nfs:
    ansible-playbook site.yml --tags nfs --ask-become-pass

# Run all playbooks
all:
    ansible-playbook site.yml --ask-become-pass --ask-vault-pass

# Check playbooks
check:
    ansible-playbook site.yml --check --syntax-check

# Manage vault
vault:
    ansible-vault edit vars/vault.yml

# Change password and re-encrypt vault
rekey-vault:
    ansible-vault rekey vars/vault.yml
