# Patches for upstream packages

Device-specific patches applied on top of upstream Droidian/GNOME/KDE packages.
The resulting `.deb` files are published in this port's apt repository and
pinned above the rolling repository so they win during image builds.

| Patch | Package | What it does |
|---|---|---|
| `phosh/0001-monitor-manager-persist-and-restore-output-config.patch` | `phosh` | Phosh never wrote its output configuration to disk, so the display scale was lost on every restart. Known upstream issue, also seen on Mobian and postmarketOS |
| `phosh/0002-r7-clock-position-by-orientation.patch` | `phosh` | The status-bar clock sat underneath the punch-hole camera. Places it inside `status_icons_box` in portrait and re-centres it from the `PhoshMonitor` transform in landscape. `gmobile` has no cutout definition for this device |
| `droidian-camera/0001-r7-camera-orientation-preview-and-capture.patch` | `droidian-camera` | Preview stayed in landscape after rotating (phoc does not update `QScreen.orientation`, so Qt's `autoOrientation` never fires) and landscape photos were saved as portrait. Adds a QtSensors-driven orientation plus a `CaptureFilter` rotation |
| `phosh-mobile-settings/0001-r7-tweaks-data-dir-for-spen-toggle.patch` | `phosh-mobile-settings` | Droidian's `debian/rules` sets `tweaks-data-dir=''`, so Configurable Tweaks never loads any YAML. Points it at `/usr/share/phosh-mobile-settings/tweaks` so the S Pen toggle appears |

## Pinning

A patched package alone is not enough. The Droidian rolling repository is
pinned at priority **1002**, while an unpinned internal repository sits at
**500** — apt will pick rolling regardless of version. The image recipe's
`pre-overlay` therefore pins this port's repository at **1100**.

Verify with `apt-cache policy <package>`.
