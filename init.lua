

local modpath = minetest.get_modpath("ocular_networks")
ocular_networks = {}

minetest.register_privilege("ocular_networks_dbg", {description="Allows players to access OcuN debug commands, VERY dangerous priv to grant.", give_to_singleplayer=false})
dofile(modpath.."/functions.lua")
dofile(modpath.."/nodes.lua")
dofile(modpath.."/liquids.lua")
dofile(modpath.."/items.lua")
dofile(modpath.."/rifle.lua")
dofile(modpath.."/jetring.lua")
dofile(modpath.."/armor.lua")
dofile(modpath.."/craft.lua")
if minetest.get_modpath("unified_inventory") then
	dofile(modpath.."/ufin_compat.lua")
end
if minetest.get_modpath("wield3d") then
	dofile(modpath.."/w3d_compat.lua")
end
dofile(modpath.."/update.lua")