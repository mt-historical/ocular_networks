ocular_networks.channel_states={}

ocular_networks.netCommands={
	["help"]={
		name="help",
		desc="List commands, or provide help for a specified command. | Syntax: help | help <cmd>",
		func=function(arg)
			if arg then
				if ocular_networks.netCommands[arg] then
					return ocular_networks.netCommands[arg].desc
				else
					return "Command "..arg.." doesn't exist"
				end
			else
				return 	"Available commands:\n"..
						"help : List commands, or provide help for a specified command. | Syntax: help | help <cmd>\n"..
						"write : Set a channel value. | Syntax: write <channel>=<val>\n"..
						"read : Print the content of a channel. | Syntax: read <channel>\n"..
						"display : Print the content of a channel as an array. | Syntax: display <channel>\n"..
						"denote : Turn a list of args into a table and write it to a channel. | Syntax: denote <channel>=<arg1>,<arg2>,<arg3>"
			end
			return "(This message should never show up, report immediately) [HELP]["..arg.."]"
		end,
	},
	["write"]={
		name="write",
		desc="Set a channel value. | Syntax: write <channel>=<val>",
		func=function(arg)
			if arg then
				local args=string.split(arg, "=")
				if #args==2 then
					ocular_networks.channel_states[args[1]]=tostring(args[2])
					return "Value of channel '"..args[1].."' set to '"..args[2].."'."
				else
					return "Invalid argument structure"
				end
			else
				return "No arguments specified"
			end
			return "(This message should never show up, report immediately) [WRITE]["..arg.."]"
		end,
	},
	["read"]={
		name="read",
		desc="Print the content of a channel. | Syntax: read <channel>", 
		func=function(arg)
			if arg then
				if ocular_networks.channel_states[arg] then
					if type(ocular_networks.channel_states[arg])=="string" then
						return ocular_networks.channel_states[arg]
					else
						return "Expected string, got "..type(ocular_networks.channel_states[arg])
					end
				else
					return "Channel "..arg.." does not exist"
				end
			else
				return "No arguments specified"
			end
			return "(This message should never show up, report immediately) [READ]["..arg.."]"
		end,
	},
	["denote"]={
		name="denote",
		desc="denote : Turn a list of args into a table and write it to a channel. | Syntax: denote <channel>=<arg1>,<arg2>,<arg3>", 
		func=function(arg)
			if arg then
				local args=string.split(arg, "=")
				if #args==2 then
					ocular_networks.channel_states[args[1]]=string.split(args[2], ",")
					return "Value of channel '"..args[1].."' set to '"..dump(string.split(args[2], ",")).."'."
				end
			else
				return "No arguments specified"
			end
			return "(This message should never show up, report immediately) [DENOTE]["..arg.."]"
		end,
	},
	["display"]={
		name="display",
		desc="display : Print the content of a channel as an array. | Syntax: display <channel>", 
		func=function(arg)
			if arg then
				if ocular_networks.channel_states[arg] then
					if type(ocular_networks.channel_states[arg])=="table" then
						local list=""
						if ocular_networks.channel_states[arg]["OCProbeCsum_e"] and ocular_networks.channel_states[arg]["OCProbeCsum_e"]=="_proof_inventory" then
							for _,i in ipairs(ocular_networks.channel_states[arg]) do
								list=list.."( "..i:get_name().." ), "
							end
							return list
						else
							for _,i in ipairs(ocular_networks.channel_states[arg]) do
								list=list.."( "..dump(i).." ), "
							end
							return list
						end
					else
						return "Expected table, got "..type(ocular_networks.channel_states[arg])
					end
				else
					return "Channel "..arg.." does not exist"
				end
			else
				return "No arguments specified"
			end
			return "(This message should never show up, report immediately) [DISPLAY2]["..arg.."]"
		end,
	},
}

local prb="size[8,9;]background[0,0;0,0;poly_gui_formbg2.png;true]textarea[1,1;6.5,8;;;"
local ef="]field_close_on_enter[cmd;false]field[0,8.9;7.5,1;cmd;;]button[7,8.59;1.2,1;send;|==>]"

