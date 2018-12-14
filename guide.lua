ocular_networks.pages={}
ocular_networks.pagetext={}

local function B(x)
	return minetest.colorize("#000000", minetest.formspec_escape(x))
end


ocular_networks.pages["header"]=""..
"size[14,10]"..
"background[0,0;0,0;poly_abc_guide_page.png;true]"..
"image_button_exit[13.3,9.5;1,1;poly_abc_guide_arrownext.png;next;]"..
"image_button_exit[13.3,9.5;1,1;poly_abc_guide_arrowprev.png;prev;]"

ocular_networks.pagetext[1]=""..
"Ocular Networks Guide\n\n"..
"This book will provide help with setting up and using Ocular Networks machine systems.\n"..
"It will NOT, however, show you the recipes for Ocular Networks items. (you should use unified_inventory for this)"..
"\n"..
"CONTENTS\n\n"..
"Getting Started     -     Page 2\n"..
"THIS GUIDE IS INCOMPLETE"

ocular_networks.pages[1]=""..
"size[14,10]"..
"background[0,0;0,0;poly_abc_guide_page.png;true]"..
"image_button_exit[13.3,9.5;1,1;poly_abc_guide_arrownext.png;next;]"..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[1])..";]"

ocular_networks.pagetext[2]=""..
"Getting Started: Bare Bones\n\n"..
"Ocular Networks works on a system of power stored in blocks.\n"..
"This power is not stored in an 'available/required' network,\n"..
"but is stored as an actual amount and moves dynamically.\n"..
"Power can only be generated from the sun, and is used for a\n"..
"variety of applications."

ocular_networks.pages[2]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[2])..";]"




minetest.register_craftitem("ocular_networks:guide", {
	description = "The Ocular Technician's Guide to Power\n"..minetest.colorize("#333333", "First Edition"),
	inventory_image = "poly_guide.png",
	stack_max=1,
	on_use = function(itemstack, user, pointed_thing)
		minetest.show_formspec(user:get_player_name(), "ocn_guide/1", ocular_networks.pages[1])
	end
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	local formnames = string.split(formname, "/")
	if formnames[1]=="ocn_guide" then
		local pg = tonumber(formnames[2])
		if fields.next then
			minetest.show_formspec(player:get_player_name(), "ocn_guide/"..pg+1, ocular_networks.pages[pg+1])
		elseif fields.prev then
			minetest.show_formspec(player:get_player_name(), "ocn_guide/"..pg-1, ocular_networks.pages[pg-1])
		end
	end
end)