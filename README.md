# 🎨 Thomsen GRUB Theme

A custom GRUB boot theme with a clean Thomsen-style design.

---

## 🛠️ Requirements

* GRUB 2
* Linux system using GRUB
* 1920×1080 display

---

## 📖 Manual Installation

### 1. Copy theme files

```bash
sudo mkdir -p /boot/grub/themes/thomsen
sudo cp -r ./* /boot/grub/themes/thomsen/
```

### 2. Configure GRUB

Open `/etc/default/grub` and add:

```text
GRUB_THEME="/boot/grub/themes/thomsen/theme.txt"
GRUB_GFXMODE=1920x1080
```

### 3. Regenerate GRUB

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

On some distributions:

```bash
sudo update-grub
```

---

## ⚙️ Customisation

Icons are matched to each boot entry using its `--class`.

Custom icons can be added or replaced in:

```text
icons/
```

The theme uses **40×40 px** icons.

For another resolution, adjust the pixel values in `theme.txt`.

---

## 🗑️ Uninstall

Remove the following line from `/etc/default/grub`:

```text
GRUB_THEME="/boot/grub/themes/thomsen/theme.txt"
```

Then remove the theme:

```bash
sudo rm -rf /boot/grub/themes/thomsen
```

Finally regenerate GRUB:

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

---


Personal project by **Thomsen716**.
