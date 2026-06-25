#!/bin/bash
# Workaround for btintel_pcie (Lunar Lake PCIe BT, 0000:00:14.7) failing to
# enter D2 power state on suspend, returning -EBUSY and blocking s2idle.
# The driver also fails to initialize (no HCI device registered), so rfkill
# is ineffective. Unbind the driver entirely before sleep and rebind after.

DEV=0000:00:14.7
DRIVER=/sys/bus/pci/drivers/btintel_pcie

case "$1" in
    pre)
        [[ -e "$DRIVER/$DEV" ]] && echo "$DEV" > "$DRIVER/unbind"
        ;;
    post)
        [[ ! -e "$DRIVER/$DEV" ]] && echo "$DEV" > "$DRIVER/bind"
        ;;
esac
