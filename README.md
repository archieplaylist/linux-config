## Description

### My personal kde setup

**Debian install**

```bash
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y git
    git clone https://github.com/mariotani25/linux-config
    cd linux-config
    ./setup-deb.sh
    sudo reboot
```

**Update debian to latest kde-plasma package**

```bash
    cd deb-kde
    ./plasma-up.sh
    sudo reboot
    sudo apt update && sudo apt upgrade -y
```

**Arch install**

```bash
    sudo pacman -Sy git
    git clone https://github.com/mariotani25/linux-config
    cd linux-config
    ./setup-arch.sh
```
