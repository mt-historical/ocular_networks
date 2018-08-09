

table.insert(armor.elements, "ocun_acessory")


armor:register_armor("ocular_networks:jetring", {
	description = "Jet Propelling Ring\n"..minetest.colorize("#00affa", "hold space while wearing (armor) to float up,\nuses 10 power per second"),
	inventory_image = "poly_jet_ring.png",
	texture = "poly_ocn_blank.png",
	preview = "poly_ocn_blank.png",
	groups = {armor_ocun_acessory=1, armor_use=0, flammable=1},
	armor_groups = {fleshy=10, radiation=10},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
})

minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local inv = minetest.get_inventory({type="detached", name=player:get_player_name().."_armor"})
		local playerPower = 0
		if player:get_attribute("personal_ocular_power") then
			playerPower = tonumber(player:get_attribute("personal_ocular_power"))
		end
		if inv:contains_item("armor", "ocular_networks:jetring") then
			if player:get_player_control().jump == true and not player:get_player_control().sneak then
				if playerPower > 0 then
					local playerPhysics = player:get_physics_override()
					playerPhysics.gravity=-0.25
					player:set_physics_override(playerPhysics)
					player:set_attribute("personal_ocular_power", playerPower-1)
					local function b()
						playerPhysics.gravity=-0.01
						player:set_physics_override(playerPhysics)
					end
					minetest.after(0.1, b)
				end
			else
				local playerPhysics = player:get_physics_override()
				playerPhysics.gravity=1.0
				player:set_physics_override(playerPhysics)
			end
		else
			local playerPhysics = player:get_physics_override()
			playerPhysics.gravity=1.0
			player:set_physics_override(playerPhysics)
		end
	end
end)