# Modules List

## System Modules

### system.config

Contains the system configurations.

#### system.config.default

Contains the default system configurations.

- **system.config.default.default**: Contains the default system configurations (recommended settings).
- **system.config.default.fonts**: Contains configurations for fonts.
- **system.config.default.locale**: Contains configurations for language and locale.
- **system.config.default.nixconfig**: Contains configurations regarding the Nix version and unfree packages.
- **system.config.default.systemd**: Contains configurations for systemd.
- **system.config.default.users**: Contains configurations for users.

#### system.config.hardware

Contains hardware configurations for peripherals, network manager, audio, etc.

- **system.config.hardware.backlight**: Contains configurations for backlight.
- **system.config.hardware.bluetooth**: Contains configurations for Bluetooth.
- **system.config.hardware.graphics**: Contains default configurations for graphic acceleration.
- **system.config.hardware.iwd**: Contains configurations for wireless networks management through iwd.
- **system.config.hardware.kernel-rust**: Contains configurations for the kernel with Rust support.
- **system.config.hardware.networkmanager**: Contains configurations for the NetworkManager.
- **system.config.hardware.pipewire**: Contains configurations for the PipeWire audio server.
- **system.config.hardware.systemdboot**: Contains configurations for the systemd-boot bootloader.
- **system.config.hardware.touchpad**: Contains configurations for the touchpad.
- **system.config.hardware.wpa_supplicant**: Contains configurations for network support through wpa_supplicant.

#### system.config.optimization

Contains system optimization configurations.

- **system.config.optimization.default**: Contains general optimization configurations.
- **system.config.optimization.optimize**: Contains specific configurations to improve system performance and optimize nix store.
- **system.config.optimization.zram**: Contains configurations for managing ZRAM (RAM compression).

### system.gui

Contains configurations for the graphical interface.

#### system.gui.desktop

Contains configurations for various desktop environments.

- **system.gui.desktop.budgie**: Configurations for the Budgie desktop environment.
- **system.gui.desktop.cde**: Configurations for the CDE desktop environment.
- **system.gui.desktop.cinnamon**: Configurations for the Cinnamon desktop environment.
- **system.gui.desktop.cosmic**: Configurations for the Cosmic desktop environment.
- **system.gui.desktop.deepin**: Configurations for the Deepin desktop environment.
- **system.gui.desktop.gnome**: Configurations for the GNOME desktop environment.
- **system.gui.desktop.hyprland**: Configurations for the Hyprland window manager.
- **system.gui.desktop.lumina**: Configurations for the Lumina desktop environment.
- **system.gui.desktop.mate**: Configurations for the MATE desktop environment.
- **system.gui.desktop.pantheon**: Configurations for the Pantheon desktop environment.
- **system.gui.desktop.plasma**: Configurations for the KDE Plasma desktop environment.
- **system.gui.desktop.xfce**: Configurations for the XFCE desktop environment.

#### system.gui.display

Contains configurations for display managers.

- **system.gui.display.greetd**: Configurations for the greetd display manager.
- **system.gui.display.lightdm**: Configurations for the LightDM display manager.
- **system.gui.display.sddm**: Configurations for the SDDM display manager with the Chili theme.

#### system.gui.server

Contains configurations for graphical servers.

- **system.gui.server.wayland**: Configurations for the Wayland graphical server.
- **system.gui.server.x11**: Configurations for the X11 graphical server.

#### system.gui.style

Contains style configurations for the graphical environment.

- **system.gui.style.stylix**: Custom style configurations.

### system.hardware

Contains specific configurations for various hardware types.

#### system.hardware.apple

Configurations specific to Apple Silicon and T2 devices.

- **system.hardware.apple.apple-silicon**: Contains configurations for Apple Silicon devices.
  - **system.hardware.apple.apple-silicon.modules**: Contains configurations for Apple Silicon-related modules like kernel, mesa, asahi-audio, etc.
  - **system.hardware.apple.apple-silicon.packages**: Contains specific packages for Apple Silicon.
  - **system.hardware.apple.apple-silicon.applegpu**: Contains additional configurations for the Apple GPU.
  - **system.hardware.apple.apple-silicon.applefirmware**: Contains the path for Apple Silicon firmware.
- **system.hardware.apple.apple-t2**: Contains configurations for devices with the Apple T2 chip.

#### system.hardware.intel

Configurations specific to Intel hardware.

- **system.hardware.intel.intelgpu**: Configurations for Intel GPU.

#### system.hardware.nvidia

Configurations specific to Nvidia hardware.

- **system.hardware.nvidia.cuda**: Configurations for CUDA support.
- **system.hardware.nvidia.cudnn**: Configurations for CUDNN support.
- **system.hardware.nvidia.nvidiagpu**: General configurations for Nvidia GPU.

#### system.hardware.virtual

Configurations specific to virtual environments.

- **system.hardware.virtual.qemuguest**: Configurations for QEMU guest support.

### system.packages

Contains the system's packages.

- **system.packages.base**: Basic system packages.
- **system.packages.steam**: Configurations for Steam.