local st={
	description="Ocular Logistics Controller\n"..minetest.colorize("#00affa", "Rightclick to output the metadata of a node.\nSneak-Click to open your performance tweaks.\nClick to open the probe message service."),
	inventory_image="poly_disk2.png",
	not_in_creative_inventory=1,
	stack_max=1,
	on_place=function(itemstack, placer, pointed_thing)
		if pointed_thing.type=="node" then
			local meta=minetest.get_meta(minetest.get_pointed_thing_position(pointed_thing, nil))
			local pseudodata=meta:to_table().fields
			if pseudodata.formspec then
				pseudodata.formspec="omitted"
			end
			minetest.show_formspec(placer:get_player_name(), "", "size[8,9;]background[0,0;0,0;poly_gui_formbg2.png;true]textarea[0,0.5;8.5,9.5;arb;Metadata breakdown:;"..dump(pseudodata).."]")
		end	
	end,
	
	on_use=function(itemstack, placer, pointed_thing)
		minetest.show_formspec(placer:get_player_name(), "Poly_disk2IO", prb.."> Type 'help' for a list of commands"..ef)
	end
}

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname=="Poly_disk2IO" then
		if fields.cmd then
			local commandElems=string.split(fields.cmd, " ")
			if ocular_networks.netCommands[commandElems[1]] then
				local output=ocular_networks.netCommands[commandElems[1]].func(commandElems[2])
				minetest.show_formspec(player:get_player_name(), "Poly_disk2IO", prb.."$ "..fields.cmd.."\n"..output..ef)
			else
				minetest.show_formspec(player:get_player_name(), "Poly_disk2IO", prb.."$ "..fields.cmd.."\nCommand '"..fields.cmd.." does not exist."..ef)
			end
		end
	end
end)

if ocular_networks.get_config("load_armor_upgrades") then
	st.on_use=function(itemstack, placer, pointed_thing)
		if placer:get_player_control().sneak == true then
			local inv=placer:get_inventory()
			if inv:get_lists().ocn_armor_upgrades and inv:get_lists().ocn_cyber_upgrades then
				minetest.show_formspec(placer:get_player_name(), "ocn_armor_upgrades_2", "size[8,9;]background[0,0;0,0;poly_gui_formbg2.png;true]list[current_player;main;0,5;8,4;]label[1.5,0.2;Armor Upgrades]list[current_player;ocn_armor_upgrades;1.5,0.6;5,1;]label[1.5,1.7;Cybernetic Upgrades]list[current_player;ocn_cyber_upgrades;1.5,2.1;5,1;]")
			else
				inv:set_list("ocn_armor_upgrades", {})
				inv:set_size("ocn_armor_upgrades", 32)
				inv:set_list("ocn_cyber_upgrades", {})
				inv:set_size("ocn_cyber_upgrades", 32)
			end
		else
			minetest.show_formspec(placer:get_player_name(), "Poly_disk2IO", prb.."> Type 'help' for a list of commands"..ef)
		end
	end
end

minetest.register_craftitem("ocular_networks:probe", st)

minetest.register_craft({
	output="ocular_networks:probe",
	recipe={
		{"ocular_networks:silicotin_bar", "ocular_networks:silicotin_bar", "ocular_networks:inspector"},
		{"ocular_networks:shimmering_bar", "default:obsidian_glass", "ocular_networks:shimmering_bar"},
		{"default:steel_ingot", "ocular_networks:performance_controller", "default:steel_ingot"}
	}
})

local nodespec=""..
"size[10,6]"..
"background[0,0;0,0;poly_gui_formbg.png;true]"..
"label[0.9,0;data to read:]"..
"dropdown[1,1;4,1;mode;inventory,metadata,nodename,mesecon;${mode}]"..
"field[1,2.7;8,1;attr;Inventory name or metadata field:;${attr}]"..
"field[1,4.4;8,1;channel;channel to use:;${channel}]"..
"button_exit[0.74,5;8,1;save;Save]"

