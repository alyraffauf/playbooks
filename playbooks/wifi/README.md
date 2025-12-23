# WiFi Network Management

Automated WiFi configuration using Ansible and NetworkManager.

## Quick Start

```bash
just wifi    # Will prompt for vault password and sudo password
```

## Configuration

All networks are stored in encrypted `vault.yml`:

```yaml
networks:
  # WPA2-PSK (password protected)
  - type: wpa2
    ssid: "MyHomeNetwork"
    password: "my-password"

  # Open network (no password)
  - type: open
    ssid: "Coffee Shop WiFi"

  # WPA2-Enterprise (802.1x/EAP)
  - type: eap
    ssid: "Corporate WiFi"
    identity: "username@company.com"
    password: "my-password"
    phase2_auth: "mschapv2"
```
