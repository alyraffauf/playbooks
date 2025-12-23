# Ansible Configuration

Declarative system configuration with Ansible.

## Usage

```bash
just wifi        # Configure WiFi networks
just nix         # Install Nix package manager
just all         # Run all playbooks
just check       # Validate playbooks
just vault       # Edit encrypted secrets
just rekey-vault # Change vault password
```

## Structure

```
playbooks/
├── wifi/        # WiFi network management
└── nix/         # Nix installation
vars/
└── vault.yml    # Encrypted secrets (AES256)
```

## Adding Playbooks

1. Create `playbooks/name/playbook.yml`
2. Add command to `justfile`
3. Add secrets to `vars/vault.yml` if needed

See existing playbooks for examples.