minetest.register_node("ocular_networks:networkprobe", {
	description="Network Probe (Uplink)\n"..minetest.colorize("#00affa", "Can be configured to read fields from the node below, and send them to the channel network."),
	tiles={"poly_uplink3.png", "poly_battery_bottom.png", "poly_uplink_side3.png"},
	is_ground_content=false,
	sunlight_propagates=true,
	drawtype="nodebox",
	paramtype="light",
	groups={cracky=3, oddly_breakable_by_hand=3},
	sounds=default.node_sound_metal_defaults(),
	on_construct=function(pos)
		local meta=minetest.get_meta(pos)
		meta:set_string("channel", "")
		meta:set_string("mode", "")
		meta:set_string("attr", "")
		meta:set_string("formspec", nodespec)
	end,
	on_receive_fields=function(pos, formname, fields, sender)
		local meta=minetest.get_meta(pos)
		if sender:get_player_name() == meta:get_string("owner") then
			meta:set_string("channel", fields.channel or "")
			meta:set_string("mode", fields.mode)
			meta:set_string("attr", fields.attr or "")
		else
			minetest.chat_send_player(sender:get_player_name(), "This mechanism is owned by "..meta:get_string("owner").."!")
		end
	end,
	mesecons={effector={rules=mesecon.rules.default,
		action_on=function(pos, node)
			local meta=minetest.get_meta(pos)
			meta:set_string("MCON", "true")
		end,
		action_off=function(pos, node)
			local meta=minetest.get_meta(pos)
			meta:set_string("MCON", "false")
		end}},
	after_place_node=function(pos, placer, itemstack, pointed_thing)
		local meta=minetest.get_meta(pos)
		local owner=placer:get_player_name()
		meta:set_string("owner", owner)
		meta:set_string("infotext", "Sending data: "..meta:get_string("attr").."\nover channel:"..meta:get_string("channel").."\nOwned By: "..owner)
	end,
	can_dig=function(pos, player)
		local meta=minetest.get_meta(pos)
		local owner=meta:get_string("owner")
		return owner == player:get_player_name()
	end,
	selection_box={
		type="fixed",
		fixed= {-4 / 16, -0.5, -4 / 16, 4 / 16, -0.25, 4 / 16}
	},
	node_box={
		type="fixed",
		fixed= {	{-4 / 16, -0.5, -4 / 16, 4 / 16, -0.25, 4 / 16},
					{-5 / 16, -0.5, -3 / 16, 5 / 16, -0.4, 3 / 16},
					{-3 / 16, -0.5, -5 / 16, 3 / 16, -0.4, 5 / 16},
					{-1 / 16, -0.5, -1 / 16, 1 / 16, 0.4, 1 / 16}}
	}
})

minetest.register_abm({
    label="uplink probe",
	nodenames={"ocular_networks:networkprobe"},
	interval=1,
	chance=1,
	catch_up=true,
	action=function(pos, node)
		local node_below=minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
		local meta=minetest.get_meta(pos)
		local meta2=minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local owner=meta:get_string("owner")
		meta:set_string("infotext", "Sending data: "..meta:get_string("attr").."\nover channel: "..meta:get_string("channel").."\nOwned By: "..owner)
		if meta:get_string("mode") == "inventory" then
			local inv=meta2:get_inventory()
			if inv:get_list(meta:get_string("attr")) then
				local finvr=inv:get_lists()[meta:get_string("attr")]
				finvr.OCProbeCsum_e="_proof_inventory"
				ocular_networks.channel_states[meta:get_string("channel")]=finvr
			end
		elseif meta:get_string("mode") == "metadata" then
			if meta2:get_string(meta:get_string("attr")) then
				ocular_networks.channel_states[meta:get_string("channel")]=meta2:get_string(meta:get_string("attr"))
			else
				ocular_networks.channel_states[meta:get_string("channel")]="nil"
			end
		elseif meta:get_string("mode") == "nodename" then
			ocular_networks.channel_states[meta:get_string("channel")]=node_below.name
		elseif meta:get_string("mode") == "mesecon" then
			if meta:get_string("MCON")=="true" then
				ocular_networks.channel_states[meta:get_string("channel")]="true"
			else
				ocular_networks.channel_states[meta:get_string("channel")]="false"
			end
		end
	end,
})

