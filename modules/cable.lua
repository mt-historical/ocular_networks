
local size=2/16
local node_box = {
	type = "connected",
	fixed          = {-size, -size, -size, size,  size, size},
	connect_top    = {-size, -size, -size, size,  0.5,  size}, -- y+
	connect_bottom = {-size, -0.5,  -size, size,  size, size}, -- y-
	connect_front  = {-size, -size, -0.5,  size,  size, size}, -- z-
	connect_back   = {-size, -size,  size, size,  size, 0.5 }, -- z+
	connect_left   = {-0.5,  -size, -size, size,  size, size}, -- x-
	connect_right  = {-size, -size, -size, 0.5,   size, size}, -- x+
}

minetest.register_node("ocular_networks:wire", {
	description = "Optical Cable"..minetest.colorize("#00affa", "[WIP] there's no reason to use this, but there's also no reason not to."),
	tiles = {"poly_wire.png"},
	inventory_image = "poly_cable.png",
	wield_image = "poly_cable.png",
	groups = {},
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	sunlight_propagates = true,
	drawtype = "nodebox",
	node_box = node_box,
	groups={choppy=1},
	connects_to = {"ocular_networks:wire", "group:fiberoptic"},
})