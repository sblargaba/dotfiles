local awful = require("awful")
local vicious = require("vicious")
local wibox = require("wibox")

--{{---| Icons |---------------------------------------------------------------

themes_dir= "/home/"
mem_icon	= themes_dir .. "mem_purple.png"
cpu_icon	= themes_dir .. "cpu.png"
bat_icon	= themes_dir .. "battery.png"
net_icon	= themes_dir .. "net.png"
hdd_icon	= themes_dir .. "hdd.png"
rarrow		= themes_dir .. "arrl_ld_sf_purple.png"
larrow		= themes_dir .. "arrl_dl_sf_rg.png"

--{{---| Colors |--------------------------------------------------------------

-- named from right to left
zero      = "#000000"
one       = "#C2C2A4"
two       = "#92B0A0"
three     = "#D0785D"
four      = "#4B696D"
five      = "#4b3b51"
last      = "#313131"
font      = "DejaVu Sans 8"
fontcolor = "#FFFFFF"
arrowfont = "Terminus 12"

--{{---| MEM widget |-------------------------------------------------------------------------------
markup = '<span background="' .. five .. '" color="' .. four  .. '" font="' .. arrowfont .. '" ><span font="' .. font .. '" color="' .. fontcolor .. '">'
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, markup .. '$2MB</span> ⮂</span>', 7)
memicon = wibox.widget.imagebox()
memicon:set_image(mem_icon)

--{{---| CPU / sensors widget |---------------------------------------------------------------------
markup = '<span background="' .. four .. '" color="' .. three .. '" font="' .. arrowfont .. '" ><span font="' .. font .. '" color="' .. fontcolor .. '">'
upwidget = wibox.widget.textbox()
vicious.register(upwidget, vicious.widgets.uptime, markup .. '$4</span> ⮂</span>', 59)
upicon = wibox.widget.imagebox()
upicon:set_image(cpu_icon)
upwidget:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell("lxterminal -e htop") end)))

--{{---| FS's widget |-----------------------------------------------------------
markup = '<span background="' .. three .. '" color="' .. two .. '" font="' .. arrowfont .. '" ><span font="' .. font .. '" color="' .. fontcolor .. '">'
fswidget = wibox.widget.textbox()
vicious.register(fswidget, vicious.widgets.fs, markup .. '${/ avail_gb}GB</span> ⮂</span>', 29)
hddicon = wibox.widget.imagebox()
hddicon:set_image(hdd_icon)


--{{---| Battery widget |---------------------------------------------------------------------------  
markup = '<span background="' .. two .. '" color="' .. one  .. '" font="' .. arrowfont .. '" ><span font="' .. font .. '" color="' .. fontcolor .. '">'
baticon = wibox.widget.imagebox()
baticon:set_image(bat_icon)
batwidget = wibox.widget.textbox()
vicious.register( batwidget, vicious.widgets.bat, markup .. '$1$2%</span> ⮂</span>', 61, "BAT1" ) 
-- tooltip time remaining	

--{{---| Net widget |-------------------------------------------------------------------------------
markup = '<span background="' .. one .. '" color="' .. zero  .. '" font="' .. arrowfont .. '" ><span font="' .. font .. '" color="' .. fontcolor .. '">'
netwidget = wibox.widget.textbox()
vicious.register(netwidget, vicious.widgets.wifi, markup .. '${linp}%</span> ⮂</span>', 13, "wlan0")
neticon = wibox.widget.imagebox()
neticon:set_image(net_icon)
netwidget:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell("lxterminal -e wicd-curses") end)))
neticon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn_with_shell("lxterminal -e wicd-curses") end)))
-- tooltip ip

--{{---| Separators widgets |-----------------------------------------------------------------------
spr = wibox.widget.textbox()
spr:set_markup(' ')
arrowend = wibox.widget.textbox()
arrowend:set_markup('<span color="' .. five  .. '" background="' .. last .. '" font="' .. arrowfont .. '">⮂</span>')
arrowbgn = wibox.widget.textbox()
arrowbgn:set_markup('<span color="' .. zero .. '" background="' .. last  .. '" font="' .. arrowfont .. '">⮀</span>')
