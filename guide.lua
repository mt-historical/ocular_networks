
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

ocular_networks.pages["header2"]=""..
"size[14,10]"..
"background[0,0;0,0;poly_abc_guide_page.png;true]"..
"image_button[0,9.5;1,1;poly_abc_guide_arrowprev.png;prev;]"

ocular_networks.pagetext[1]=""..
"Ocular Networks Guide\n\n"..
"This book will provide help with setting up and using Ocular Networks machine systems.\n"..
"It will NOT, however, show you the recipes for Ocular Networks items.\n(you should use unified_inventory for this)\n"..
"\n"..
"CONTENTS\n\n"..
"Getting Started            -        Page 2\n"..
"Ores                       -        Page 3\n"..
"Battery                    -        Page 4\n"..
"Power Collector            -        Page 5\n"..
"Network Nodes              -        Page 6\n"..
"Metal Melter               -        Page 7\n"..
"Alloy Centrifuge           -        Page 8\n"..
"Fusion Compresser          -        Page 9\n"..
"Charging Station           -        Page 10\n"..
"Electrofraction Generator  -        Page 11\n"..
"Power Cell Packager        -        Page 12\n"..
"Steam Battery              -        Page 13\n"..
"Photosynthesis Battery     -        Page 14\n"..
"Laser Drill                -        Page 15\n"..
"Mycorrhizal Infuser        -        Page 16\n"..
"Pipe System                -        Page 17\n"..
"Luminium & Lumigold        -        Page 18\n"..
"Angmallen                  -        Page 19\n"..
"Silicotin                  -        Page 20\n"..
"Shimmering Alloy           -        Page 21\n"..
"Zweinium                   -        Page 22\n"..
"Hekatonium                 -        Page 23\n"..
"Charged Crystals           -        Page 24\n"..
"Armor & Cybernetics        -        Page 25\n"..
"Jammer Drones              -        Page 26\n"..
"Chemical Oven              -        Page 27\n"..
"Wireless Network Control   -        Page 28\n"

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
"And the battery under the frame should begin to produce power.\n"..
"(Check this by looking at the battery.)"

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
"Power Collectors can draw power from any node with Ocular Networks power, including other\n"..
"Collectors."

ocular_networks.pages[5]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[5])..";]"

ocular_networks.pagetext[6]=""..
"Basics: Network Nodes\n\n"..
"Network nodes are a complicated concept, but very simple to use.\n\n"..
"There are two types of network nodes:\n"..
"Uplink nodes, which take power from the block below it and adds the power to your network,\n"..
"and downlink nodes, which take power from your network and add it to the block below.\n"..
"You must set the amount of power per second for the downlink node, but the uplink node will just take\n"..
"all."

ocular_networks.pages[6]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[6])..";]"

ocular_networks.pagetext[7]=""..
"Machines: Metal Melter\n\n"..
"The metal melter will turn blocks of metal into a liquid form, which can then be mixed to form alloys,\n"..
"or cooled back into blocks of metal using the passive cooler.\n"..
"it takes power from above, so the use of a power reservoir is recommended.\n"..
"There must be an empty, accessible block below the melter, as this is where \n"..
"the liquid metal will form"

ocular_networks.pages[7]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[7])..";]"

ocular_networks.pagetext[8]=""..
"Machines: Alloy Centrifuge\n\n"..
"Alloys molten metals by spinning them really fast.\n"..
"The alloy centrifuge takes power from the block above."

ocular_networks.pages[8]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[8])..";]"

ocular_networks.pagetext[9]=""..
"Machines: Fusion Compresser\n\n"..
"Breaks down items to their basic components and fuses them with others to make new ones.\n"..
"The fusion compresser takes power from the block above."

ocular_networks.pages[9]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[9])..";]"

ocular_networks.pagetext[10]=""..
"Machines: Charging Station\n\n"..
"Will irradiate an item with OCP energy.\n"..
"The charging station takes power from the block above."

ocular_networks.pages[10]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[10])..";]"

ocular_networks.pagetext[11]=""..
"Machines: Electrofraction Generator\n\n"..
"The electrofraction generator turns OCP into EU.\n"..
"The electrofraction generator takes power from the block below.\n"..
"(Only available if technic is installed)"

