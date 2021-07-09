local awful = require("awful")
local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local dpi = require('beautiful').xresources.apply_dpi
local watch = require('awful.widget.watch')
local beautiful = require('beautiful')

local battery_icon = wibox.widget.textbox()
battery_icon.font = beautiful.icon_font
local battery_widget = wibox.widget.textbox()
battery_widget.align = 'center'
battery_widget.valign = 'center'
battery_widget.font = beautiful.font

local battery

function update_battery()
    awful.spawn.easy_async_with_shell("pamixer --get-volume", function(stdout)
        battery = stdout
        --battery = string.match(stdout, '(%d?%d?%d)%%')
        awful.spawn.easy_async_with_shell("bash -c 'pacmd list-sinks | awk '/muted/ { print $2 }''", function(muted)
            --muted = string.gsub(muted, "%s+", "")
	        muted = 'no'
            if muted == 'muted:no' and (battery > '50' or battery == '100') then
                battery_icon.text = '墳'
            elseif muted == 'muted:no' and battery <= '50' and battery > '0' then
                battery_icon.text = '奔'
            elseif muted == 'muted:yes' then
                battery_icon.text = '婢'
            elseif battery == '0' then
                battery_icon.text = '奄'
            end
            battery_widget.text = battery
        end)
        collectgarbage('collect')
    end)
end

watch('bash -c', 3, function(_, stdout)
    update_battery()
end)

return wibox.widget {
    wibox.widget{
        battery_icon,
        fg = beautiful.accent.hue_100,
        widget = wibox.container.background
    },
    battery_widget,
    spacing = dpi(2),
    layout = wibox.layout.fixed.horizontal
}
