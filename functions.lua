

local function disallow()
	for istring,node in pairs(minetest.registered_nodes) do
		if node.light_source then
			if node.light_source > 4 then
				table.insert(ocular_networks.disallowed, istring)
			end
		end
	end
end

function ocular_networks.tableHasKey(table,key)
	return table[key] ~= nil
end

ocular_networks.registered_meltables={}
ocular_networks.registered_alloys={}
ocular_networks.registered_fusions={}
ocular_networks.registered_passivecools={}
ocular_networks.player_temp_disk={}
ocular_networks.disallowed={}
ocular_networks.registered_chargeables={}

minetest.register_chatcommand("ocun_exec", {
	params = "luacode",
	description = "execute UNSANDBOXED lua code.",
	privs = {ocular_networks_dbg=true},
	func = function(name, param)
		loadstring(param)()
	end,
})

minetest.register_chatcommand("ocun_power_set", {
	params = "<power> <x> <y> <z>",
	description = "add ocun power of amount <power> at <x> <y> <z> (separate with spaces)",
	privs = {ocular_networks_dbg=true},
	func = function(name, param)
		local l = string.split(param, " ")
		if l[1] and type(tonumber(l[1]))=="number" and l[2] and type(tonumber(l[2]))=="number" and l[3] and type(tonumber(l[3]))=="number" and l[4] and type(tonumber(l[4]))=="number" then
			local x, y, z = l[2], l[3], l[4]
			local meta = minetest.get_meta({x=x, y=y, z=z})
			meta:set_int("ocular_power", l[1])
			return true, "ocular_power field at "..x.." "..y.." "..z.." set to "..l[1] 
		else
			return false, "Incorrect usage"
		end
	end,
})

minetest.register_chatcommand("ocun_userpower_set", {
	params = "<name> <amount>",
	description = "set a player's personal power network to <amount>",
	privs = {ocular_networks_dbg=true},
	func = function(name, param)
		local l = string.split(param, " ")
		local player = minetest.get_player_by_name(l[1])
		if player and player:is_player() then
			player:set_attribute("personal_ocular_power", l[2])
		end
	end,
})

