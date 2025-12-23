# Ansible Playbook Runner

# Show all commands
default:
    @just --list

# Install/upgrade Homebrew
brew:
    ansible-playbook playbooks/homebrew/playbook.yml

# Install determinate-nix
nix:
    ansible-playbook playbooks/nix/playbook.yml --ask-become-pass

# Set up WiFi networks
wifi:
    ansible-playbook playbooks/wifi/playbook.yml --ask-become-pass --ask-vault-pass

# Run all playbooks
all:
    ansible-playbook site.yml --ask-become-pass --ask-vault-pass

# Check playbooks
check:
    ansible-playbook site.yml --ask-vault-pass --check --syntax-check

# Manage vault
vault:
    ansible-vault edit vars/vault.yml

# Change password and re-encrypt vault
rekey-vault:
    ansible-vault rekey vars/vault.yml
