local modpath = minetest.get_modpath("ocular_networks")
ocular_networks = {}

minetest.register_privilege("ocular_networks_dbg", {description="Allows players to access OcuN debug commands, VERY dangerous priv to grant.", give_to_singleplayer=false})
dofile(modpath.."/.config.lua")
dofile(modpath.."/functions.lua")
dofile(modpath.."/nodes.lua")
dofile(modpath.."/liquids.lua")
dofile(modpath.."/items.lua")
if ocular_networks.config.onRun.load_rifle_weapons then
	dofile(modpath.."/rifle.lua")
end
if ocular_networks.config.onRun.load_flight_ring then
	dofile(modpath.."/jetring.lua")
end
dofile(modpath.."/armor.lua")
if ocular_networks.config.onRun.load_armor_upgrades then
	dofile(modpath.."/upgrade.lua")
end
dofile(modpath.."/craft.lua")
if minetest.get_modpath("wield3d") then
	dofile(modpath.."/w3d_compat.lua")
end
dofile(modpath.."/update.lua")