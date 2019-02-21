
ocular_networks.pages={}
ocular_networks.pagetext={}

local function B(x)
	return minetest.colorize("#000000", minetest.formspec_escape(x))
end


ocular_networks.pages["header"]=""..
"size[14,10]"..
"background[0,0;0,0;poly_abc_guide_page.png;true]"..
"image_button[13.3,9.5;1,1;poly_abc_guide_arrownext.png;next;]"..
"image_button[0,9.5;1,1;poly_abc_guide_arrowprev.png;prev;]"

ocular_networks.pagetext[1]=""..
"Ocular Networks Guide\n\n"..
"This book will provide help with setting up and using Ocular Networks machine systems.\n"..
"It will NOT, however, show you the recipes for Ocular Networks items.\n(you should use unified_inventory for this)\n"..
"\n"..
"CONTENTS\n\n"..
"Getting Started     -     Page 2\n"..
"Ores                -     Page 3\n"..
"Battery             -     Page 4\n"..
"Power Collector     -     page 5\n"..
"Network Nodes       -     page 6\n"..
"Metal Melter        -     page 7\n"..
"Alloy Centrifuge    -     page 8\n"


ocular_networks.pages[1]=""..
"size[14,10]"..
"background[0,0;0,0;poly_abc_guide_page.png;true]"..
"image_button[13.3,9.5;1,1;poly_abc_guide_arrownext.png;next;]"..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[1])..";]"

ocular_networks.pagetext[2]=""..
"Getting Started: Bare Bones\n\n"..
"Ocular Networks works on a system of power stored in blocks.\n"..
"This power is not stored in an 'available/required' network,\n"..
"but is stored as an actual amount and moves dynamically.\n"..
"We shall call this power 'OCP'."..
"Power can only be generated from the sun, and is used for a\n"..
"variety of applications.\n"..
"To begin you'll need access to lots of gold, steel and copper.\n"..
"You will also need a way to get to -1000 y or below."

ocular_networks.pages[2]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[2])..";]"

ocular_networks.pagetext[3]=""..
"Getting Started: Ore\n\n"..
"Ocular Networks includes two ores: Luminium and toxic Slate.\n\n"..
"Luminium spawns at depths below -1000 y and has a faint glow.\n\n"..
"Toxic Slate spawns at -99 to -101 and only spawns in desert stone.\n\n"..
"You will need both of these things in considerable quantity to progress.\n"

ocular_networks.pages[3]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[3])..";]"



ocular_networks.pagetext[4]=""..
"Getting Started: The Battery\n\n"..
"The Solar Cell Battery is the first device you should make.\n"..
"All the recipes for these items are in the unified_inventory window,\n"..
"but there is one item that should be explained here.\n"..
"The Lumigold ingot, an intrinsic part to the functioning of your network,\n"..
"is created by smelting an ingot stack. this ingot stack is made by crafting\n"..
"a Luminium Ingot with a normal Gold Ingot.\n\n"..
"Once you have made the battery, you will need to craft a Gold Frame.\n"..
"Place the battery in an area which has NO ARTIFICAL LIGHT, only sunlight,\n"..
"and place the gold frame on top of the battery.\n"..
"Once you have placed the frame atop the battery, you should craft silver sand with\n"..
"a stick. Craft the resulting silver dust with Glass Fragments, and you will get a lens.\n"..
"Rightclick on the golden frame while holding the Silver Lens to fit it to the frame,\n"..
"And the battery under the frame should begin to produce power.\n(Check this by looking at the battery.)"

ocular_networks.pages[4]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[4])..";]"

ocular_networks.pagetext[5]=""..
"Basics: Power Collectors\n\n"..
"Power Collectors are the only way to transfer power from Solar Cell Batteries.\n"..
"As always, you can find the recipes by using unified_inventory.\n"..
"There are three types of Power Collector: Basic, MK2, and MK3. The Power Collector has\n"..
"An internal GUI that allows you to set a source position. This is not an absolute position,\n"..
"but rather a relative position. This means that setting 1,0,0 on a Power Collector at 3,7,2\n"..
"will attempt to draw power from 4,7,2.\n"..
"Power Collectors can draw power from any node with Ocular Networks power, including other Collectors."

ocular_networks.pages[5]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[5])..";]"

ocular_networks.pagetext[6]=""..
"Basics: Network Nodes\n\n"..
"Network nodes are a complicated concept, but very simple to use.\n\n"..
"There are two types of network nodes:\n"..
"Uplink nodes, which take power from the block below it and adds the power to your network,\n"..
"and downlink nodes, which take power from your network and add it to the block below.\n"..
"You must set the amount of power per second for the downlink node, but the uplink node will just take all."

ocular_networks.pages[6]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[6])..";]"

ocular_networks.pagetext[7]=""..
"Machines: Metal Melter\n\n"..
"The metal melter will turn blocks of metal into a liquid form, which can then be mixed to form alloys,\n"..
"or cooled back into blocks of metal using the passive cooler.\n"..
"it takes power from above, so the use of a power reservoir is recommended."..
"There must be an empty, accessible block below the melter, as this is where the liquid metal will form"

ocular_networks.pages[7]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[7])..";]"

ocular_networks.pagetext[8]=""..
"Machines: Alloy Centrifuge\n\n"..
"Alloys metals by spinning them really fast.\n"..
"The alloy centrifuge takes power from the block above."

ocular_networks.pages[8]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[8])..";]"



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