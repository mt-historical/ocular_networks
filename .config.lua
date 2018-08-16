liveConfig = { -- these are the settings that can be changed during the runtime.
	max_personal_network_power = 1000000000000, -- this is the maximum power a player's personal network can contain at any given time. this will prevent the hud from printig errors. default 1000000000000
	laserDrill_blacklist = { --nodes that the laserdrill cannot dig.
		["default:water_source"] = true,
		["default:water_flowing"] = true,
		["default:river_water_source"] = true,
		["default:river_water_flowing"] = true,
		["default:lava_source"] = true,
		["default:lava_flowing"] = true,
		["ocular_networks:luminium_source"] = true,
		["ocular_networks:luminium_flowing"] = true,
		["ocular_networks:lumigold_source"] = true,
		["ocular_networks:lumigold_flowing"] = true,
		["ocular_networks:gold_source"] = true,
		["ocular_networks:gold_flowing"] = true,
		["ocular_networks:steel_source"] = true,
		["ocular_networks:steel_flowing"] = true,
		["ocular_networks:copper_source"] = true,
		["ocular_networks:copper_flowing"] = true,
		["ocular_networks:bronze_source"] = true,
		["ocular_networks:bronze_flowing"] = true,
		["ocular_networks:tin_source"] = true,
		["ocular_networks:tin_flowing"] = true,
		["ocular_networks:angmallen_source"] = true,
		["ocular_networks:angmallen_flowing"] = true
	}, 
	moderator_whitelist = { -- players that can use transport circuits and distributors on nodes regardless of the owner.
	 ["singleplayer"] = true,
	},
}

startUpConfig = { -- you could also change these during runtime but it will have no effect.
	load_armor_upgrades = true, -- setting this to false disables the upgrade pendant and upgrade items for the angmallen armor, default true.
	load_flight_ring = true, -- setting this to false disables the flight ring, default true.
	load_rifle_weapons = true, -- setting this to false disables the blaze rifle weapons, default true.
}

ocular_networks.config = {live = liveConfig, onRun = startUpConfig}