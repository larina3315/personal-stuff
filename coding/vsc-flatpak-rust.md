# How to setup VSCode/VSCodium with Rust

## Pre-requisites
### For Rust
- Download Rust SDK from flathub (org.freedesktop.Sdk.Extension.rust-stable) that matches the freedesktop version of VSC
- Set "FLATPAK_ENABLE_SDK_EXT=rust-stable" envvar for VSC (via Flatseal)
### For terminal/toolbox
- Create a toolbox named "devbox" (toolbox create devbox)
- Set it up however you like
- (Optional) Install rust/cargo with sudo dnf install rust cargo

## Configuring Rust
- Install "rust-analyzer", "crates" and "Better TOML" VSC extensions
## Optional
- Disable filesystem=host/home permissions and add direct path such as ~/Projects:create

## Setup in VSC
### Custom toolbox in terminal
- Edit settings.json for "Terminal>Integrated>Profiles: Linux" in Settings
- Put the following in the "terminal.integrated.profiles.linux" codeblock section (don't forget to put a comma before the last entry before pasting the following)

```
        "fedora-toolbox": {
            "path": "flatpak-spawn",
            "args": [
            "--env=TERM=xterm-256color",
            "--host","toolbox","enter","devbox"
            ]
        }
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
 

