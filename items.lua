
minetest.register_craftitem("ocular_networks:lens", {
	description = "Silver Lens\n"..minetest.colorize("#00affa", "Rightclick a frame with this to make it\npower batteries under it"),
	inventory_image = "poly_silver_lens.png",
})

minetest.register_craftitem("ocular_networks:cross", {
	description = "Plated Cross\n"..minetest.colorize("#00affa", "Rightclick a frame with this to make it\na machine stucture block"),
	inventory_image = "poly_cross.png",
})

minetest.register_craftitem("ocular_networks:inspector", {
	description = "Ocular Inspection Tool\n"..minetest.colorize("#00affa", "Sneak and rightclick on a node to \ninspect it"),
	inventory_image = "poly_inspector.png",
	stack_max=1,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type=="node" then
			local meta = minetest.get_meta(minetest.get_pointed_thing_position(pointed_thing, nil))
			local pseudodata=meta:to_table().fields
			if pseudodata.formspec then
				pseudodata.formspec="omitted"
			end
			minetest.show_formspec(placer:get_player_name(), "", "size[7,8;]textarea[0,0.5;7.5,9;arb;Ocular Inspector;"..dump(pseudodata).."]")
		end
	end
})

minetest.register_craftitem("ocular_networks:luminium_lump", {
	description = "Luminium Lump\n"..minetest.colorize("#00affa", "Smelt it to obtain a luminium ingot,\na very useful material"),
	inventory_image = "poly_luminium_l.png",
})

minetest.register_craftitem("ocular_networks:luminium_chip", {
	description = "Luminium Chip\n"..minetest.colorize("#00affa", "Nine of these makes a luminium lump."),
	inventory_image = "poly_luminium_c.png",
})

minetest.register_craftitem("ocular_networks:luminium_bar", {
	description = "Luminium Ingot\n"..minetest.colorize("#00affa", "Used to make many things"),
	inventory_image = "poly_luminium_i.png",
})

minetest.register_craftitem("ocular_networks:piston", {
	description = "Piston\n"..minetest.colorize("#00affa", "Hydraulic motion!"),
	inventory_image = "poly_piston.png",
})

minetest.register_craftitem("ocular_networks:silver_dust", {
	description = "Silver Dust\n"..minetest.colorize("#00affa", "Sifted silver sand... \nNow mix it with broken glass."),
	inventory_image = "poly_silver_dust.png",
})

minetest.register_craftitem("ocular_networks:luminium_bar_2", {
	description = "Luminium Ingot stacked on gold\n"..minetest.colorize("#00affa", "Smelt to make lumigold"),
	inventory_image = "poly_luminium_ig.png",
})

minetest.register_craftitem("ocular_networks:luminium_bar_3", {
	description = "Lumigold Ingot\n"..minetest.colorize("#00affa", "A rather unimpressive ingot,\nbut used in many recipies"),
	inventory_image = "poly_lumigold_i.png",
})

minetest.register_craftitem("ocular_networks:angmallen_bar", {
	description = "Angmallen Ingot\n"..minetest.colorize("#00affa", "Usually this wouldn't work, but apparently the alloyer has wierd qualities."),
	inventory_image = "poly_angmallen.png",
})

minetest.register_craftitem("ocular_networks:toxic_slate_chip", {
	description = "Toxic Slate Chips\n"..minetest.colorize("#00affa", "Poisonous stone that becomes safe near\nclose-to-pure carbon compounds"),
	inventory_image = "poly_slate.png",
})

minetest.register_craftitem("ocular_networks:lumigold_rod", {
	description = "Lumigold Rod\n"..minetest.colorize("#00affa", "A hardy rod of luminium-gold alloy"),
	inventory_image = "poly_lumigold_rod.png",
})

minetest.register_craftitem("ocular_networks:save_disk", {
	description = "Metadata Save Disk\n"..minetest.colorize("#00affa", "Sneak and rightclick on a node to \nsave it's metadata.\nright click on a node to load meta to it from the disk.\nhold 'use', sneak and rightclick to view saved meta.\nEXPERIMENTAL"),
	inventory_image = "poly_disk.png",
	not_in_creative_inventory=1,
	stack_max=1,
	on_place = function(itemstack, placer, pointed_thing)
		if placer:get_player_control().aux1 == true and placer:get_player_control().sneak == true then
			if ocular_networks.player_temp_disk[placer:get_player_name()] and ocular_networks.player_temp_disk[placer:get_player_name()].fields then
				local pseudodata=ocular_networks.player_temp_disk[placer:get_player_name()].fields
				if pseudodata.formspec then
					pseudodata.formspec="omitted"
				end
				minetest.show_formspec(placer:get_player_name(), "", "size[7,8;]textarea[0,0.5;7.5,9;arb;experimental metadata transfer disk 3.1;"..dump(pseudodata).."]")
			end
		else
			if pointed_thing.type=="node" then
				local meta = minetest.get_meta(minetest.get_pointed_thing_position(pointed_thing, above))
				if placer:get_player_control().sneak == true then
					ocular_networks.player_temp_disk[placer:get_player_name()] = meta:to_table()
					minetest.chat_send_player(placer:get_player_name(),  minetest.colorize("#00affa","NodeMetaRef saved to disk"))
				else
					meta:from_table(ocular_networks.player_temp_disk[placer:get_player_name()])
					minetest.chat_send_player(placer:get_player_name(),  minetest.colorize("#00affa","NodeMetaRef loaded from disk"))
				end
			end
		end
	end
})