if minetest.get_modpath("unified_inventory") then
	
	unified_inventory.register_craft_type("ocun_melting", {
		description = "Metal Melter",
		icon = "poly_battery_bottom.png^poly_frame.png^poly_furnace.png",
		width = 2,
		height = 1,
	})
	
	unified_inventory.register_craft_type("ocun_alloying", {
		description = "Alloy Centrifuge",
		icon = "poly_centrifuge.png^poly_frame.png",
		width = 3,
		height = 1,
	})
	
	unified_inventory.register_craft_type("ocun_fusing", {
		description = "Fusion Compressor",
		icon = "poly_compressor.png^poly_frame.png",
		width = 3,
		height = 1,
	})
	
	unified_inventory.register_craft_type("ocun_cooling", {
		description = "Passive Cooler",
		icon = "default_ice.png^poly_frame.png^poly_furnace.png",
		width = 1,
		height = 1,
	})
	
	unified_inventory.register_craft_type("ocun_charging", {
		description = "Charging Station",
		icon = "default_copper_block.png^poly_frame.png^poly_gui_icon_pwr.png",
		width = 2,
		height = 1,
	})
		
	ocular_networks.register_meltable=function(def)
		table.insert(ocular_networks.registered_meltables, {input=def.input, output=def.output, cost=def.cost})
		unified_inventory.register_craft({
		type = "ocun_melting",
		items = {"ocular_networks:placeholder_power "..def.cost, def.input},
		output = def.output,
		width = 2,
		})
	end

	ocular_networks.register_alloyable=function(def)
		table.insert(ocular_networks.registered_alloys, {input1=def.metal_1, input2=def.metal_2, output=def.output, cost=def.cost, _return=def.give_back})
		unified_inventory.register_craft({
		type = "ocun_alloying",
		items = {"ocular_networks:placeholder_power "..def.cost, def.metal_1, def.metal_2},
		output = def.output,
		width = 3,
		})
	end


	ocular_networks.register_fusion=function(def)
		table.insert(ocular_networks.registered_fusions, {input1=def.item_1, input2=def.item_2, output=def.output, cost=def.cost, _return=def.give_back})
		unified_inventory.register_craft({
		type = "ocun_fusing",
		items = {"ocular_networks:placeholder_power "..def.cost, def.item_1, def.item_2},
		output = def.output,
		width = 3,
		})
	end

	ocular_networks.register_passive_cool=function(def)
		table.insert(ocular_networks.registered_passivecools, {input=def.item, output=def.output})
		unified_inventory.register_craft({
		type = "ocun_cooling",
		items = {def.item},
		output = def.output,
		width = 3,
		})
	end

	ocular_networks.register_chargeable=function(def)
		table.insert(ocular_networks.registered_chargeables, {input=def.item, output=def.output, cost=def.cost})
		unified_inventory.register_craft({
		type = "ocun_charging",
		items = {"ocular_networks:placeholder_power "..def.cost, def.item},
		output = def.output,
		width = 2,
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

end

minetest.register_on_joinplayer(function(player)
	player:set_attribute("ocular_networks_hud_power", nil)
end)

minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		if player:get_attribute("personal_ocular_power") then
			if tonumber(player:get_attribute("personal_ocular_power")) > ocular_networks.config.live.max_personal_network_power then
				player:set_attribute("personal_ocular_power", ocular_networks.config.live.max_personal_network_power)
			end
			if player:get_attribute("ocular_networks_hud_power") then
				player:hud_change(tonumber(player:get_attribute("ocular_networks_hud_power")), "text", "Ocular Power: "..player:get_attribute("personal_ocular_power"))
			else
				if player:get_attribute("personal_ocular_power") then
				local hud = player:hud_add({
						hud_elem_type="text",
						position = {x=0.5,y=0.87},
						number= 0xffffff,
						scale={x=100,y=100},
						text="Ocular Power: "..player:get_attribute("personal_ocular_power"),
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


local skin_previews = {}
local use_player_monoids = minetest.global_exists("player_monoids")
local use_armor_monoid = minetest.global_exists("armor_monoid")
local use_pova_mod = minetest.get_modpath("pova")
local armor_def = setmetatable({}, {
	__index = function()
		return setmetatable({
			groups = setmetatable({}, {
				__index = function()
					return 0
				end})
			}, {
			__index = function()
				return 0
			end
		})
	end,
})
local armor_textures = setmetatable({}, {
	__index = function()
		return setmetatable({}, {
			__index = function()
				return "blank.png"
			end
		})
	end
})

armor.set_player_armor_defense = function(self, player) -- this stupid hacky script is designed to reload the armor properties but not the physics
	local name, armor_inv = self:get_valid_player(player, "[set_player_armor]")
	if not name then
		return
	end
	local state = 0
	local count = 0
	local material = {count=1}
	local preview = armor:get_preview(name)
	local texture = "3d_armor_trans.png"
	local textures = {}
	local attributes = {}
	local levels = {}
	local groups = {}
	local change = {}
	for _, attr in pairs(self.attributes) do
		attributes[attr] = 0
	end
	for group, _ in pairs(self.registered_groups) do
		change[group] = 1
		levels[group] = 0
	end
	local list = armor_inv:get_list("armor")
	if type(list) ~= "table" then
		return
	end
	for i, stack in pairs(list) do
		if stack:get_count() == 1 then
			local def = stack:get_definition()
			for _, element in pairs(self.elements) do
				if def.groups["armor_"..element] then
					if def.armor_groups then
						for group, level in pairs(def.armor_groups) do
							if levels[group] then
								levels[group] = levels[group] + level
							end
						end
					else
						local level = def.groups["armor_"..element]
						levels["fleshy"] = levels["fleshy"] + level
					end
					break
				end
				-- DEPRECATED, use armor_groups instead
				if def.groups["armor_radiation"] and levels["radiation"] then
					levels["radiation"] = def.groups["armor_radiation"]
				end
			end
			local item = stack:get_name()
			local tex = def.texture or item:gsub("%:", "_")
			tex = tex:gsub(".png$", "")
			local prev = def.preview or tex.."_preview"
			prev = prev:gsub(".png$", "")
			texture = texture.."^"..tex..".png"
			preview = preview.."^"..prev..".png"
			state = state + stack:get_wear()
			count = count + 1
			for _, attr in pairs(self.attributes) do
				local value = def.groups["armor_"..attr] or 0
				attributes[attr] = attributes[attr] + value
			end
			local mat = string.match(item, "%:.+_(.+)$")
			if material.name then
				if material.name == mat then
					material.count = material.count + 1
				end
			else
				material.name = mat
			end
		end
	end
	for group, level in pairs(levels) do
		if level > 0 then
			level = level * armor.config.level_multiplier
			if material.name and material.count == #self.elements then
				level = level * 1.1
			end
		end
		local base = self.registered_groups[group]
		self.def[name].groups[group] = level
		if level > base then
			level = base
		end
		groups[group] = base - level
		change[group] = groups[group] / base
	end
	for _, attr in pairs(self.attributes) do
		local mult = attr == "heal" and self.config.heal_multiplier or 1
		self.def[name][attr] = attributes[attr] * mult
	end
	if use_armor_monoid then
		armor_monoid.monoid:add_change(player, change, "3d_armor:armor")
	else
		player:set_armor_groups(groups)
	end
	self.textures[name].armor = texture
	self.textures[name].preview = preview
	self.def[name].level = self.def[name].groups.fleshy or 0
	self.def[name].state = state
	self.def[name].count = count
	if unified_inventory.current_page[name] == "armor" then
		unified_inventory.set_inventory_formspec(player, "armor")
	end
end