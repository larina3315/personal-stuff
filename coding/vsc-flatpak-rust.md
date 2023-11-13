# How to setup VSCode/VSCodium with Rust

## Pre-requisites
### For Rust
1. Download Rust SDK from flathub (org.freedesktop.Sdk.Extension.rust-stable) that matches the freedesktop version of VSC
2. Set "FLATPAK_ENABLE_SDK_EXT=rust-stable" envvar for VSC (via Flatseal)
### For terminal/toolbox
1. Create a toolbox named "devbox" (toolbox create devbox)
2. Set it up however you like
3. (Optional) Install rust/cargo with sudo dnf install rust cargo

## Setup in VSC
### Custom toolbox in terminal
- Edit settings.json for "Terminal>Integrated>Profiles: Linux" in Settings
- Put the following in it

```
        "fedora-toolbox": {
            "path": "flatpak-spawn",
            "args": [
            "--env=TERM=xterm-256color",
            "--host","toolbox","enter","devbox"
            ]
        }
    },
    "terminal.integrated.defaultProfile.linux": "fedora-toolbox"
```

(Optional)

```
    "terminal.integrated.automationProfile.linux": {
        "path": "flatpak-spawn",
        "args": [
        "--env=TERM=xterm-256color",
        "--host","toolbox","enter","devbox"
        ]
    }
```

- Set "Terminal>Integrated>Default Profiles: Linux" to fedora-toolbox in Settings

- ### Configuring Rust
- - Install "rust-analyzer", "crates" and "Better TOML" VSC extensions