minetest.register_craft({
	output="ocular_networks:networkprobe",
	recipe={
		{"default:copper_ingot", "ocular_networks:toxic_slate_rod", "default:copper_ingot"},
		{"ocular_networks:zweinium_crystal", "ocular_networks:networknode", "ocular_networks:zweinium_crystal"},
		{"ocular_networks:shimmering_bar", "default:coal_lump", "ocular_networks:shimmering_bar"}
	}
})

local nodespec2=""..
"size[10,6]"..
"background[0,0;0,0;poly_gui_formbg.png;true]"..
"label[0.9,0;data to modify:]"..
"dropdown[1,1;4,1;mode;switch,mesecon;${mode}]"..
"field[1,2.7;8,1;attr;channel value required:;${attr}]"..
"field[1,4.4;8,1;channel;channel to use:;${channel}]"..
"button_exit[0.74,5;8,1;save;Save]"

minetest.register_node("ocular_networks:networkprobe2", {
	description="Network Probe (Downlink)\n"..minetest.colorize("#00affa", "Can be configured to enable or disable the node below,\nor send a mesecon signal."),
	tiles={"poly_uplink4.png", "poly_battery_bottom.png", "poly_uplink_side4.png"},
	is_ground_content=false,
	sunlight_propagates=true,
	drawtype="nodebox",
	paramtype="light",
	groups={cracky=3, oddly_breakable_by_hand=3},
	sounds=default.node_sound_metal_defaults(),
	mesecons= {
		receptor={
			state=mesecon.state.off,
			rules=mesecon.rules.default
		},
	},
	on_construct=function(pos)
		local meta=minetest.get_meta(pos)
		meta:set_string("channel", "")
		meta:set_string("mode", "")
		meta:set_string("attr", "")
		meta:set_string("formspec", nodespec2)
	end,
	on_receive_fields=function(pos, formname, fields, sender)
		local meta=minetest.get_meta(pos)
		if sender:get_player_name() == meta:get_string("owner") then
			meta:set_string("channel", fields.channel or "")
			meta:set_string("mode", fields.mode)
			meta:set_string("attr", fields.attr or "")
		else
			minetest.chat_send_player(sender:get_player_name(), "This mechanism is owned by "..meta:get_string("owner").."!")
		end
	end,
	after_place_node=function(pos, placer, itemstack, pointed_thing)
		local meta=minetest.get_meta(pos)
		local owner=placer:get_player_name()
		meta:set_string("owner", owner)
		meta:set_string("infotext", "Receiving data over channel:"..meta:get_string("channel").."\nOwned By: "..owner)
	end,
	can_dig=function(pos, player)
		local meta=minetest.get_meta(pos)
		local owner=meta:get_string("owner")
		return owner == player:get_player_name()
	end,
	selection_box={
		type="fixed",
		fixed= {-4 / 16, -0.5, -4 / 16, 4 / 16, -0.25, 4 / 16}
	},
	node_box={
		type="fixed",
		fixed= {	{-4 / 16, -0.5, -4 / 16, 4 / 16, -0.25, 4 / 16},
					{-5 / 16, -0.5, -3 / 16, 5 / 16, -0.4, 3 / 16},
					{-3 / 16, -0.5, -5 / 16, 3 / 16, -0.4, 5 / 16},
					{-1 / 16, -0.5, -1 / 16, 1 / 16, 0.4, 1 / 16}}
	}
})