ocular_networks.pages[11]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[11])..";]"

ocular_networks.pagetext[12]=""..
"Machines: Power Cell Packager\n\n"..
"The power cell packager turns OCP into Power Cells.\n"..
"The power cell packager takes power from the block below.\n"..
"(Only available if basic_machines is installed)"

ocular_networks.pages[12]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[12])..";]"

ocular_networks.pagetext[13]=""..
"Machines: Steam Battery\n\n"..
"This machine generates power from steam.\n"..
"It must have a lava block above it, a river water block below,\n"..
"and machine structure blocks on all four sides.\n"..
"Machine structure blocks are made by right-clicking a gold frame with a plated cross.\n"..
"Once these requirements are met, it will create 150 OCP per second."

ocular_networks.pages[13]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[13])..";]"

ocular_networks.pagetext[14]=""..
"Machines: Photosynthesis Battery\n\n"..
"This machine generates power from the growth of plants.\n"..
"It must have a gearbok below it,  and any height of normal grass on top.\n"..
"Once these requirements are met, it will create OCP at a rate \n"..
"dependent on the height of the grass."

ocular_networks.pages[14]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[14])..";]"

ocular_networks.pagetext[15]=""..
"Machines: Laser Drill\n\n"..
"The Laser Drill is a very useful machine for the automation of mining.\n"..
"It requires three parts:\n"..
"The Head, Which collects solids from te drill shaft,\n"..
"The Controller, Which stores power and items,\n"..
"And the lens, which allows the head to function.\n"..
"\n"..
"Place a frame embedded one block in the ground.\n"..
"Place a lens in the frame.\n"..
"Place the laser drill head above it.\n"..
"Place the controller above the head, and power it in some way.\n"..
"The laser drill should now be functional. You can export its items using pipes."

ocular_networks.pages[15]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[15])..";]"

ocular_networks.pagetext[16]=""..
"Machines: Mycorrhizal Infuser\n\n"..
"If a power source is present below and a growable fungus is on top,\n"..
"The Mycorrhizal Infuser will use the power to grow a new fruiting body\n"..
"of the same type as the parent fungus.\n"..
"The resultant materials will be added to the Infuser's inventory."

ocular_networks.pages[16]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[16])..";]"

ocular_networks.pagetext[17]=""..
"Machines: Pipe System\n\n"..
"Pipes can be used to transport and sort materials.\n"..
"Pipes do not need power or fuel.\n"..
"They do not automatically connect and must be rotated to fit their use case.\n"..
"The pipe wrench or pipe wrench cybernetic upgrade are required to rotate a pipe."

ocular_networks.pages[17]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[17])..";]"

ocular_networks.pagetext[18]=""..
"Metals: Luminium & Lumigold\n\n"..
"Luminium is a light blue superconductive metal.\n"..
"Armor: No\n"..
"Sword: Yes\n"..
"Pick: Yes\n"..
"Axe: Yes\n"..
"Shovel: Yes\n"..
"\n"..
"Lumigold is a shiny yellow conductive metal.\n"..
"Armor: No\n"..
"Sword: Yes\n"..
"Pick: Yes\n"..
"Axe: Yes\n"..
"Shovel: Yes\n"

ocular_networks.pages[18]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[18])..";]"

ocular_networks.pagetext[19]=""..
"Metals: Angmallen\n\n"..
"Angmallen is a strong, heavy orange metal.\n"..
"Armor: Yes\n"..
"Sword: Yes\n"..
"Pick: Yes\n"..
"Axe: Yes\n"..
"Shovel: No\n"

ocular_networks.pages[19]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[19])..";]"

ocular_networks.pagetext[20]=""..
"Metals: Silicotin\n\n"..
"Silicotin is a dark grey-blue light metal.\n"..
"Armor: No\n"..
"Sword: Yes\n"..
"Pick: Yes\n"..
"Axe: Yes\n"..
"Shovel: Yes\n"

ocular_networks.pages[20]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[20])..";]"

