if minetest.get_modpath("wield3d") then
	if minetest.get_modpath("wieldview") then error("please disable wieldview") end

	local bone = "Arm_Right"
	local pos = {x=0, y=5.5, z=3}
	local scale = {x=0.25, y=0.25}
	local rx = -90
	local rz = 90

	wield3d.location["ocular_networks:angmallen_hammer"] = {bone, {x=0, y=5.5, z=3}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:angmallen_axe"] = {bone, {x=0, y=5.5, z=3}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:angmallen_sword"] = {bone, {x=0, y=5.5, z=8.5}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:blazerifle"] = {bone, pos, {x=rx, y=135, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:blazerifle_c"] = {bone, pos, {x=rx, y=135, z=rz}, {x=0.75, y=0.25}}
	wield3d.location["ocular_networks:blazerifle_d"] = {bone, pos, {x=rx, y=135, z=rz}, {x=0.75, y=0.25}}
	wield3d.location["ocular_networks:healer"] = {bone, pos, {x=rx, y=135, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:inspector"] = {bone, pos, {x=rx, y=135, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:hekaton_hammer"] = {bone, {x=0, y=5.5, z=3}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:hekaton_axe"] = {bone, {x=0, y=5.5, z=3}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
	wield3d.location["ocular_networks:hekaton_sword"] = {bone, {x=0, y=5.5, z=8.5}, {x=rx, y=225, z=rz}, {x=0.25, y=0.25}}
end