### system.security

Contains configurations for system security.

- **system.security.default-gui**: Security configurations for GUI.
- **system.security.default**: Main security configurations.
- **system.security.dnscrypt**: Configurations for DNSCrypt.
- **system.security.gnome-keyring**: Configurations for GNOME Keyring (necessary for GUI).
- **system.security.gpg**: Configurations for GPG.
- **system.security.openssh**: Configurations for OpenSSH.
- **system.security.pam**: Configurations for PAM.
- **system.security.polkit**: Configurations for Polkit (with service, useful for Hyprland).
- **system.security.rtkit**: Configurations for RealtimeKit.
- **system.security.sudo**: Configurations for sudo using Rust.

### system.services

Contains configurations for system services.

#### system.services.calculus

Contains configurations for computing.

- **system.services.calculus.slurm**: Configurations for the Slurm cluster manager.

#### system.services.container

Contains container configurations.

#### system.services.desktop

Contains configurations for desktop services.

- **system.services.desktop.dbus**: Configurations for D-Bus.
- **system.services.desktop.dconf**: Configurations for DConf.
- **system.services.desktop.default**: Main configurations for the desktop environment.

#### system.services.packaging

Contains configurations for packaging.

- **system.services.packaging.appimage**: Configurations for AppImage support.
- **system.services.packaging.flatpak**: Configurations for Flatpak support.

#### system.services.server

Contains configurations for server services.

- **system.services.server.cockpit**: Configurations for Cockpit.

#### system.services.systemd

Contains configurations for systemd services.

- **system.services.systemd.nvidia-monitoring**: Configurations for Nvidia monitoring via systemd.

#### system.services.transemu

Contains configurations for emulators.

- **system.services.transemu.box64-16k**: Configurations for the Box64 emulator with 16k support (Asahi kernel paging).
- **system.services.transemu.box64**: Configurations for the Box64 emulator (x64 support on aarch64).
- **system.services.transemu.waydroid**: Configurations for Waydroid (Android support).
- **system.services.transemu.wine**: Configurations for Wine (Windows support).

#### system.services.virtualization

Contains configurations for virtualization.

- **system.services.virtualization.distrobox**: Configurations for Distrobox.
- **system.services.virtualization.docker**: Configurations for Docker.
- **system.services.virtualization.docker-nvidia**: Configurations for Docker with Nvidia GPU support.
- **system.services.virtualization.podman**: Configurations for Podman.
- **system.services.virtualization.virtualization**: Main configurations for KVM/QEMU virtualization.

## User Modules

### user.config

Contains user configurations.

- **user.config.hmconfig**: Contains the main configuration for home manager (hmconfig.nix).

### user.gui

Contains user graphical interface configurations.

#### user.gui.budgie

Configurations for the Budgie desktop environment.

- **user.gui.budgie.budgie**: Specific configurations for Budgie.

#### user.gui.cde

Configurations for the CDE desktop environment.

- **user.gui.cde.cde**: Specific configurations for CDE.

#### user.gui.cinnamon

Configurations for the Cinnamon desktop environment.

- **user.gui.cinnamon.cinnamon**: Specific configurations for Cinnamon.

#### user.gui.config

General graphical interface configurations.

#### user.gui.cosmic

Configurations for the Cosmic desktop environment.

- **user.gui.cosmic.cosmic**: Specific configurations for Cosmic.

#### user.gui.deepin

Configurations for the Deepin desktop environment.

- **user.gui.deepin.deepin**: Specific configurations for Deepin.

#### user.gui.gnome

Configurations for the GNOME desktop environment.

- **user.gui.gnome.extensions**: Configurations for GNOME extensions.
  - **user.gui.gnome.extensions.blurmyshell**: Configurations for the Blur My Shell extension.
  - **user.gui.gnome.extensions.dashtodock**: Configurations for the Dash to Dock extension.
- **user.gui.gnome.gnome**: Specific configurations for GNOME.

#### user.gui.hyprland

Configurations for the Hyprland window manager.

- **user.gui.hyprland.hyprland**: General configurations for Hyprland.
- **user.gui.hyprland.hypr**: Configurations for services that are part of the Hypr project.
  - **user.gui.hyprland.hypr.config**: Additional configurations for Hyprland.
  - **user.gui.hyprland.hypr.hypridle**: Configurations for HyprIdle.
  - **user.gui.hyprland.hypr.hyprlock**: Configurations for HyprLock.
  - **user.gui.hyprland.hypr.packages**: Configurations for packages necessary for Hyprland.
  - **user.gui.hyprland.hypr.pyprland**: Configurations for Pyprland (not currently in use).
