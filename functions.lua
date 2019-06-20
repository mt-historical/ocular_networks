local MP=minetest.get_modpath("ocular_networks")

local function disallow()
	for istring,node in pairs(minetest.registered_nodes) do
		if node.light_source then
			if node.light_source > 4 then
				table.insert(ocular_networks.disallowed, istring)
			end
		end
	end
end

ocular_networks.registered_meltables={}
ocular_networks.registered_alloys={}
ocular_networks.registered_fusions={}
ocular_networks.registered_passivecools={}
ocular_networks.player_temp_disk={}
ocular_networks.disallowed={}
ocular_networks.registered_chargeables={}
ocular_networks.chunkloaded_areas={}
ocular_networks.registered_shrooms={}
ocular_networks.registered_dessicables={}

minetest.register_chatcommand("ocun_exec", {
	params="luacode",
	description="execute UNSANDBOXED lua code.",
	privs={ocular_networks_dbg=true},
	func=function(name, param)
		loadstring(param)()
	end,
})

minetest.register_chatcommand("ocun_power_set", {
	params="<power> <x> <y> <z>",
	description="add ocun power of amount <power> at <x> <y> <z> (separate with spaces)",
	privs={ocular_networks_dbg=true},
	func=function(name, param)
		local l=string.split(param, " ")
		if l[1] and type(tonumber(l[1]))=="number" and l[2] and type(tonumber(l[2]))=="number" and l[3] and type(tonumber(l[3]))=="number" and l[4] and type(tonumber(l[4]))=="number" then
			local x, y, z=l[2], l[3], l[4]
			local meta=minetest.get_meta({x=x, y=y, z=z})
			meta:set_int("ocular_power", l[1])
			return true, "ocular_power field at "..x.." "..y.." "..z.." set to "..l[1] 
		else
			return false, "Incorrect usage"
		end
	end,
})

minetest.register_chatcommand("ocun_userpower_set", {
	params="<name> <amount>",
	description="set a player's personal power network to <amount>",
	privs={ocular_networks_dbg=true},
	func=function(name, param)
		local l=string.split(param, " ")
		local player=minetest.get_player_by_name(l[1])
		if player and player:is_player() then
			player:set_attribute("personal_ocular_power", l[2])
		end
	end,
})

if minetest.get_modpath("unified_inventory") then
	unified_inventory.register_craft_type("ocun_melting", {
		description="Metal Melter",
		icon="poly_battery_bottom.png^poly_frame.png^poly_furnace.png",
		width=2,
		height=1,
	})
	
	unified_inventory.register_craft_type("ocun_alloying", {
		description="Alloy Centrifuge",
		icon="poly_centrifuge.png^poly_frame.png",
		width=3,
		height=1,
	})
	
	unified_inventory.register_craft_type("ocun_fusing", {
		description="Fusion Compressor",
		icon="poly_compressor.png^poly_frame.png",
		width=3,
		height=1,
	})
	
	unified_inventory.register_craft_type("ocun_cooling", {
		description="Passive Cooler",
		icon="default_ice.png^poly_frame.png^poly_furnace.png",
		width=1,
		height=1,
	})
	
	unified_inventory.register_craft_type("ocun_charging", {
		description="Charging Station",
		icon="default_copper_block.png^poly_frame.png^poly_gui_icon_pwr.png",
		width=2,
		height=1,
	})
	
	unified_inventory.register_craft_type("ocun_shrooming", {
		description="Mycorrhizal Infusing",
		icon="poly_fertilizer_side.png",
		width=2,
		height=1,
	})
	
	unified_inventory.register_craft_type("ocun_dessicating", {
		description="Chemical Oven",
		icon="poly_chem_oven_front.png",
		width=2,
		height=1,
	})
		
	ocular_networks.register_meltable=function(def)
		table.insert(ocular_networks.registered_meltables, {input=def.input, output=def.output, cost=def.cost})
		unified_inventory.register_craft({
		type="ocun_melting",
		items={"ocular_networks:placeholder_power "..def.cost, def.input},
		output=def.output,
		width=2,
		})
	end

	ocular_networks.register_alloyable=function(def)
		table.insert(ocular_networks.registered_alloys, {input1=def.metal_1, input2=def.metal_2, output=def.output, cost=def.cost, _return=def.give_back})
		unified_inventory.register_craft({
		type="ocun_alloying",
		items={"ocular_networks:placeholder_power "..def.cost, def.metal_1, def.metal_2},
		output=def.output,
		width=3,
		})
	end


	ocular_networks.register_fusion=function(def)
		table.insert(ocular_networks.registered_fusions, {input1=def.item_1, input2=def.item_2, output=def.output, cost=def.cost, _return=def.give_back})
		unified_inventory.register_craft({
		type="ocun_fusing",
		items={"ocular_networks:placeholder_power "..def.cost, def.item_1, def.item_2},
		output=def.output,
		width=3,
		})
	end

	ocular_networks.register_passive_cool=function(def)
		table.insert(ocular_networks.registered_passivecools, {input=def.item, output=def.output})
		unified_inventory.register_craft({
		type="ocun_cooling",
		items={def.item},
		output=def.output,
		width=3,
		})
	end

	ocular_networks.register_chargeable=function(def)
		table.insert(ocular_networks.registered_chargeables, {input=def.item, output=def.output, cost=def.cost})
		unified_inventory.register_craft({
		type="ocun_charging",
		items={"ocular_networks:placeholder_power "..def.cost, def.item},
		output=def.output,
		width=2,
		})
	end
	
	ocular_networks.register_shroomable=function(def)
		table.insert(ocular_networks.registered_shrooms, {input=def.node, output=def.output, cost=def.cost})
		unified_inventory.register_craft({
		type="ocun_shrooming",
		items={"ocular_networks:placeholder_power "..def.cost, def.node},
		output=def.output,
		width=2,
		})
	end
	
	ocular_networks.register_dessicable=function(def)
		table.insert(ocular_networks.registered_dessicables, {input=def.material, output=def.output, cost=def.cost})
		unified_inventory.register_craft({
		type="ocun_dessicating",
		items={"ocular_networks:placeholder_power "..def.cost, def.material},
		output=def.output,
		width=2,
		})
	end
