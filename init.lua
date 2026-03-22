-- ==== CONFIG ====
-- local cfg         = {
--     overlay    = true,
--     look       = {
--         x = 20,
--         y = 1380,
--         color = '#000000',
--         size = 3,
--     },
--     ws = "...",
--     toggle_mute   = "F10",
--     delay = 2000,
--     source = "Mic/Aux",
-- }

-- ==== VARS ====
local waywall = require("waywall")
local M = {}

local text_handle = nil
local muted = false

-- ==== PLUG ====
M.setup = function(config, cfg)
    local show_text = function(msg)
        if text_handle then
            text_handle:close()
            text_handle = nil
        end

        text_handle = waywall.text(msg, cfg.look)
        waywall.sleep(cfg.delay)

        if text_handle then
            text_handle:close()
            text_handle = nil
        end
    end

    local toggle_mute = function()
        if muted then
            waywall.exec("obs-cmd --websocket " .. cfg.ws .. " audio unmute " .. cfg.source)
            muted = false
            if cfg.overlay then show_text("mic unmuted") end
        else
            waywall.exec("obs-cmd --websocket " .. cfg.ws .. " audio mute " .. cfg.source)
            muted = true
            if cfg.overlay then show_text("mic muted") end
        end
    end

    config.actions[cfg.toggle_mute] = function()
        toggle_mute()
    end
end

return M
