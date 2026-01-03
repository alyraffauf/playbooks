# Syncthing Role

Ansible role to configure Syncthing using the CLI on client devices.

## Requirements

- Flatpak (for automatic installation if Syncthing not found)
- systemd for service management (only when using system package)

## Installation Detection & Fallback

The role follows this order:

1. **Check for system binary** - Prefers `syncthing` in PATH if available
2. **Check for flatpak** - Falls back to `com.github.zocker_160.SyncThingy` if system binary not found
3. **Install flatpak** - Automatically installs from Flathub if neither exists

This means the system package is preferred, but the role will ensure Syncthing is available one way or another.

## Version Support

The role supports both Syncthing v1.x and v2.x series:

- **v1.x**: Uses flag-based syntax (`syncthing --device-id`)
- **v2.x**: Uses subcommand syntax (`syncthing device-id`)

Version is detected automatically and commands are adapted accordingly.

## Configuration

Configuration is stored in `vars/syncthing.yml`.

See the examples in `defaults/main.yml` for the structure.

## Usage

### Configure syncthing folders

```bash
ansible-playbook site.yml --tags syncthing
```

## Behavior Differences

### System Package Installation (Preferred)
- Manages systemd user service (`syncthing.service`)
- Uses direct `syncthing` commands
- Waits for port 8384 to be available

### Flatpak Installation (Fallback)
- Skips systemd service management (flatpak handles this)
- Uses `flatpak run --command=syncthing` wrapper
- Waits for port 8384 to be available

## Getting Your Device ID

```bash
# v2.x or flatpak
syncthing device-id
# or
flatpak run --command=syncthing com.github.zocker_160.SyncThingy device-id

# v1.x
syncthing --device-id
```

Or check the Syncthing web UI under Actions → Show ID.