else
	ocular_networks.register_meltable=function(def)
		table.insert(ocular_networks.registered_meltables, {input=def.input, output=def.output, cost=def.cost})
	end

	ocular_networks.register_alloyable=function(def)
		table.insert(ocular_networks.registered_alloys, {input1=def.metal_1, input2=def.metal_2, output=def.output, cost=def.cost, _return=def.give_back})
	end


	ocular_networks.register_fusion=function(def)
		table.insert(ocular_networks.registered_fusions, {input1=def.item_1, input2=def.item_2, output=def.output, cost=def.cost, _return=def.give_back})
	end

	ocular_networks.register_passive_cool=function(def)
		table.insert(ocular_networks.registered_passivecools, {input=def.item, output=def.output})
	end

	ocular_networks.register_chargeable=function(def)
		table.insert(ocular_networks.registered_chargeables, {input=def.item, output=def.output, cost=def.cost})
	end
	
	ocular_networks.register_shroomable=function(def)
		table.insert(ocular_networks.registered_shrooms, {input=def.node, output=def.output, cost=def.cost})
	end
	
	ocular_networks.register_dessicable=function(def)
		table.insert(ocular_networks.registered_dessicables, {input=def.material, output=def.output, cost=def.cost})
	end
end

ocular_networks.get_config=function(nam)
	local con=dofile(MP.."/config.txt")
	return con[nam]
end

minetest.register_on_joinplayer(function(player)
	player:set_attribute("ocular_networks_hud_power", nil)
end)

ocular_networks.register_probeCommand=function(def)
	table.insert(ocular_networks.netCommands, {desc=def.description, func=def.func})
end

minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		if player:get_attribute("personal_ocular_power") then
			if tonumber(player:get_attribute("personal_ocular_power")) > ocular_networks.get_config("max_personal_network_power") then
				player:set_attribute("personal_ocular_power", ocular_networks.get_config("max_personal_network_power"))
			end
			if player:get_attribute("ocular_networks_hud_power") then
				player:hud_change(tonumber(player:get_attribute("ocular_networks_hud_power")), "text", "Network OCP: "..player:get_attribute("personal_ocular_power"))
			else
				if player:get_attribute("personal_ocular_power") then
				local hud=player:hud_add({
						hud_elem_type="text",
						position={x=0.5,y=0.87},
						number= 0xffffff,
						scale={x=100,y=100},
						text="Network OCP: "..player:get_attribute("personal_ocular_power"),
						alignment=0,
						
					})
					player:set_attribute("ocular_networks_hud_power", hud)
				else
					player:set_attribute("personal_ocular_power", 0)
				end
			end
		else
			player:set_attribute("personal_ocular_power", "0")
		end
	end
end)

minetest.after(0, disallow)