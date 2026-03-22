# Music Overlay
Music controls on waywall and an optional overlay (requires playerctl)

## Dependencies
This plugin requires [obs-cmd](https://github.com/grigio/obs-cmd). Install it on your distro with the following command.
```
### Arch
```bash
yay -S obs-cmd
```
### Other (requires [Rust](https://rust-lang.org/tools/install/))
```bash
cd
git clone https://github.com/grigio/obs-cmd.git
cd obs-cmd
cargo install --path .
```
Setup the websocket as per [here](https://github.com/grigio/obs-cmd?tab=readme-ov-file#usage).

## Setup
### Using [plug.waywall](https://github.com/its-saanvi/plug.waywall)
```lua
local cfg = {
    overlay = false,
    look = {
        x = 70,
        y = 1280,
        color = '#000000',
        size = 3,
    },
    ws = "...",
    toggle_mute = "F12",
    delay = 2000,
    source = "Mic/Aux",
}

return {
    url = "https://github.com/arjuncgore/ww_obs_utils",
    config = function(config)
        require("obs_utils.init").setup(config, cfg)
    end,
    name = "obs_utils",
    update_on_load = false,
}
```
### Otherwise
#### Clone plugin to waywall config folder
```bash
git clone https://github.com/arjuncgore/ww_obs_utils ~/.config/waywall/obs_utils
```

#### Setup config in init.lua
```lua
-- rest of config
local cfg = {
    overlay = false,
    look = {
        x = 70,
        y = 1280,
        color = '#000000',
        size = 3,
    },
    ws = "obsws://localhost:4455/aU1Vt3NniDIy1hzh",
    toggle_mute = "F12",
    delay = 2000,
    source = "Mic/Aux",
}

require("obs_utils.init").setup(config, cfg)
return config
```
