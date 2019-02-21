if minetest.get_modpath("wield3d") then
	if minetest.get_modpath("wieldview") then error("please disable wieldview") end

	local bone = "Arm_Right"
	local pos = {x=0, y=5.5, z=3}
	local scale = {x=0.25, y=0.25}
	local rx = -90
	local rz = 90

	wield3d.location["ocular_networks:angmallen_hammer"] = {bone, {x=0, y=5.5, z=3}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:angmallen_axe"] = {bone, {x=0, y=5.5, z=3}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:angmallen_sword"] = {bone, {x=0, y=5.5, z=8.5}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:blazerifle"] = {bone, pos, {x=rx, y=135, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:blazerifle_c"] = {bone, pos, {x=rx, y=135, z=rz}, {x=0.75, y=0.25}}
	wield3d.location["ocular_networks:blazerifle_d"] = {bone, pos, {x=rx, y=135, z=rz}, {x=0.75, y=0.25}}
	wield3d.location["ocular_networks:healer"] = {bone, pos, {x=rx, y=135, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:inspector"] = {bone, pos, {x=rx, y=135, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:hekaton_hammer"] = {bone, {x=0, y=5.5, z=3}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:hekaton_axe"] = {bone, {x=0, y=5.5, z=3}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:hekaton_sword"] = {bone, {x=0, y=5.5, z=8.5}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
end

if minetest.get_modpath("basic_machines") then
	
		local spec = ""..
		"size[8,9;]"..
		"background[0,0;0,0;poly_gui_formbg.png;true]"..
		"list[context;dst;3.5,2;1,1;]"..
		"list[current_player;main;0,5;8,4;]"
	
	minetest.register_node("ocular_networks:power_converter_BMPC", {
		description = "Power Cell Packager\n"..minetest.colorize("#00affa", "Used to convert OCP into basic_machines power cells.\nTakes power from BELOW"),
		tiles = {"poly_power_converter_vert.png", "poly_power_converter_vert.png", "poly_power_converter_BMPC_side.png"},

		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3},
		sounds = default.node_sound_stone_defaults(),
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_int("ocular_power", 0)
			meta:set_string("formspec", spec)
			local inv = meta:get_inventory()
			inv:set_size("dst", 1)
		end,
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			local meta = minetest.get_meta(pos)
			local owner = placer:get_player_name()
			meta:set_string("owner", owner)
			meta:set_string("infotext", "Power Buffer: 0".."\nOwned By: "..owner)
		end,
		can_dig = function(pos, player)
			local meta = minetest.get_meta(pos)
			local owner = meta:get_string("owner")
			return owner == player:get_player_name()
		end
	})
	
	minetest.register_craft({
		output="ocular_networks:power_converter_BMPC",
		recipe={
			{"ocular_networks:luminium_bar_3", "default:glass", "ocular_networks:luminium_bar_3"},
			{"basic_machines:power_cell", "ocular_networks:erena_sphere", "basic_machines:power_cell"},
			{"ocular_networks:luminium_bar_3", "default:glass", "ocular_networks:luminium_bar_3"}
		}
	})
	
	minetest.register_abm({
		label = "power cells",
		nodenames = {"ocular_networks:power_converter_BMPC"},
		interval = 1,
		chance = 1,
		catch_up = true,
		action = function(pos, node)
			local meta = minetest.get_meta(pos)
			local owner = meta:get_string("owner")
			local inv = meta:get_inventory()
			local source_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
			local source_power = source_meta:get_int("ocular_power")
			local source_owner = source_meta:get_string("owner")
			if source_power then
				if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
					if tonumber(source_power) > 9 then
						source_meta:set_int("ocular_power", tonumber(source_power)-10)
						inv:add_item("dst", "basic_machines:power_cell")
					end
				end
			end
			meta:set_string("infotext", "Owned By: "..owner)
		end,
	})
end

if minetest.get_modpath("technic") then
	
	minetest.register_node("ocular_networks:power_converter_EU", {
		description = "MV Electrofraction Generator\n"..minetest.colorize("#00affa", "Used to convert OCP into technic MV EU\n Takes power from BELOW"),
		tiles = {"poly_power_converter_vert.png", "poly_power_converter_vert.png", "poly_power_converter_EU_side.png"},

		is_ground_content = false,
		groups = {cracky = 3, oddly_breakable_by_hand = 3, technic_machine=1, technic_mv=1},
		sounds = default.node_sound_stone_defaults(),
		connect_sides = {"front", "back", "left", "right"},
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_int("ocular_power", 0)
		end,
		after_place_node = function(pos, placer, itemstack, pointed_thing)
			local meta = minetest.get_meta(pos)
			local owner = placer:get_player_name()
			meta:set_string("owner", owner)
			meta:set_string("infotext", "Power Buffer: 0".."\nOwned By: "..owner)
		end,
		can_dig = function(pos, player)
			local meta = minetest.get_meta(pos)
			local owner = meta:get_string("owner")
			return owner == player:get_player_name()
		end,
	})
	
	minetest.register_craft({
		output="ocular_networks:power_converter_EU",
		recipe={
			{"ocular_networks:luminium_bar_3", "default:glass", "ocular_networks:luminium_bar_3"},
			{"technic:mv_cable", "ocular_networks:erena_sphere", "technic:mv_cable"},
			{"ocular_networks:luminium_bar_3", "default:glass", "ocular_networks:luminium_bar_3"}
		}
	})
	
	technic.register_machine("MV", "ocular_networks:power_converter_EU", technic.producer)
	
	minetest.register_abm({
		label = "EU",
		nodenames = {"ocular_networks:power_converter_EU"},
		interval = 1,
		chance = 1,
		catch_up = true,
		action = function(pos, node)
			local meta = minetest.get_meta(pos)
			local owner = meta:get_string("owner")
			local inv = meta:get_inventory()
			local source_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
			local source_power = source_meta:get_int("ocular_power")
			local source_owner = source_meta:get_string("owner")
			if source_power then
				if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
					if tonumber(source_power) > 99 then
						meta:set_int("MV_EU_supply", 5000)
						source_meta:set_int("ocular_power", tonumber(source_power)-100)
						meta:set_string("infotext", "EU Supplying: 5000")
					else
						meta:set_int("MV_EU_supply", 0)
						meta:set_string("infotext", "EU Supplying: 0")
					end
				end
			end
		end,
	})
end