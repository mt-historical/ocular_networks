-----LICENSE INFORMATION-----

ocular_networks (c) by PolySaken

ocular_networks is licensed under a
Creative Commons Attribution-ShareAlike 4.0 International License.

You should have received a copy of the license along with this
work. If not, see http://creativecommons.org/licenses/by-sa/4.0/

-----------------------------

Ocular Networks is a minetest mod implementing a power network system, tools, weapons, and a lot more.

Current Features:
-Power Generation from sunlight
-Power routing through 'distributors'
-Machines that use said power to perform tasks such as melting metals, or alloying metals.
-'Network Node' systems to transfer power to a player's personal reserve (stored in player's attributes)
-Special tools that use power directly from the player's reserve to perform tasks, such as a healing tool
-'Luminium' and 'Angmallen', metals that are used to make things within the mod
-powerful angmallen sword, axe, and hammer (functions as a pickaxe)
-Angmallen armor which can be upgraded (see wiki)

Api Available:

ocular_networks.register_meltable({ --register a recipe for the melter
	input="", --item to put in the melter
	output="", --node to place below when done
	cost=0 --cost, an integer to tell the melter how much power the melter needs to function
})

ocular_networks.register_alloyable({ -- register a recipe for the alloyer
	metal_1="", --the first item to be input
	metal_2="", --the second item to be put in the input
	output="", -- the item to output when done
	give_back="", --equivalent of 'return' in a crafting recipe, example give_back="bucket:bucket_empty 2",
	cost=0  --cost, an integer to tell the alloyer how much power the melter needs to function
})

ocular_networks.register_fusion({ --register a recipe for the fusion compresser
	item_1="", --the first item to be input
	item_2="", --the second item to be input
	output="", --the item to output when done
	give_back="", --equivalent of 'return' in a crafting recipe, example give_back="default:stone",
	cost=0  --cost, an integer to tell the fusion compresser how much power the melter needs to function
})

ocular_networks.register_passive_cool({ --register a recipe for the passive cooler
	item="", --the item to be input
	output="", --the item to output when done
})

ocular_networks.register_chargeable({ --register a recipe for the charging station
	item="", --uncharged item
	output="", --result after charging the item
	cost=0 --cost in power
})