- **user.gui.hyprland.utils**: Configurations for various tools integrated into Hyprland.
  - **user.gui.hyprland.utils.dunst**: Configurations for Dunst.
  - **user.gui.hyprland.utils.fuzzel**: Configurations for Fuzzel.
  - **user.gui.hyprland.utils.networkmanager-dmenu**: Configurations for NetworkManager-Dmenu (custom script for networks).
  - **user.gui.hyprland.utils.rofi**: Configurations for Rofi.
  - **user.gui.hyprland.utils.swappy**: Configurations for Swappy.
  - **user.gui.hyprland.utils.waybar**: Configurations for Waybar.
  - **user.gui.hyprland.utils.wlogout**: Configurations for Wlogout.

#### user.gui.lumina

Configurations for the Lumina desktop environment.

- **user.gui.lumina.lumina**: Specific configurations for Lumina.

#### user.gui.mate

Configurations for the MATE desktop environment.

- **user.gui.mate.mate**: Specific configurations for MATE.

#### user.gui.pantheon

Configurations for the Pantheon desktop environment.

- **user.gui.pantheon.pantheon**: Specific configurations for Pantheon.

#### user.gui.plasma

Configurations for the KDE Plasma desktop environment.

- **user.gui.plasma.dock**: Configurations for the dock.
- **user.gui.plasma.krunner**: Configurations for KRunner.
- **user.gui.plasma.plasma**: Main configurations for Plasma.
- **user.gui.plasma.shortcuts**: Configurations for Plasma shortcuts.
- **user.gui.plasma.top-panel**: Configurations for the top panel.

#### user.gui.xfce

Configurations for the XFCE desktop environment.

- **user.gui.xfce.xfce**: Specific configurations for XFCE.

### user.packages

Contains user packages.

#### user.packages.browsers

Packages for browsers.

- **user.packages.browsers.firefox**: Configurations for Firefox.
- **user.packages.browsers.sideberry-data**: Data for Sideberry.

#### user.packages.coding

Packages for programming.

- **user.packages.coding.compiler**: Packages with various compilers/interpreters.
- **user.packages.coding.git**: Configurations for Git.
- **user.packages.coding.tools**: Configurations for programming tools (debuggers, tools, etc.).

#### user.packages.editors

Packages for text editors.

- **user.packages.editors.nevica**: Configurations for the Nevica editor (an editor based on Neovim).

#### user.packages.engineering

Packages for engineering.

- **user.packages.engineering.freecad**: Configurations for FreeCAD.
- **user.packages.engineering.kicad**: Configurations for KiCad.
- **user.packages.engineering.numbat**: Configurations for Numbat.
- **user.packages.engineering.octave**: Configurations for Octave.

#### user.packages.flatpak

Configurations for Flatpak.

- **user.packages.flatpak.flatpak**: User-side configurations for Flatpak.

#### user.packages.gaming

Packages for gaming.

- **user.packages.gaming.gaming**: General gaming configurations.
- **user.packages.gaming.gaming-proton**: Configurations for Proton.

#### user.packages.media

Packages for media.

- **user.packages.media.gimp**: Configurations for GIMP.
- **user.packages.media.graphics-tools**: Configurations for graphics tools.
- **user.packages.media.kdenlive**: Configurations for Kdenlive.
- **user.packages.media.mpv**: Configurations for MPV.
- **user.packages.media.obs-minimal**: Configurations for OBS Minimal.
- **user.packages.media.obs**: Configurations for OBS with plugins.

#### user.packages.productivity

Packages for productivity.

- **user.packages.productivity.groupware**: Configurations for Groupware (mail, notes, calendar, etc.).
- **user.packages.productivity.libreoffice**: Configurations for LibreOffice.
- **user.packages.productivity.productivity**: General configurations for productivity.
- **user.packages.productivity.thunderbird**: Configurations for Thunderbird.

#### user.packages.security

Packages for security.

- **user.packages.security.pass**: Pass package.
- **user.packages.security.termshark**: Termshark package.

#### user.packages.terminal

Packages for terminals.

- **user.packages.terminal.alacritty**: Configurations for Alacritty.
- **user.packages.terminal.kitty**: Configurations for Kitty.
- **user.packages.terminal.lf**: Configurations for LF.
- **user.packages.terminal.nh**: Configurations for NH (nix wrapper).

#### user.packages.virtualization

Packages for virtualization.

- **user.packages.virtualization.virtualization**: User-side configurations for virtualization.

### user.shell

Contains shell configurations.

- **user.shell.cli-collection**: CLI tools collection.
- **user.shell.fastfetch**: Configurations for Fastfetch.
- **user.shell.omp**: Configurations for Oh My Posh.
- **user.shell.sh**: Configurations for zsh and bash shells.
- **user.shell.tmux**: Configurations for TMUX.
- **user.shell.zellij**: Configurations for Zellij.

### user.style

Contains style configurations.

#### user.style.gtk

Configurations for GTK.

#### user.style.qtconf

Configurations for QT.

- **user.style.qtconf.oomox-current**: Current Oomox configurations.
- **user.style.qtconf.qt5ct**: Configurations for QT5.
- **user.style.qtconf.qt6ct**: Configurations for QT6.
- **user.style.qtconf.trolltech**: Configurations for Trolltech.

#### user.style.qt

General QT configurations.

#### user.style.stylix

Custom style configurations.
