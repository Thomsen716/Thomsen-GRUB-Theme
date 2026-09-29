#!/usr/bin/env bash
# Installs the Thomsen GRUB theme. Run with: sudo ./install.sh
set -e
[ "$(id -u)" -eq 0 ] || { echo "Run as root: sudo ./install.sh"; exit 1; }

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="/boot/grub/themes/thomsen"

mkdir -p "$DEST"
cp -r "$SRC"/* "$DEST"/
rm -f "$DEST/install.sh"

CFG=/etc/default/grub
cp "$CFG" "$CFG.bak"

set_kv () {  # key value
  if grep -qE "^#?\s*$1=" "$CFG"; then
    sed -i -E "s|^#?\s*$1=.*|$1=$2|" "$CFG"
  else
    echo "$1=$2" >> "$CFG"
  fi
}
set_kv GRUB_THEME "\"$DEST/theme.txt\""
set_kv GRUB_GFXMODE "1920x1080,auto"
set_kv GRUB_GFXPAYLOAD_LINUX "keep"
sed -i -E 's|^\s*GRUB_TERMINAL(_OUTPUT)?=console|#&|' "$CFG"

if command -v update-grub >/dev/null 2>&1; then
  update-grub
elif command -v grub-mkconfig >/dev/null 2>&1; then
  grub-mkconfig -o /boot/grub/grub.cfg
elif command -v grub2-mkconfig >/dev/null 2>&1; then
  grub2-mkconfig -o /boot/grub2/grub.cfg
fi
echo "Done. Reboot to see the theme. Backup of your old config: $CFG.bak"
