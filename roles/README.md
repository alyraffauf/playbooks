# Ansible Roles

This directory contains reusable Ansible roles for system configuration.

## Available Roles

### `wifi`
Configures NetworkManager WiFi connections for WPA2-PSK, open, and EAP networks.

**Requirements:**
- NetworkManager installed
- Root/sudo access
- Network credentials in `vars/vault.yml`

**Variables:**
- `networks` - List of network configurations from vault

**Tags:** `wifi`

### `nix`
Installs Determinate Nix package manager with flakes enabled.

**Requirements:**
- Systemd (for daemon management)
- Internet connection

**Variables:**
- `nix_installer_url` - URL to the installer script (default: latest)
- `nix_installer_version` - Version to install (default: "latest")
- `nix_installer_path` - Temporary path for installer

**Tags:** `nix`

### `homebrew`
Installs or updates Homebrew package manager on Linux.

**Requirements:**
- Linux system
- Internet connection

**Variables:**
- `homebrew_installer_url` - URL to the installer script
- `homebrew_installer_path` - Temporary path for installer
- `homebrew_prefix` - Installation directory (default: /home/linuxbrew/.linuxbrew)

**Tags:** `homebrew`

## Role Structure

Each role follows the standard Ansible structure:

```
roles/
└── role_name/
    ├── tasks/         # Main tasks (main.yml required)
    ├── handlers/      # Event handlers
    ├── templates/     # Jinja2 templates
    ├── files/         # Static files
    ├── vars/          # Role variables
    ├── defaults/      # Default variables (lowest precedence)
    └── meta/          # Role metadata and dependencies
```

## Usage

Roles are invoked via `site.yml` or can be run individually using tags:

```bash
# Run a specific role
ansible-playbook site.yml --tags wifi --ask-become-pass --ask-vault-pass

# Run multiple roles
ansible-playbook site.yml --tags "nix,homebrew" --ask-become-pass

# Run all roles
ansible-playbook site.yml --ask-become-pass --ask-vault-pass
```

## Creating New Roles

1. Create the role directory structure:
   ```bash
   mkdir -p roles/myRole/{tasks,handlers,templates,defaults}
   ```

2. Create `roles/myRole/tasks/main.yml` with your tasks

3. Add default variables to `roles/myRole/defaults/main.yml` (optional)

4. Add the role to `site.yml`:
   ```yaml
   - role: myRole
     become: true  # if sudo required
     tags: myRole
   ```

5. Add a justfile command (optional):
   ```
   myRole:
       ansible-playbook site.yml --tags myRole
   ```

## Testing Roles

Check syntax without making changes:
```bash
ansible-playbook site.yml --check --syntax-check
```

Run in check mode (dry run):
```bash
ansible-playbook site.yml --tags roleName --check
```
