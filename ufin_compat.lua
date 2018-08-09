

unified_inventory.register_craft_type("ocun_melting", {
	description = "Metal Melter",
	icon = "poly_battery_bottom.png^poly_frame.png^poly_furnace.png",
	width = 2,
	height = 1,
})

unified_inventory.register_craft({
	type = "ocun_melting",
	items = {"ocular_networks:placeholder_power 30", "default:stone"},
	output = "default:lava_source",
	width = 2,
})

unified_inventory.register_craft({
	type = "ocun_melting",
	items = {"ocular_networks:placeholder_power 10","default:ice"},
	output = "default:water_source",
	width = 2,
})

unified_inventory.register_craft({
	type = "ocun_melting",
	items = {"ocular_networks:placeholder_power 100","ocular_networks:luminium_block"},
	output = "ocular_networks:luminium_source",
	width = 2,
})

unified_inventory.register_craft({
	type = "ocun_melting",
	items = {"ocular_networks:placeholder_power 100","ocular_networks:lumigold_block"},
	output = "ocular_networks:lumigold_source",
	width = 2,
})

unified_inventory.register_craft({
	type = "ocun_melting",
	items = {"ocular_networks:placeholder_power 500","default:steelblock"},
	output = "ocular_networks:steel_source",
	width = 2,
})

unified_inventory.register_craft({
	type = "ocun_melting",
	items = {"ocular_networks:placeholder_power 70","default:copperblock"},
	output = "ocular_networks:copper_source",
	width = 2,
})

unified_inventory.register_craft({
	type = "ocun_melting",
	items = {"ocular_networks:placeholder_power 80","default:bronzeblock"},
	output = "ocular_networks:bronze_source",
	width = 2,
})

unified_inventory.register_craft({
	type = "ocun_melting",
	items = {"ocular_networks:placeholder_power 90","default:tinblock"},
	output = "ocular_networks:tin_source",
	width = 2,
})

unified_inventory.register_craft({
	type = "ocun_melting",
	items = {"ocular_networks:placeholder_power 50", "default:goldblock"},
	output = "ocular_networks:gold_source",
	width = 2,
})

unified_inventory.register_craft({
	type = "ocun_melting",
	items = {"ocular_networks:placeholder_power 30","default:snowblock"},
	output = "default:river_water_source",
	width = 2,
})

unified_inventory.register_craft({
	type = "ocun_melting",
	items = {"ocular_networks:placeholder_power 1000","ocular_networks:angmallen_block"},
	output = "ocular_networks:angmallen_source",
	width = 2,
})

unified_inventory.register_craft_type("ocun_alloying", {
	description = "Alloy Centrifuge",
	icon = "poly_centrifuge.png^poly_frame.png",
	width = 3,
	height = 1,
})

unified_inventory.register_craft({
	type = "ocun_alloying",
	items = {"ocular_networks:placeholder_power 100", "bucket:bucket_water", "bucket:bucket_lava"},
	output = "default:obsidian 2",
	width = 3,
})

unified_inventory.register_craft({
	type = "ocun_alloying",
	items = {"ocular_networks:placeholder_power 20", "ocular_networks:bucket_copper", "ocular_networks:bucket_tin"},
	output = "ocular_networks:bucket_bronze 2",
	width = 3,
})

unified_inventory.register_craft({
	type = "ocun_alloying",
	items = {"ocular_networks:placeholder_power 20", "ocular_networks:bucket_luminium", "ocular_networks:bucket_gold"},
	output = "ocular_networks:bucket_lumigold 2",
	width = 3,
})

unified_inventory.register_craft_type("ocun_fusing", {
	description = "Fusion Compressor",
	icon = "poly_compressor.png^poly_frame.png",
	width = 3,
	height = 1,
})

unified_inventory.register_craft({
	type = "ocun_fusing",
	items = {"ocular_networks:placeholder_power 100", "flowers:mushroom_red", "flowers:mushroom_brown"},
	output = "ocular_networks:loomshroom",
	width = 3,
})

unified_inventory.register_craft({
	type = "ocun_fusing",
	items = {"ocular_networks:placeholder_power 100", "ocular_networks:loomshroom", "ocular_networks:loomshroom"},
	output = "ocular_networks:luminium_chip",
	width = 3,
})

