local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local apps = require('configuration.apps')
local dpi = require('beautiful').xresources.apply_dpi

local tags = {
    {text = 'web', type = 'web', defaultApp = apps.default.browser, screen = 1},
    {text = 'term', type = 'code', defaultApp = apps.default.terminal, screen = 1},
    {text = 'social', type = 'social', defaultApp = apps.default.social, screen = 1},
    {text = 'video', type = 'video', defaultApp = apps.default.video, screen = 1},
    {text = 'file', type = 'file', defaultApp = apps.default.files, screen = 1},
    {text = 'music', type = 'music', defaultApp = apps.default.music, screen = 1},
    {text = 'misc', type = 'misc', defaultApp = apps.default.vmapp, screen = 1}
}

awful.layout.layouts = {
   
    awful.layout.suit.tile,
    awful.layout.suit.floating,
--    awful.layout.suit.tile.left,
--    awful.layout.suit.tile.bottom,
--    awful.layout.suit.tile.top,
--[[    awful.layout.suit.fair,
--    awful.layout.suit.fair.horizontal,
--    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
--]]    awful.layout.suit.max,
--    awful.layout.suit.max.fullscreen,
--    awful.layout.suit.magnifier,
--    awful.layout.suit.corner.nw,
}

awful.screen.connect_for_each_screen(function(s)
    for i, tag in pairs(tags) do
        awful.tag.add(tag.text, {
            icon = tag.icon,
            icon_only = false,
            layout = awful.layout.suit.tile,
            gap = beautiful.gaps,
            screen = s,
            defaultApp = tag.defaultApp,
            selected = i == 1
        })
    end
end)