minetest.register_craftitem("ocular_networks:crud", {
	description = "Crud\n"..minetest.colorize("#00affa", "'Trash, rubbish, waste.'"),
	inventory_image = "poly_crud.png",
})

minetest.register_craftitem("ocular_networks:fuel", {
	description = "Fuel Nugget\n"..minetest.colorize("#00affa", "Who would have thought\nyou could make fuel out of THAT."),
	inventory_image = "poly_fuel.png",
})

minetest.register_craftitem("ocular_networks:peat", {
	description = "Peat Block\n"..minetest.colorize("#00affa", "The only fuel accepted by the chemical oven."),
	inventory_image = minetest.inventorycube("poly_peat.png"),
})

minetest.register_craftitem("ocular_networks:gun_stock", {
	description = "Wooden Stock\n"..minetest.colorize("#00affa", "A stock for a rifle."),
	inventory_image = "poly_stock.png",
})

minetest.register_craftitem("ocular_networks:healer", {
	description = "Suspicious Healing Gimble\n"..minetest.colorize("#00affa", "click to heal yourself, uses personal power network.\nIt looks suspicious, like it has more to it."),
	inventory_image = "poly_gimble.png",
	stack_max=1,
	on_use = function(itemstack, user, pointed_thing)
		if user:get_attribute("personal_ocular_power") and tonumber(user:get_attribute("personal_ocular_power")) > 99 then
			user:set_attribute("personal_ocular_power", tonumber(user:get_attribute("personal_ocular_power"))-100)
			user:set_hp(20)
		end
	end
})

minetest.register_craftitem("ocular_networks:placeholder_power", {
	description = "OcularNetworks Power\n"..minetest.colorize("#00affa", "Recipe requires this much OCP"),
	inventory_image = "poly_gui_icon_pwr.png",
	groups = {not_in_creative_inventory=1}
})

minetest.register_tool("ocular_networks:angmallen_hammer", {
	description = minetest.colorize("#00affa", "Angmallen Destroyer"),
	inventory_image = "poly_angmallen_hammer.png",
	wield_scale = {x=3.0, y=3.0, z=1.0},
	tool_capabilities = {
		full_punch_interval = 0.01,
		max_drop_level=10,
		groupcaps={
			cracky = {times={[1]=0.50, [2]=0.50, [3]=0.20}, uses=250, maxlevel=10},
		},
		damage_groups = {fleshy=19},
	},
	sound = {breaks = "default_tool_breaks"},
})


minetest.register_tool("ocular_networks:angmallen_axe", {
	description = minetest.colorize("#00affa", "Angmallen Deforester"),
	inventory_image = "poly_angmallen_axe.png",
	wield_scale = {x=3.0, y=3.0, z=1.0},
	tool_capabilities = {
		full_punch_interval = 0.01,
		max_drop_level=10,
		groupcaps={
			choppy = {times={[1]=0.50, [2]=0.50, [3]=0.20}, uses=250, maxlevel=10},
		},
		damage_groups = {fleshy=20},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("ocular_networks:angmallen_sword", {
	description = minetest.colorize("#00affa", "Angmallen Decapitator\n")..minetest.colorize("#ff0000", "160 Melee Damage"),
	inventory_image = "poly_angmallen_sword.png",
	wield_scale = {x=3.0, y=3.0, z=1.0},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=10,
		groupcaps={
			snappy = {times={[1]=0.50, [2]=0.50, [3]=0.20}, uses=250, maxlevel=10},
		},
		damage_groups = {fleshy=160},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craftitem("ocular_networks:uncharged_gem", {
	description = "Uncharged Gem\n"..minetest.colorize("#00affa", "This gem radiates energy, or it would, if it had any.\nPut it in the charger to charge it."),
	inventory_image = "poly_gem_2.png",
	groups = {ocp_gem=1}
})

minetest.register_craftitem("ocular_networks:charged_gem", {
	description = "Charged Gem\n"..minetest.colorize("#00affa", "This gem radiates energy."),
	inventory_image = "poly_gem.png",
	groups = {ocp_gem=1}
})