unified_inventory.register_craft({
	type = "ocun_fusing",
	items = {"ocular_networks:placeholder_power 100", "default:diamond", "default:gold_ingot"},
	output = "default:mese_crystal",
	width = 3,
})

unified_inventory.register_craft({
	type = "ocun_fusing",
	items = {"ocular_networks:placeholder_power 100", "default:dirt", "default:grass_1"},
	output = "default:dirt_with_grass",
	width = 3,
})

unified_inventory.register_craft({
	type = "ocun_fusing",
	items = {"ocular_networks:placeholder_power 100", "default:dirt", "default:dry_grass_1"},
	output = "default:dirt_with_dry_grass",
	width = 3,
})

unified_inventory.register_craft({
	type = "ocun_fusing",
	items = {"ocular_networks:placeholder_power 100", "default:gold_ingot", "default:stone"},
	output = "default:stone_with_gold 2",
	width = 3,
})

unified_inventory.register_craft({
	type = "ocun_fusing",
	items = {"ocular_networks:placeholder_power 100", "default:copper_ingot", "default:stone"},
	output = "default:stone_with_copper 2",
	width = 3,
})

unified_inventory.register_craft({
	type = "ocun_fusing",
	items = {"ocular_networks:placeholder_power 100", "default:steel_ingot", "default:stone"},
	output = "default:stone_with_iron 2",
	width = 3,
})

unified_inventory.register_craft({
	type = "ocun_fusing",
	items = {"ocular_networks:placeholder_power 100", "default:tin_ingot", "default:stone"},
	output = "default:stone_with_tin 2",
	width = 3,
})

unified_inventory.register_craft({
	type = "ocun_alloying",
	items = {"ocular_networks:placeholder_power 5000", "ocular_networks:bucket_steel", "ocular_networks:bucket_gold"},
	output = "ocular_networks:bucket_angmallen",
	width = 3,
})

unified_inventory.register_craft_type("ocun_cooling", {
	description = "Passive Cooler",
	icon = "default_ice.png^poly_frame.png^poly_furnace.png",
	width = 1,
	height = 1,
})

unified_inventory.register_craft({
	type = "ocun_cooling",
	items = {"ocular_networks:bucket_steel"},
	output = "default:steelblock",
	width = 1,
})

unified_inventory.register_craft({
	type = "ocun_cooling",
	items = {"ocular_networks:bucket_gold"},
	output = "default:goldblock",
	width = 1,
})

unified_inventory.register_craft({
	type = "ocun_cooling",
	items = {"ocular_networks:bucket_tin"},
	output = "default:tinblock",
	width = 1,
})

unified_inventory.register_craft({
	type = "ocun_cooling",
	items = {"ocular_networks:bucket_copper"},
	output = "default:copperblock",
	width = 1,
})

unified_inventory.register_craft({
	type = "ocun_cooling",
	items = {"ocular_networks:bucket_bronze"},
	output = "default:bronzeblock",
	width = 1,
})

unified_inventory.register_craft({
	type = "ocun_cooling",
	items = {"ocular_networks:bucket_lumigold"},
	output = "ocular_networks:lumigold_block",
	width = 1,
})

unified_inventory.register_craft({
	type = "ocun_cooling",
	items = {"ocular_networks:bucket_luminium"},
	output = "ocular_networks:luminium_block",
	width = 1,
})

unified_inventory.register_craft({
	type = "ocun_cooling",
	items = {"ocular_networks:bucket_angmallen"},
	output = "ocular_networks:angmallen_block",
	width = 1,
})

unified_inventory.register_craft({
	type = "ocun_fusing",
	items = {"ocular_networks:placeholder_power 10000", "default:diamondblock 99 ", "default:mese 99"},
	output = "ocular_networks:uncharged_gem",
	width = 3,
})

unified_inventory.register_craft_type("ocun_charging", {
	description = "Charging Station",
	icon = "default_copper_block.png^poly_frame.png^poly_gui_icon_pwr.png",
	width = 2,
	height = 1,
})

unified_inventory.register_craft({
	type = "ocun_charging",
	items = {"ocular_networks:placeholder_power 300","ocular_networks:uncharged_gem"},
	output = "ocular_networks:charged_gem",
	width = 2,
})