# prime config

- Automatically switches between integrated and NVIDIA GPU based on power source
- Uses bbswitch for GPU power control with fine-grained dynamic power management
- Intel GPU uses modesetting driver with DRI 3

## Files

- **`optimus-manager.conf`**
  - `startup_mode = auto` — selects GPU mode based on battery/AC state
  - `startup_auto_battery_mode = integrated` — uses Intel on battery
  - `startup_auto_extpower_mode = nvidia` — uses NVIDIA on AC power
  - `switching = bbswitch` — powers off NVIDIA card via bbswitch kernel module
  - `pci_power_control = yes` — enables PCI power management in integrated mode
  - `auto_logout = no` — GPU switch applies on next login instead of forcing logout
  - `dynamic_power_management = fine` — NVIDIA enters low power when no GPU work is submitted
  - `modeset = yes` — enables modesetting for Prime Sync (tear-free)
  - `PAT = yes` — enables Page Attribute Table for better CPU performance
  - `intel.driver = modesetting` — uses kernel modesetting driver for Intel
  - `intel.DRI = 3` — DRI version 3 for Intel

## Docs

- [optimus-manager Configuration](https://github.com/Askannz/optimus-manager/wiki/Configuration)
