local wibox = require('wibox')
local awful = require('awful')

awful.screen.connect_for_each_screen(function(s)
local screen_geometry = s.geometry

--draw edges
local topedge = wibox({
   width=screen_geometry.width,
   height=1,
   x=0,
   y=0,
   opacity=0,
   ontop=true,
   screen=s,
   type='dock',
   visible=true,
})
topedge:connect_signal("mouse::enter", function()
   awesome.emit_signal("top_edge")
end)

local bottomedge = wibox({
   width=screen_geometry.width,
   height=1,
   x=0,
   y=screen_geometry.height-1,
   opacity=0,
   ontop=true,
   screen=s,
   type='dock',
   visible=true,
})
bottomedge:connect_signal("mouse::enter", function()
   awesome.emit_signal("bottom_edge")
end)

local leftedge = wibox({
   width=1,
   height=screen_geometry.height,
   x=0,
   y=0,
   opacity=0,
   ontop=true,
   screen=s,
   type='dock',
   visible=true,
})
leftedge:connect_signal("mouse::enter", function()
   awesome.emit_signal("left_edge")
end)

local rightedge = wibox({
   width=1,
   height=screen_geometry.height,
   x=screen_geometry.width-1,
   y=0,
   opacity=0,
   ontop=true,
   screen=s,
   type='dock',
   visible=true,
})
rightedge:connect_signal("mouse::enter", function()
   awesome.emit_signal("right_edge")
end)

--draw corners
local box_size = 10
local topleftcorner = wibox({
   x=0,
   y=-1,
   width=box_size,
   height=box_size,
   opacity=0,
   ontop=true,
   screen=s,
   type='dock',
   visible=true,
})
topleftcorner:connect_signal("mouse::enter", function()
   awesome.emit_signal("top_left_hotcorner")
end)

local toprightcorner = wibox({
   width=box_size,
   height=box_size,
   x=screen_geometry.width-box_size,
   y=0,
   opacity=0,
   ontop=true,
   screen=s,
   type='dock',
   visible=true,
})
toprightcorner:connect_signal("mouse::enter", function()
   awesome.emit_signal("top_right_hotcorner")
end)

local bottomrightcorner = wibox({
   width=box_size,
   height=box_size,
   x=screen_geometry.width-box_size,
   y=screen_geometry.height-box_size,
   opacity=0,
   ontop=true,
   screen=s,
   type='dock',
   visible=true,
})
bottomrightcorner:connect_signal("mouse::enter", function()
   awesome.emit_signal("bottom_right_hotcorner")
end)

local bottomleftcorner = wibox({
   width=box_size,
   height=box_size,
   x=0,
   y=screen_geometry.height-box_size,
   opacity=0,
   ontop=true,
   screen=s,
   type='dock',
   visible=true,
})
bottomleftcorner:connect_signal("mouse::enter", function()
   awesome.emit_signal("bottom_left_hotcorner")
end)

end)
