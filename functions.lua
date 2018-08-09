

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

minetest.register_on_joinplayer(function(player)
	player:set_attribute("ocular_networks_hud_power", nil)
end)

minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
	if player:get_attribute("personal_ocular_power") then
		if tonumber(player:get_attribute("personal_ocular_power")) > 1000000000000 then
			player:set_attribute("personal_ocular_power", 1000000000000)
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
	end
	end
end)


minetest.after(0, disallow)