local filesystem = require('gears.filesystem')
local beautiful = require('beautiful')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -show drun -display-drun -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
    -- List of apps to start by default on some actions
    default = {
        terminal = 'env alacritty',
        rofi = rofi_command,
        lock = 'i3lock -c 000000',
        quake = 'alacritty',
        screenshot = 'flameshot full -p ~/Pictures',
        region_screenshot = 'flameshot gui -p ~/Pictures',
        delayed_screenshot = 'flameshot gui -p ~/Pictures',

        -- Editing these also edits the default program
        -- associated with each tag/workspace
        browser = 'env brave',
        editor = 'code', -- gui text editor
        social = 'schildichat-desktop',
        game = rofi_command,
        files = 'nautilus',
        music = 'clementine',
        video = 'vlc',
        appmng = 'alacritty -e htop',
        vmapp = 'virtualbox',
        power_command = 'i3lock-fancy',
	audiomng = 'pavucontrol',
	obs = 'obs',
    },
    -- List of apps to start once on start-up
    run_on_start_up = {
        -- Add applications that need to be killed between reloads
        -- to avoid multipled instances, inside the autostart script
        '~/.config/awesome/configuration/autostart', -- Spawn "dirty" apps that can linger between sessions
        --'compton',
	'picom --config ' .. filesystem.get_configuration_dir() .. '/configuration/picom.conf',        
	'nitrogen --restore',
        'nm-applet --indicator', -- wifi
        'xfce4-power-manager', -- Power manager
	'pamac-tray',
        -- 'ibus-daemon --xim --daemonize', -- Ibus daemon for keyboard
        -- 'flameshot', -- screenshots
        -- 'numlockx on', -- enable numlock
	'syncthing -no-browser',
        '/usr/lib/xfce-polkit/xfce-polkit & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
        'blueman-tray', -- bluetooth tray
        --'copyq',
	'dropbox',
        'megasync',
        '~/.config/awesome/configuration/awspawn', -- Spawn "dirty" apps that can linger between sessions
	--    '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &")',
	'keepassxc',
	'kdeconnect-indicator',
    }
}

