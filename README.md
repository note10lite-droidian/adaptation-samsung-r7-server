adaptation-samsung-r7
======================

Device adaptation package for the Samsung Galaxy Note10 Lite (`r7` /
SM-N770F) Droidian port. This is not a standalone install, it's a `.deb`
source that gets built and consumed by the
[image build](https://github.com/note10lite-droidian/droidian-samsung-r7).

## What's in here

- `adaptation-samsung-r7` — metapackage, pulls in the phone adaptation and
  `openssh-server` (the base image ships no SSH server at all)
- `adaptation-samsung-r7-configs` — the actual device-specific payload:
  udev rules (binder/ion nodes), PulseAudio configuration and Samsung
  audio policy XMLs, the S Pen hwdb quirk and mode daemon, systemd units
  and drop-ins, this port's own apt source and signing key
  (`community-samsung-r7.list` + `community-samsung-r7.gpg`)
- `adaptation-samsung-r7-desktop` — experimental desktop-mode pieces
  (Wayfire config, `r7-switch-session`), not part of the shipped image

## Building

```sh
git clone https://github.com/note10lite-droidian/adaptation-samsung-r7.git
cd adaptation-samsung-r7
sudo docker run --rm \
  -v $PWD/..:/buildd \
  -v $PWD:/buildd/sources \
  -e RELENG_FULL_BUILD=yes \
  -e RELENG_HOST_ARCH=arm64 \
  quay.io/droidian/build-essential:current-amd64 \
  /bin/sh -c 'cd /buildd/sources && releng-build-package'
```

Full detail, including every non-obvious build pitfall hit while working
on this device, is in
[docs/BUILDING.md](https://github.com/note10lite-droidian/docs/blob/main/docs/BUILDING.md).

## Related repositories

- [droidian-samsung-r7](https://github.com/note10lite-droidian/droidian-samsung-r7) — image build, releases
- [linux-android-samsung-r7](https://github.com/note10lite-droidian/linux-android-samsung-r7) — kernel
- [docs](https://github.com/note10lite-droidian/docs) — install guide, known issues, feature status
