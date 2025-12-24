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
roles/           # Reusable Ansible roles
├── wifi/        # WiFi network management
├── nix/         # Nix installation
└── homebrew/    # Homebrew package manager
vars/
└── vault.yml    # Encrypted secrets (AES256)
site.yml         # Main playbook that uses all roles
```

## Adding New Roles

1. Create role structure: `mkdir -p roles/name/{tasks,handlers,templates,defaults}`
2. Create `roles/name/tasks/main.yml` with your tasks
3. Add role to `site.yml` with appropriate tags
4. Add command to `justfile` (optional)
5. Add secrets to `vars/vault.yml` if needed

See `roles/README.md` and existing roles for examples.
