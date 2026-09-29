THOMSEN GRUB THEME  (1920x1080)

Install:   sudo ./install.sh
Manual:    copy this folder to /boot/grub/themes/thomsen, then in /etc/default/grub set
             GRUB_THEME="/boot/grub/themes/thomsen/theme.txt"
             GRUB_GFXMODE=1920x1080
           and regenerate: sudo grub-mkconfig -o /boot/grub/grub.cfg   (or update-grub)

Icons are matched to each entry's --class (icons/arch.png, windows.png, ubuntu.png ...).
Replace any PNG in icons/ with your own 40x40 icon to customise it.
Other resolution? Change the pixel values in theme.txt (or ask for a regenerated version).
Uninstall: remove the GRUB_THEME line, delete /boot/grub/themes/thomsen, regenerate the config.
