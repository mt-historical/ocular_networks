

minetest.register_abm({
        label = "ocular battery charging",
	nodenames = {"ocular_networks:battery"},
	interval = 1,
	chance = 1,
	catch_up = false,
	action = function(pos, node)
		local node_above = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z})
		local node_above_light = minetest.get_node_light({x=pos.x, y=pos.y+2, z=pos.z})
		local meta = minetest.get_meta(pos)
		local power = meta:get_int("ocular_power")
		meta:set_string("infotext", "Power Buffer: "..power.."\nOwned By: "..meta:get_string("owner"))
		if node_above.name == "ocular_networks:frame_lens" then
			if not minetest.find_node_near(pos, 11, ocular_networks.disallowed) then
				meta:set_int("ocular_power", power+node_above_light)
			end
		end
	end,
})

minetest.register_abm({
    label = "ocular node network distribution (draw)",
	nodenames = {"ocular_networks:distributor"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local power = meta:get_int("ocular_power")
		local owner = meta:get_string("owner")
		local x, y, z = meta:get_int("sourceposx"), meta:get_int("sourceposy"), meta:get_int("sourceposz")
		local source_meta = minetest.get_meta({x=pos.x+x, y=pos.y+y, z=pos.z+z})
		local source_power = source_meta:get_int("ocular_power")
		local source_owner = source_meta:get_string("owner")
		if source_power then
			if source_power > 4 then
				if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
					if x > -11 and x < 11 and y > -11 and y < 11 and z > -11 and z < 11 then
						local nom = 1
						if x == 0 or x == nil then
							nom = nom+1
						end
						if y == 0 or y == nil then
							nom = nom+1
						end
						if z == 0 or z == nil then
							nom = nom+1
						end
						if nom < 4 then
							source_meta:set_int("ocular_power", source_power-5)
							meta:set_int("ocular_power", power+5)
						end
					end
				end
			end
		end
		meta:set_string("infotext", "Power Buffer: "..meta:get_int("ocular_power").."\nOwned By: "..owner)
	end,
})

minetest.register_abm({
    label = "ocular node network distribution 2 (draw)",
	nodenames = {"ocular_networks:distributor_2"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local power = meta:get_int("ocular_power")
		local owner = meta:get_string("owner")
		local draw = meta:get_int("draw")
		local x, y, z = meta:get_int("sourceposx"), meta:get_int("sourceposy"), meta:get_int("sourceposz")
		local source_meta = minetest.get_meta({x=pos.x+x, y=pos.y+y, z=pos.z+z})
		local source_power = source_meta:get_int("ocular_power")
		local source_owner = source_meta:get_string("owner")
		if source_power then
			if source_power > draw-1 then
				if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
					if x > -21 and x < 21 and y > -21 and y < 21 and z > -21 and z < 21 then
						local nom = 1
						if x == 0 or x == nil then
							nom = nom+1
						end
						if y == 0 or y == nil then
							nom = nom+1
						end
						if z == 0 or z == nil then
							nom = nom+1
						end
						if nom < 4 then
							source_meta:set_int("ocular_power", source_power-draw)
							meta:set_int("ocular_power", power+draw)
						end
					end
				end
			end
		end
		meta:set_string("infotext", "Power Buffer: "..meta:get_int("ocular_power").."\nOwned By: "..owner)
	end,
})

minetest.register_abm({
    label = "ocular node network distribution 3 (draw)",
	nodenames = {"ocular_networks:distributor_3"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local power = meta:get_int("ocular_power")
		local owner = meta:get_string("owner")
		local draw = meta:get_int("draw")
		local x, y, z = meta:get_int("sourceposx"), meta:get_int("sourceposy"), meta:get_int("sourceposz")
		local source_meta = minetest.get_meta({x=pos.x+x, y=pos.y+y, z=pos.z+z})
		local source_power = source_meta:get_int("ocular_power")
		local source_owner = source_meta:get_string("owner")
		if source_power then
			if source_power > draw-1 then
				if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
					if x > -31 and x < 31 and y > -31 and y < 31 and z > -31 and z < 31 then
						local nom = 1
						if x == 0 or x == nil then
							nom = nom+1
						end
						if y == 0 or y == nil then
							nom = nom+1
						end
						if z == 0 or z == nil then
							nom = nom+1
						end
						if nom < 4 then
							source_meta:set_int("ocular_power", source_power-draw)
							meta:set_int("ocular_power", power+draw)
						end
					end
				end
			end
		end
		meta:set_string("infotext", "Power Buffer: "..meta:get_int("ocular_power").."\nOwned By: "..owner)
	end,
})

minetest.register_abm({
    label = "melting furnace",
	nodenames = {"ocular_networks:melter"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local source_power = source_meta:get_int("ocular_power")
		local source_owner = source_meta:get_string("owner")
		if source_power then
			if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
				for _,recipe in ipairs(ocular_networks.registered_meltables) do
					if inv:contains_item("input", recipe.input) then
						if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "air" then
							if source_power > recipe.cost-1 then
								source_meta:set_int("ocular_power", source_power-recipe.cost)
								inv:remove_item("input", recipe.input)
								minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z}, {name=recipe.output})
							end
						end
					end
				end
			end
		end
		meta:set_string("infotext", "Owned By: "..owner)
	end,
})


minetest.register_abm({
    label = "alloyer",
	nodenames = {"ocular_networks:alloyer"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local source_power = source_meta:get_int("ocular_power")
		local source_owner = source_meta:get_string("owner")
		if source_power then
			if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
				for _,recipe in ipairs(ocular_networks.registered_alloys) do
					if inv:contains_item("input1", recipe.input1) and inv:contains_item("input2", recipe.input2) then
						if source_power > recipe.cost-1 then
							if inv:room_for_item("output", recipe.output) then
								source_meta:set_int("ocular_power", source_power-recipe.cost)
								inv:add_item("output", recipe.output)
								if inv:room_for_item("output", recipe._return) then
									inv:add_item("output", recipe._return)
									inv:remove_item("input2", recipe.input2)
									inv:remove_item("input1", recipe.input1)
								else
									inv:remove_item("output", recipe.output)
								end
							end
						end
					elseif inv:contains_item("input1", recipe.input2) and inv:contains_item("input2", recipe.input1) then
						if source_power > recipe.cost-1 then
							if inv:room_for_item("output", recipe.output) then
								source_meta:set_int("ocular_power", source_power-recipe.cost)
								inv:add_item("output", recipe.output)
								if inv:room_for_item("output", recipe._return) then
									inv:add_item("output", recipe._return)
									inv:remove_item("input1", recipe.input2)
									inv:remove_item("input2", recipe.input1)
								else
									inv:remove_item("output", recipe.output)
								end
							end
						end
					end
				end
			end
		end
		meta:set_string("infotext", "Owned By: "..owner)
	end,
})

minetest.register_abm({
    label = "fusion",
	nodenames = {"ocular_networks:fuser"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local source_power = source_meta:get_int("ocular_power")
		local source_owner = source_meta:get_string("owner")
		if source_power then
			if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
				for _,recipe in ipairs(ocular_networks.registered_fusions) do
					if inv:contains_item("input1", recipe.input1) and inv:contains_item("input2", recipe.input2) then
						if source_power > recipe.cost-1 then
							if inv:room_for_item("output", recipe.output) then
								source_meta:set_int("ocular_power", source_power-recipe.cost)
								inv:add_item("output", recipe.output)
								if inv:room_for_item("output", recipe._return) then
									inv:add_item("output", recipe._return)
									inv:remove_item("input2", recipe.input2)
									inv:remove_item("input1", recipe.input1)
									minetest.add_item({x=pos.x, y=pos.y-1, z=pos.z}, "ocular_networks:crud")
								else
									inv:remove_item("output", recipe.output)
								end
							end
						end
					elseif inv:contains_item("input1", recipe.input2) and inv:contains_item("input2", recipe.input1) then
						if source_power > recipe.cost-1 then
							if inv:room_for_item("output", recipe.output) then
								source_meta:set_int("ocular_power", source_power-recipe.cost)
								inv:add_item("output", recipe.output)
								if inv:room_for_item("output", recipe._return) then
									inv:add_item("output", recipe._return)
									inv:remove_item("input1", recipe.input2)
									inv:remove_item("input2", recipe.input1)
									minetest.add_item({x=pos.x, y=pos.y+1, z=pos.z}, "ocular_networks:crud")
								else
									inv:remove_item("output", recipe.output)
								end
							end
						end
					end
				end
			end
		end
		meta:set_string("infotext", "Owned By: "..owner)
	end,
})

ocular_networks.cools = {

}

minetest.register_abm({
    label = "metal cooling",
	nodenames = {"group:metal_liquid_source"},
	neighbors = {"group:cools_lava"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		minetest.set_node(pos, ocular_networks.cools[node.name])
	end,
})

minetest.register_abm({
    label = "player personal network loading",
	nodenames = {"ocular_networks:networknode"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local source_power = source_meta:get_int("ocular_power")
		local source_owner = source_meta:get_string("owner")
		if source_power then
			if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
				if minetest.get_player_by_name(owner) then
					if minetest.get_player_by_name(owner):is_player_connected(owner) then
						local player = minetest.get_player_by_name(owner)
						if player:get_attribute("personal_ocular_power") then
							local playerPower = tonumber(player:get_attribute("personal_ocular_power"))
							player:set_attribute("personal_ocular_power", tostring(playerPower+source_power))
							source_meta:set_int("ocular_power", 0)
						else
							player:set_attribute("personal_ocular_power", tostring(source_power))
							source_meta:set_int("ocular_power", 0)
						end
					end
				end
			end
		end
		local function b()	meta:set_string("infotext", "Owned By: "..owner) end
		minetest.after(1, b)
	end,
})

minetest.register_abm({
    label = "player personal network unloading",
	nodenames = {"ocular_networks:networknode2"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local source_power = source_meta:get_int("ocular_power")
		local source_owner = source_meta:get_string("owner")
		local rate = meta:get_int("draw_amount")
		if source_power then
			if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
				if minetest.get_player_by_name(owner) then
					if minetest.get_player_by_name(owner):is_player_connected(owner) then
						local player = minetest.get_player_by_name(owner)
						if player:get_attribute("personal_ocular_power") then
							local playerPower = tonumber(player:get_attribute("personal_ocular_power"))
							if playerPower < rate-1 then
								source_meta:set_int("ocular_power", source_power+playerPower)
								player:set_attribute("personal_ocular_power", tostring(0))
							else
								player:set_attribute("personal_ocular_power", tostring(playerPower-rate))
								source_meta:set_int("ocular_power", source_power+rate)
							end
						else
							return 0
						end
					end
				end
			end
		end
		local function b()	meta:set_string("infotext", "Owned By: "..owner) end
		minetest.after(1, b)
	end,
})

minetest.register_abm({
    label = "reservoir updating",
	nodenames = {"ocular_networks:reservoir"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		meta:set_string("infotext", "Owned By: "..owner.."\nContains "..meta:get_int("ocular_power").." power")
	end,
})

minetest.register_abm({
    label = "ocn_cooling",
	nodenames = {"ocular_networks:passive_cooler"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		for _,recipe in ipairs(ocular_networks.registered_passivecools) do
			if inv:contains_item("input", recipe.input) then
				if inv:room_for_item("output", recipe.output) then
					inv:add_item("output", recipe.output)
					inv:remove_item("input", recipe.input)
				end
			end
		end
	meta:set_string("infotext", "Owned By: "..owner)
	end,
})

minetest.register_abm({
    label = "ocn charging",
	nodenames = {"ocular_networks:charger"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local source_power = source_meta:get_int("ocular_power")
		local source_owner = source_meta:get_string("owner")
		if source_power then
			if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
				for _,recipe in ipairs(ocular_networks.registered_chargeables) do
					if inv:contains_item("input", recipe.input) then
						if inv:room_for_item("output", recipe.output) then
							if source_power > recipe.cost-1 then
								source_meta:set_int("ocular_power", source_power-recipe.cost)
								inv:remove_item("input", recipe.input)
								inv:add_item("output", recipe.output)
							end
						end
					end
				end
			end
		end
		meta:set_string("infotext", "Owned By: "..owner)
	end,
})

minetest.register_abm({
    label = "laserdrill core",
	nodenames = {"ocular_networks:laserdrillchest"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local source_power = meta:get_int("ocular_power")
		if source_power then
			meta:set_string("infotext", "Owned By: "..owner.."\nPower: "..source_power)
		end
	end,
})

minetest.register_abm({
    label = "laserdrill projector",
	nodenames = {"ocular_networks:laserdrill"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local distance = meta:get_int("digDistance")
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local source_power = source_meta:get_int("ocular_power")
		local source_owner = source_meta:get_string("owner")
		if source_power then
			if owner == source_owner or ocular_networks.config.live.moderator_whitelist[owner] then
				if minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name == "ocular_networks:laserdrillchest" then
					if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "ocular_networks:frame_lens" then
						local inv = source_meta:get_inventory()
						if minetest.get_node({x=pos.x, y=pos.y-distance, z=pos.z}).name == "air" then
							meta:set_int("digDistance", distance+1)
						elseif not ocular_networks.config.live.laserDrill_blacklist[minetest.get_node({x=pos.x, y=pos.y-distance, z=pos.z}).name] then
							if source_power and source_power > 599 then
								if inv:room_for_item("output", minetest.registered_nodes[minetest.get_node({x=pos.x, y=pos.y-distance, z=pos.z}).name].drop) then
									minetest.emerge_area({x=pos.x, y=pos.y-distance, z=pos.z}, {x=pos.x, y=pos.y-distance+10, z=pos.z})
									source_meta:set_int("ocular_power", source_power-500)
									inv:add_item("output", minetest.registered_nodes[minetest.get_node({x=pos.x, y=pos.y-distance, z=pos.z}).name].drop or minetest.get_node({x=pos.x, y=pos.y-distance, z=pos.z}).name)
									minetest.set_node({x=pos.x, y=pos.y-distance, z=pos.z}, {name="air"})
								end
							end
						end
					end
				end
			end
		end
		meta:set_string("infotext", "Owned By: "..owner)
	end,
})

minetest.register_abm({
    label = "east-facing pipe",
	nodenames = {"ocular_networks:pipe_E"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x-1, y=pos.y, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x+1, y=pos.y, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name
		if owner == source_owner or source_owner=="" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "ocular_networks:pipe_E" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "west-facing pipe",
	nodenames = {"ocular_networks:pipe_W"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x+1, y=pos.y, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x-1, y=pos.y, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "ocular_networks:pipe_W" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "south-facing pipe",
	nodenames = {"ocular_networks:pipe_S"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z+1})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z-1})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "ocular_networks:pipe_S" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "north-facing pipe",
	nodenames = {"ocular_networks:pipe_N"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z-1})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z+1})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "ocular_networks:pipe_N" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "up-facing pipe",
	nodenames = {"ocular_networks:pipe_U"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "ocular_networks:pipe_U" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "down-facing pipe",
	nodenames = {"ocular_networks:pipe_D"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("output") then
				for i,stack in ipairs(source_inv:get_list("output")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("output", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("dst") then
				for i,stack in ipairs(source_inv:get_list("dst")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("dst", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			elseif source_inv:get_list("main") then
				for i,stack in ipairs(source_inv:get_list("main")) do
					if inv:room_for_item("pipe_buffer", stack) then
						source_inv:set_stack("main", i, {})
						inv:add_item("pipe_buffer", stack)
					end
				end
			end
			if target_node == "ocular_networks:pipe_D" then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("pipe_buffer", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("pipe_buffer", stack)
					end
				end
			elseif target_inv:get_list("main") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("main", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("main", stack)
					end
				end
			elseif target_inv:get_list("input") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("input", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("input", stack)
					end
				end
			elseif target_inv:get_list("src") then
				for i,stack in ipairs(inv:get_list("pipe_buffer")) do
					if target_inv:room_for_item("src", stack) then
						inv:set_stack("pipe_buffer", i, {})
						target_inv:add_item("src", stack)
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "trash extracting",
	nodenames = {"ocular_networks:pipe_filtered_D"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local destroyList = string.split(meta:get_string("items"), " ")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("main") then
				for _,item in ipairs(destroyList) do
					if source_inv:contains_item("main", item) then
						source_inv:remove_item("main", item)
						if target_inv:room_for_item("main", item) then
							target_inv:add_item("main", item)
						end
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "trash extracting",
	nodenames = {"ocular_networks:pipe_filtered_U"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local destroyList = string.split(meta:get_string("items"), " ")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("main") then
				for _,item in ipairs(destroyList) do
					if source_inv:contains_item("main", item) then
						source_inv:remove_item("main", item)
						if target_inv:room_for_item("main", item) then
							target_inv:add_item("main", item)
						end
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "trash extracting",
	nodenames = {"ocular_networks:pipe_filtered_N"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local destroyList = string.split(meta:get_string("items"), " ")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z-1})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z+1})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("main") then
				for _,item in ipairs(destroyList) do
					if source_inv:contains_item("main", item) then
						source_inv:remove_item("main", item)
						if target_inv:room_for_item("main", item) then
							target_inv:add_item("main", item)
						end
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "trash extracting",
	nodenames = {"ocular_networks:pipe_filtered_S"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local destroyList = string.split(meta:get_string("items"), " ")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z+1})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x, y=pos.y, z=pos.z-1})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z+1}).name
		local target_node = minetest.get_node({x=pos.x, y=pos.y, z=pos.z-1}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("main") then
				for _,item in ipairs(destroyList) do
					if source_inv:contains_item("main", item) then
						source_inv:remove_item("main", item)
						if target_inv:room_for_item("main", item) then
							target_inv:add_item("main", item)
						end
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "trash extracting",
	nodenames = {"ocular_networks:pipe_filtered_E"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local destroyList = string.split(meta:get_string("items"), " ")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x-1, y=pos.y, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x+1, y=pos.y, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("main") then
				for _,item in ipairs(destroyList) do
					if source_inv:contains_item("main", item) then
						source_inv:remove_item("main", item)
						if target_inv:room_for_item("main", item) then
							target_inv:add_item("main", item)
						end
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "trash extracting",
	nodenames = {"ocular_networks:pipe_filtered_W"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local destroyList = string.split(meta:get_string("items"), " ")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x+1, y=pos.y, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local target_meta = minetest.get_meta({x=pos.x-1, y=pos.y, z=pos.z})
		local target_owner = target_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		local target_inv = target_meta:get_inventory()
		local source_node = minetest.get_node({x=pos.x+1, y=pos.y, z=pos.z}).name
		local target_node = minetest.get_node({x=pos.x-1, y=pos.y, z=pos.z}).name
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("main") then
				for _,item in ipairs(destroyList) do
					if source_inv:contains_item("main", item) then
						source_inv:remove_item("main", item)
						if target_inv:room_for_item("main", item) then
							target_inv:add_item("main", item)
						end
					end
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "trash extracting",
	nodenames = {"ocular_networks:pipe_trashextractor"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local destroyList = string.split(meta:get_string("items"), " ")
		local inv = meta:get_inventory()
		local source_meta = minetest.get_meta({x=pos.x, y=pos.y+1, z=pos.z})
		local source_owner = source_meta:get_string("owner")
		local source_inv = source_meta:get_inventory()
		if owner == source_owner or source_owner == "" then
			if source_inv:get_list("main") then
				for _,item in ipairs(destroyList) do
					source_inv:remove_item("main", item.." 65535")
				end
			end
		end
	end,
})

minetest.register_abm({
    label = "growth",
	nodenames = {"ocular_networks:loomshroom"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "ocular_networks:dirt_with_loomshroom_grass" then
			local chance = math.random(1,100)
			if chance == 37 then
				minetest.set_node(pos, {name="ocular_networks:loomshroom2"})
			end
		end
	end,
})

minetest.register_abm({
    label = "growth",
	nodenames = {"ocular_networks:loomshroom2"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "ocular_networks:dirt_with_loomshroom_grass" then
			local chance = math.random(1,1000)
			if chance == 37 then
				minetest.set_node(pos, {name="ocular_networks:loomshroom3"})
			end
		end
	end,
})

minetest.register_abm({
    label = "growth",
	nodenames = {"ocular_networks:loomshroom3"},
	interval = 1,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "ocular_networks:dirt_with_loomshroom_grass" then
			local chance = math.random(1,1000)
			if chance == 3 then
				minetest.set_node(pos, {name="ocular_networks:loomshroom4"})
			end
		end
	end,
})