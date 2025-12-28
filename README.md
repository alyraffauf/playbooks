# Ansible Configuration

Declarative system configuration with Ansible.

## Usage

```bash
just                # Show all commands
just list           # List available roles
just all            # Run all playbooks
just check          # Validate playbooks
just vault          # Edit encrypted secrets
just rekey-vault    # Change vault password
```

## Structure

```
roles/              # Reusable Ansible roles (see: just list)
vars/
└── vault.yml       # Encrypted secrets (AES256)
site.yml            # Main playbook
```

## Configuration

- `vars/vault.yml` - Encrypted credentials (edit with `just vault`)
- `vars/nfs_mounts.yml` - NFS mount definitions
- `roles/*/defaults/main.yml` - Default variables for each role

See `roles/README.md` for more details.