minetest.register_node("ocular_networks:networkprobe2_MCON", {
	tiles={"poly_uplink5.png", "poly_battery_bottom.png", "poly_uplink_side5.png"},
	is_ground_content=false,
	sunlight_propagates=true,
	drawtype="nodebox",
	paramtype="light",
	groups={cracky=3, oddly_breakable_by_hand=3},
	sounds=default.node_sound_metal_defaults(),
	mesecons= {
		receptor={
			state=mesecon.state.on,
			rules=mesecon.rules.default
		},
	},
	on_construct=function(pos)
		local meta=minetest.get_meta(pos)
		meta:set_string("channel", "")
		meta:set_string("mode", "")
		meta:set_string("attr", "")
		meta:set_int("modeidx",1)
		meta:set_string("formspec", nodespec2)
	end,
	on_receive_fields=function(pos, formname, fields, sender)
		local meta=minetest.get_meta(pos)
		if sender:get_player_name() == meta:get_string("owner") then
			meta:set_string("channel", fields.channel or "")
			meta:set_string("mode", fields.mode)
			local midx={
			 ["switch"]=1,
			 ["mesecon"]=2
			 }
			if midx[fields.mode] then
				meta:set_int("modeidx", midx[fields.mode])
			else
				meta:set_int("modeidx", 1)
			end
			meta:set_string("attr", fields.attr or "")
		else
			minetest.chat_send_player(sender:get_player_name(), "This mechanism is owned by "..meta:get_string("owner").."!")
		end
	end,
	can_dig=function(pos, player)
		local meta=minetest.get_meta(pos)
		local owner=meta:get_string("owner")
		return owner == player:get_player_name()
	end,
	selection_box={
		type="fixed",
		fixed= {-4 / 16, -0.5, -4 / 16, 4 / 16, -0.25, 4 / 16}
	},
	node_box={
		type="fixed",
		fixed= {	{-4 / 16, -0.5, -4 / 16, 4 / 16, -0.25, 4 / 16},
					{-5 / 16, -0.5, -3 / 16, 5 / 16, -0.4, 3 / 16},
					{-3 / 16, -0.5, -5 / 16, 3 / 16, -0.4, 5 / 16},
					{-1 / 16, -0.5, -1 / 16, 1 / 16, 0.4, 1 / 16}}
	},
	groups={not_in_creative_inventory=1, cracky=1},
	drop="ocular_networks:networkprobe2",
})

minetest.register_abm({
    label="downlink probe",
	nodenames={"ocular_networks:networkprobe2"},
	interval=1,
	chance=1,
	catch_up=true,
	action=function(pos, node)
		local node_below=minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
		local meta=minetest.get_meta(pos)
		local meta2=minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local owner=meta:get_string("owner")
		meta:set_string("infotext", "Receiving data over channel:"..meta:get_string("channel").."\nOwned By: "..owner)
		if meta:get_string("mode") == "switch" then
			local verifstates={
				["on"]=true,
				["HIGH"]=true,
				["true"]=true,
				["1"]=true,
			}
			if verifstates[ocular_networks.channel_states[meta:get_string("channel")]] then
				meta2:set_string("enabled", "true")
			else
				meta2:set_string("enabled", "false")
			end
		elseif meta:get_string("mode") == "mesecon" then
			if ocular_networks.channel_states[meta:get_string("channel")] == meta:get_string("attr") then
				minetest.swap_node(pos, {name="ocular_networks:networkprobe2_MCON"})
				mesecon.receptor_on(pos, mesecon.rules.default)
			end
		end
	end,
})

minetest.register_abm({
    label="downlink probe",
	nodenames={"ocular_networks:networkprobe2_MCON"},
	interval=1,
	chance=1,
	catch_up=true,
	action=function(pos, node)
		local node_below=minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
		local meta=minetest.get_meta(pos)
		local meta2=minetest.get_meta({x=pos.x, y=pos.y-1, z=pos.z})
		local owner=meta:get_string("owner")
		meta:set_string("infotext", "Receiving data over channel:"..meta:get_string("channel").."\nOwned By: "..owner)
		if ocular_networks.channel_states[meta:get_string("channel")] ~= meta:get_string("attr") then
			minetest.swap_node(pos, {name="ocular_networks:networkprobe2"})
			mesecon.receptor_off(pos, mesecon.rules.default)
		end
	end,
})

minetest.register_craft({
	output="ocular_networks:networkprobe2",
	recipe={
		{"default:copper_ingot", "ocular_networks:toxic_slate_rod", "default:copper_ingot"},
		{"ocular_networks:zweinium_crystal", "ocular_networks:networknode2", "ocular_networks:zweinium_crystal"},
		{"ocular_networks:shimmering_bar", "default:coal_lump", "ocular_networks:shimmering_bar"}
	}
})