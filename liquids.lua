
minetest.register_node("ocular_networks:luminium_source", {
	description = "Luminium Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "poly_lumi_liq_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ocular_networks:luminium_flowing",
	liquid_alternative_source = "ocular_networks:luminium_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 0, g = 64, b = 200},
	groups = {liquid = 2, igniter = 1},
})

minetest.register_node("ocular_networks:luminium_flowing", {
	description = "Flowing Luminium",
	drawtype = "flowingliquid",
	tiles = {"poly_lumi_liq.png"},
	special_tiles = {
		{
			name = "poly_lumi_liq_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "poly_lumi_liq_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ocular_networks:luminium_flowing",
	liquid_alternative_source = "ocular_networks:luminium_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 0, g = 64, b = 200},
	groups = {liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

bucket.register_liquid(
	"ocular_networks:luminium_source",
	"ocular_networks:luminium_flowing",
	"ocular_networks:bucket_luminium",
	"bucket.png^poly_luminium_liq.png",
	"Bucket of Molten Luminium"
)

minetest.register_node("ocular_networks:lumigold_source", {
	description = "Lumigold Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "poly_lumig_liq_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ocular_networks:lumigold_flowing",
	liquid_alternative_source = "ocular_networks:lumigold_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 50, g = 64, b = 0},
	groups = {liquid = 2, igniter = 1},
})

minetest.register_node("ocular_networks:lumigold_flowing", {
	description = "Flowing Lumigold",
	drawtype = "flowingliquid",
	tiles = {"poly_lumig_liq.png"},
	special_tiles = {
		{
			name = "poly_lumig_liq_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "poly_lumig_liq_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ocular_networks:lumigold_flowing",
	liquid_alternative_source = "ocular_networks:lumigold_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 50, g = 64, b = 0},
	groups = {liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

bucket.register_liquid(
	"ocular_networks:lumigold_source",
	"ocular_networks:lumigold_flowing",
	"ocular_networks:bucket_lumigold",
	"bucket.png^poly_lumigold_liq.png",
	"Bucket of Molten Lumigold"
)

minetest.register_node("ocular_networks:gold_source", {
	description = "Gold Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "poly_gold_liq_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ocular_networks:gold_flowing",
	liquid_alternative_source = "ocular_networks:gold_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 40, g = 64, b = 0},
	groups = {liquid = 2, igniter = 1},
})

minetest.register_node("ocular_networks:gold_flowing", {
	description = "Flowing Gold",
	drawtype = "flowingliquid",
	tiles = {"poly_gold_liq.png"},
	special_tiles = {
		{
			name = "poly_gold_liq_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "poly_gold_liq_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ocular_networks:gold_flowing",
	liquid_alternative_source = "ocular_networks:gold_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 40, g = 64, b = 0},
	groups = {liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

bucket.register_liquid(
	"ocular_networks:gold_source",
	"ocular_networks:gold_flowing",
	"ocular_networks:bucket_gold",
	"bucket.png^poly_gold_bliq.png",
	"Bucket of Molten Gold"
)

minetest.register_node("ocular_networks:steel_source", {
	description = "Steel Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "poly_steel_liq_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ocular_networks:steel_flowing",
	liquid_alternative_source = "ocular_networks:steel_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 200, g = 200, b = 200},
	groups = {liquid = 2, igniter = 1},
})

minetest.register_node("ocular_networks:steel_flowing", {
	description = "Flowing Steel",
	drawtype = "flowingliquid",
	tiles = {"poly_steel_liq.png"},
	special_tiles = {
		{
			name = "poly_steel_liq_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "poly_steel_liq_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ocular_networks:steel_flowing",
	liquid_alternative_source = "ocular_networks:steel_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 200, g = 200, b = 200},
	groups = {liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

bucket.register_liquid(
	"ocular_networks:steel_source",
	"ocular_networks:steel_flowing",
	"ocular_networks:bucket_steel",
	"bucket.png^poly_steel_bliq.png",
	"Bucket of Molten Steel"
)

minetest.register_node("ocular_networks:copper_source", {
	description = "Copper Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "poly_copper_liq_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ocular_networks:copper_flowing",
	liquid_alternative_source = "ocular_networks:copper_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 250, g = 200, b = 0},
	groups = {liquid = 2, igniter = 1},
})

minetest.register_node("ocular_networks:copper_flowing", {
	description = "Flowing Copper",
	drawtype = "flowingliquid",
	tiles = {"poly_copper_liq.png"},
	special_tiles = {
		{
			name = "poly_copper_liq_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "poly_copper_liq_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ocular_networks:copper_flowing",
	liquid_alternative_source = "ocular_networks:copper_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 250, g = 200, b = 0},
	groups = {liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

bucket.register_liquid(
	"ocular_networks:copper_source",
	"ocular_networks:copper_flowing",
	"ocular_networks:bucket_copper",
	"bucket.png^poly_copper_bliq.png",
	"Bucket of Molten Copper"
)

minetest.register_node("ocular_networks:bronze_source", {
	description = "Bronze Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "poly_bronze_liq_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ocular_networks:bronze_flowing",
	liquid_alternative_source = "ocular_networks:bronze_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 150, g = 100, b = 0},
	groups = {liquid = 2, igniter = 1},
})

minetest.register_node("ocular_networks:bronze_flowing", {
	description = "Flowing Bronze",
	drawtype = "flowingliquid",
	tiles = {"poly_bronze_liq.png"},
	special_tiles = {
		{
			name = "poly_bronze_liq_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "poly_bronze_liq_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ocular_networks:bronze_flowing",
	liquid_alternative_source = "ocular_networks:bronze_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 150, g = 100, b = 0},
	groups = {liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

bucket.register_liquid(
	"ocular_networks:bronze_source",
	"ocular_networks:bronze_flowing",
	"ocular_networks:bucket_bronze",
	"bucket.png^poly_bronze_bliq.png",
	"Bucket of Molten Bronze"
)

minetest.register_node("ocular_networks:tin_source", {
	description = "Tin Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "poly_tin_liq_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ocular_networks:tin_flowing",
	liquid_alternative_source = "ocular_networks:tin_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 100, g = 100, b = 200},
	groups = {liquid = 2, igniter = 1},
})

minetest.register_node("ocular_networks:tin_flowing", {
	description = "Flowing Tin",
	drawtype = "flowingliquid",
	tiles = {"poly_tin_liq.png"},
	special_tiles = {
		{
			name = "poly_tin_liq_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "poly_tin_liq_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ocular_networks:tin_flowing",
	liquid_alternative_source = "ocular_networks:tin_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 100, g = 100, b = 200},
	groups = {liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

bucket.register_liquid(
	"ocular_networks:tin_source",
	"ocular_networks:tin_flowing",
	"ocular_networks:bucket_tin",
	"bucket.png^poly_tin_bliq.png",
	"Bucket of Molten Tin"
)

minetest.register_node("ocular_networks:angmallen_source", {
	description = "Angmallen Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "poly_angmallen_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "ocular_networks:angmallen_flowing",
	liquid_alternative_source = "ocular_networks:angmallen_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 100, g = 100, b = 200},
	groups = {liquid = 2, igniter = 1},
})

minetest.register_node("ocular_networks:angmallen_flowing", {
	description = "Flowing Angmallen",
	drawtype = "flowingliquid",
	tiles = {"poly_angmallen_liq.png"},
	special_tiles = {
		{
			name = "poly_angmallen_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "poly_angmallen_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ocular_networks:angmallen_flowing",
	liquid_alternative_source = "ocular_networks:angmallen_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 8,
	post_effect_color = {a = 100, r = 100, g = 100, b = 200},
	groups = {liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})

bucket.register_liquid(
	"ocular_networks:angmallen_source",
	"ocular_networks:angmallen_flowing",
	"ocular_networks:bucket_angmallen",
	"bucket.png^poly_angmallen_bliq.png",
	"Bucket of Molten Angmallen"
)