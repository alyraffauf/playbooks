# Ansible Playbook Runner

# Show all commands
default:
    @just --list

# List available roles
list:
    @ls -1 roles/ | grep -v README.md

# Run a specific role
run role:
    ansible-playbook site.yml --tags {{ role }} --ask-become-pass --ask-vault-pass

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