ocular_networks.pagetext[21]=""..
"Metals: Shimmering Alloy\n\n"..
"Shimmering Alloy is a shiny steel alloy.\n"..
"Armor: No\n"..
"Sword: Yes\n"..
"Pick: Yes\n"..
"Axe: Yes\n"..
"Shovel: Yes\n"

ocular_networks.pages[21]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[21])..";]"

ocular_networks.pagetext[22]=""..
"Zweinium\n\n"..
"Zweinium is a bluish-green crystal found in toxic slate.\n"..
"It can be used to make capacitors, but has better applications than that.\n"..
"Fusing a pure zweinium crystal with a silver lens results in a zweinium lens.\n"..
"This lens will output 5x the power of a normal lens."

ocular_networks.pages[22]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[22])..";]"


ocular_networks.pagetext[23]=""..
"Metals: Hekatonium\n\n"..
"Hekatonium is a dark blue metal with purple oxide.\nWhen smelted, it becomes a dark purple color.\nHekatonium weighs 430 kilograms per cubic centimeter, but can be lifted with ease under special \nconditions.\n"..
"Armor: Yes\n"..
"Sword: Yes\n"..
"Pick: Yes\n"..
"Axe: Yes\n"..
"Shovel: No\n"

ocular_networks.pages[23]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[23])..";]"

ocular_networks.pagetext[24]=""..
"Charged Crystal\n\n"..
"The charged crystal is a way of transferring power using the craft grid.\n"..
"It is created when vast amounts of Diamond, Mese and OCP meet in the fuser.\n"..
"You can recharge it in the charger."

ocular_networks.pages[24]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[24])..";]"

ocular_networks.pagetext[25]=""..
"Armor Upgrades and Cybernetics\n\n"..
"Angmallen and hekatonium armors can be upgraded using the upgrade pendant or performance controller.\n"..
"Different upgrade tokens can be made do give the desired effect, such as speed or healing.\n\n"..
"You can also use the performance controller to install cybernetic upgrades to your body.\n"..
"Robotic arms such as 'Wrench' or 'Gun' can be installed, giving you special powers."

ocular_networks.pages[25]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[25])..";]"

ocular_networks.pagetext[26]=""..
"Jammer Drones\n\n"..
"These menacing little machines fly around and shoot lasers at people.\nThey also tend to steal the luminium cores from network nodes,\nwhich you can get back by killing them."

ocular_networks.pages[26]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[26])..";]"

ocular_networks.pagetext[27]=""..
"Chemical Oven\n\n"..
"The chemical oven breaks items down into their basic elements.\n"..
"It requires power and fuel.\n"..
"It takes power from Above, and uses peat for fuel."

ocular_networks.pages[27]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[27])..";]"

ocular_networks.pagetext[28]=""..
"Wireless logic, Remote control, and Mesecon Support\n\n"..
"Within the Ocular Networks mod, there exist two network systems.\n"..
"One of these networks is the OCP power network, which exists as meta values in blocks.\n"..
"The other is the Probe Message Service, a series of user-defined channels that can contain almost\nanything.\n"..
"To use this network, you must first create a Ocular Logistics Controller,\n"..
"And click while it is in your hand. A window will then open up, with a text field and a button.\n"..
"You can enter commands in the field (try 'help') and press the button to execute them.\n"..
"Next you will need to make a green 'Uplink' network probe.\n"..
"This node can read fields from the node below, such as the content of a list or the name of the node,\n"..
"and send them to a specified channel.\n"..
"You can also create a downlink node capable of reading a channel and sending a mesecon signal\n"..
"or turning off the node below."

ocular_networks.pages[28]=""..
ocular_networks.pages["header"]..
"textarea[1,1;12,8;;"..B(ocular_networks.pagetext[28])..";]"

minetest.register_craftitem("ocular_networks:guide", {
	description = "The Ocular Technician's Guide to Power\n"..minetest.colorize("#333333", "Third Edition"),
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
			if pg < #ocular_networks.pages then
				minetest.show_formspec(player:get_player_name(), "ocn_guide/"..pg+1, ocular_networks.pages[pg+1])
			end
		elseif fields.prev then
			minetest.show_formspec(player:get_player_name(), "ocn_guide/"..pg-1, ocular_networks.pages[pg-1])
		end
	end
end)