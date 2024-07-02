# hxnativefiledialog

![](https://img.shields.io/github/repo-size/MAJigsaw77/hxnativefiledialog) ![](https://badgen.net/github/open-issues/MAJigsaw77/hxnativefiledialog) ![](https://badgen.net/badge/license/MIT/green)

Haxe/hxcpp @:native bindings for [Native File Dialog](https://github.com/mlabbe/nativefiledialog).

### Installation

You can install it through `Haxelib`
```bash
haxelib install hxnativefiledialog
```
Or through `Git`, if you want the latest updates
```bash
haxelib git hxnativefiledialog https://github.com/MAJigsaw77/hxnativefiledialog.git
```

### Dependencies

On ***Linux*** you need to install `gtk3` from your distro's package manager.

<details>
<summary>Commands list</summary>

#### Debian based distributions ([Debian](https://debian.org)):
```bash
sudo apt-get install libgtk-3-dev
```

#### Arch based distributions ([Arch](https://archlinux.org)):
```bash
sudo pacman -S gtk3
```

#### Fedora based distributions ([Fedora](https://getfedora.org)):
```bash
sudo dnf install gtk3
```

#### Red Hat Enterprise Linux (RHEL):
```bash
sudo dnf install gtk3
```

#### openSUSE based distributions ([openSUSE](https://www.opensuse.org)):
```bash
sudo zypper install gtk3
```

#### Gentoo based distributions ([Gentoo](https://gentoo.org)):
```bash
sudo emerge x11-libs/gtk+:3
```

#### Slackware based distributions ([Slackware](https://www.slackware.com)):
```bash
sudo slackpkg install gtk+3
```

#### Void Linux ([Void Linux](https://voidlinux.org)):
```bash
sudo xbps-install -S gtk+3
```

#### NixOS ([NixOS](https://nixos.org)):
```bash
nix-env -iA nixpkgs.gtk3
```

</details>

### Usage Example

Check out the [Samples Folder](samples/) for examples on how to use this library.

### Licensing

**hxnativefiledialog** is made available under the **MIT License**. Check [LICENSE](./LICENSE) for more information.

**Native File Dialog** is made available under the **zlib License**. Check [Native's File Dialog LICENSE](https://github.com/mlabbe/nativefiledialog/blob/master/LICENSE) for more information.
