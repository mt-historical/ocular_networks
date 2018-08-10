minetest.register_craftitem("ocular_networks:upgrade", {
	description = "Armor Upgrade Base\n"..minetest.colorize("#00affa", "Used to make upgrade tokens for the angmallen armor."),
	inventory_image = "poly_upgrade.png",
})

minetest.register_craftitem("ocular_networks:upgrade_speed", {
	description = "Speed Upgrade L1 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen armor.\n")..minetest.colorize("#ff0000", "2x speed multiplier"),
	inventory_image = "poly_upgrade_speed.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_speed2", {
	description = "Speed Upgrade L2 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen armor.\n")..minetest.colorize("#ff0000", "2.5x speed multiplier"),
	inventory_image = "poly_upgrade_speed.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_speed3", {
	description = "Speed Upgrade L3 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen armor.\n")..minetest.colorize("#ff0000", "3x speed multiplier"),
	inventory_image = "poly_upgrade_speed.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_jump", {
	description = "Jump Upgrade L1 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen armor.\n")..minetest.colorize("#ff0000", "2x jump multiplier"),
	inventory_image = "poly_upgrade_jump.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_jump2", {
	description = "Jump Upgrade L2 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen armor.\n")..minetest.colorize("#ff0000", "3x jump multiplier"),
	inventory_image = "poly_upgrade_jump.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_jump3", {
	description = "Jump Upgrade L3 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen armor.\n")..minetest.colorize("#ff0000", "4x jump multiplier"),
	inventory_image = "poly_upgrade_jump.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_float", {
	description = "Hover Upgrade L1 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen armor.\n")..minetest.colorize("#ff0000", "0.5x gravity modifier"),
	inventory_image = "poly_upgrade_float.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_float2", {
	description = "Hover Upgrade L2 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen armor.\n")..minetest.colorize("#ff0000", "0.3x gravity modifier"),
	inventory_image = "poly_upgrade_float.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_float3", {
	description = "Hover Upgrade L3 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen armor.\n")..minetest.colorize("#ff0000", "0.2x gravity modifier"),
	inventory_image = "poly_upgrade_float.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_defense", {
	description = "Shield Upgrade L1 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen shield.\n")..minetest.colorize("#ff0000", "+5 defense"),
	inventory_image = "poly_upgrade_defense.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_defense2", {
	description = "Shield Upgrade L2 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen shield.\n")..minetest.colorize("#ff0000", "+10 defense"),
	inventory_image = "poly_upgrade_defense.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_defense3", {
	description = "Shield Upgrade L3 \n"..minetest.colorize("#00affa", "Upgrade token for the angmallen shield.\n")..minetest.colorize("#ff0000", "+20 defense"),
	inventory_image = "poly_upgrade_defense.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_heal", {
	description = "Healing Module\n"..minetest.colorize("#00affa", "Upgrade token for the angmallen armor.\n")..minetest.colorize("#ff0000", "+1 HP/50 OCP"),
	inventory_image = "poly_upgrade_heal.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})

minetest.register_craftitem("ocular_networks:upgrade_heal2", {
	description = "Healing Module L2\n"..minetest.colorize("#00affa", "Upgrade token for the angmallen armor.\n")..minetest.colorize("#ff0000", "+2 HP/50 OCP"),
	inventory_image = "poly_upgrade_heal.png",
	groups = {ocp_upgrade=1},
	stack_max=1
})
