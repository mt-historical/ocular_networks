
armor:register_armor("ocular_networks:angmallen_helm", {
	description = "Angmallen Helm",
	inventory_image = "poly_armor_angmallen_inv_helmet.png",
	texture = "poly_armor_helmet_angmallen",
	preview = "poly_armor_helmet_angmallen_preview.png",
	groups = {armor_head=1, armor_use=100, armor_heal=12},
	armor_groups = {fleshy=20},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=4},
	reciprocate_damage = true
})

armor:register_armor("ocular_networks:angmallen_chest", {
	description = "Angmallen Chestplate",
	inventory_image = "poly_armor_angmallen_inv_chestplate.png",
	texture = "poly_armor_chestplate_angmallen",
	preview = "poly_armor_chestplate_angmallen_preview.png",
	groups = {armor_torso=1, armor_use=100, armor_heal=12},
	armor_groups = {fleshy=30},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=4},
	reciprocate_damage = true
})

armor:register_armor("ocular_networks:angmallen_legs", {
	description = "Angmallen Greaves",
	inventory_image = "poly_armor_angmallen_inv_leggings.png",
	texture = "poly_armor_leggings_angmallen",
	preview = "poly_armor_leggings_angmallen_preview.png",
	groups = {armor_legs=1, armor_use=100, armor_heal=12},
	armor_groups = {fleshy=30},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=4},
	reciprocate_damage = true
})

armor:register_armor("ocular_networks:angmallen_boots", {
	description = "Angmallen Boots",
	inventory_image = "poly_armor_angmallen_inv_boots.png",
	texture = "poly_armor_boots_angmallen",
	preview = "poly_armor_boots_angmallen_preview.png",
	groups = {armor_feet=1, armor_use=100, armor_heal=12},
	armor_groups = {fleshy=20},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=4},
	reciprocate_damage = true,
})



armor:register_armor("ocular_networks:hekatonium_helm", {
	description = minetest.colorize("#00affa", "Hekaton Helm"),
	inventory_image = "poly_armor_hekatonic_inv_helmet.png",
	texture = "poly_armor_helmet_hekatonic",
	preview = "poly_armor_helmet_hekatonic_preview.png",
	groups = {armor_head=1, armor_use=100, armor_heal=12},
	armor_groups = {fleshy=25},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=4},
	reciprocate_damage = true
})

armor:register_armor("ocular_networks:hekatonium_chest", {
	description = minetest.colorize("#00affa", "Hekaton Plate"),
	inventory_image = "poly_armor_hekatonic_inv_chestplate.png",
	texture = "poly_armor_chestplate_hekatonic",
	preview = "poly_armor_chestplate_hekatonic_preview.png",
	groups = {armor_torso=1, armor_use=100, armor_heal=12},
	armor_groups = {fleshy=60},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=4},
	reciprocate_damage = true
})

armor:register_armor("ocular_networks:hekatonium_legs", {
	description = minetest.colorize("#00affa", "Hekaton Greaves"),
	inventory_image = "poly_armor_hekatonic_inv_leggings.png",
	texture = "poly_armor_leggings_hekatonic",
	preview = "poly_armor_leggings_hekatonic_preview.png",
	groups = {armor_legs=1, armor_use=100, armor_heal=12},
	armor_groups = {fleshy=40},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=4},
	reciprocate_damage = true
})

armor:register_armor("ocular_networks:hekatonium_boots", {
	description = minetest.colorize("#00affa", "Hekaton Boots"),
	inventory_image = "poly_armor_hekatonic_inv_boots.png",
	texture = "poly_armor_boots_hekatonic",
	preview = "poly_armor_boots_hekatonic_preview.png",
	groups = {armor_feet=1, armor_use=100, armor_heal=12},
	armor_groups = {fleshy=25},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=4},
	reciprocate_damage = true,
})

