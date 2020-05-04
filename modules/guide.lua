
guideBooks.Common.register_guideBook("ocular_networks:guide", {
	inventory_image="poly_guide.png",
	description_short=minetest.colorize("#00affa", "Compendium Of Eyes"),
	description_long=minetest.colorize("#888888", "The Ocular Networks guidebook"),
	style={
		cover={
			bg="poly_abc_guide_cover.png",
			next="poly_abc_guide_arrownext.png",
			w=7
		},
		page={
			bg="poly_abc_guide_page.png",
			next="poly_abc_guide_arrownext.png",
			prev="poly_abc_guide_arrowprev.png",
			start="poly_abc_guide_arrowup.png",
			w=14
		},
		buttonGeneric="poly_abc_guide_btn.png"
	}
})

guideBooks.Common.register_section("ocular_networks:guide","tutorial", {
	description="Getting Started"
})
guideBooks.Common.register_page("ocular_networks:guide", "tutorial", 1, {
	text1=minetest.colorize("#000000", [[
	To make proper use of Ocular Networks, there are a few
	things you must first know. The main concept of Ocular
	Networks is, of course, networks. Each player has three
	networks which only they can access, unless they give access to someone else.
	These networks are:
	The power network, which transmits ocular power through invisible light beams,
	The item network, which moves items through physical pipes or teleportation, 
	and the data network, which sends and recieves wireless signals to allow complex 
	computations and decision making.
	
	When working in unison these networks can create 
	powerful machines, factories and even computers. 
	This first chapter will cover how to begin working
	with each of these concepts and pave the way for you
	to start making more complex systems.
	
	There are, however, many things you must find out for yourself.
	]]), 
	text2=minetest.colorize("#000000", [[
	You should start by amassing a sizeable amount of gold, copper, 
	steel, and luminium. Luminium can be found below y level -1000 and glows slightly.
	Make some lumigold (you need about as much lumigold as luminium) by crafting 
	a gold ingot with a luminium ingot and smelting the resulting item.
	Next find some slate by digging below the desert stone in a desert biome.
	Once you have these you can make a solar battery and some golden frames.
	You'll also need to make a silver lens using silver sand. 
	Place the battery somewhere with no artificial light 
	(torches, lamps, fire, lava) and place a golden frame on top of it. 
	Right-click the golden frame with the silver lens, 
	and the battery will start making power.
	
	In order to move the power around and use it in machines
	you'll need to make some power collectors, power reservoirs, 
	and network nodes.
	]]),
	extra=[[]]
})

guideBooks.Common.register_section("ocular_networks:guide","materials", {
	description="Materials",
	master=1
})
guideBooks.Common.register_section("ocular_networks:guide","luminium", {
	description="Luminium",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "luminium", 1, {
	text1=minetest.colorize("#000000", [[
	Luminium is a glowing, light blue metal. It has the useful ability to turn
	eletrical current into invisible light beams and vice versa. Its main
	use is wireless power transfer, but it can do many other things.
	]]), 
	text2=minetest.colorize("#000000", [[
		Found: In stone, below y -1000
		Color: blue, low saturation / violet, energized
		Notes: ore glows faintly
	]]),
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","lumigold", {
	description="Lumigold",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "lumigold", 1, {
	text1=minetest.colorize("#000000", [[
	Lumigold is a very conductive alloy of luminium and gold. It rivals 
	steel in strength and hardness, but is about 15% heavier.
	]]), 
	text2=minetest.colorize("#000000", [[
		Found: Must be crafted
		Color: gold, low purity / pastel yellow, very pure
		Notes: antimicrobial
	]]),
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","silic", {
	description="Silicotin",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "silic", 1, {
	text1=minetest.colorize("#000000", [[
	Silicotin is a curious version of the alloy SiSn, with some extra stuff thrown in.
	It's about 20% tin, 76% silicon, and 4% mixed metals.
	]]), 
	text2=minetest.colorize("#000000", [[
		Found: Must be crafted
		Color: dull blue, silver when draw-forged
		Notes: acts almost like rubber under most conditions, will not dent
	]]),
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","angmallen", {
	description="Angmallen",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "angmallen", 1, {
	text1=minetest.colorize("#000000", [[
	Angmallen is an alloy of iron and gold, held together by powerful magnetic forces.
	When exposed to enough electrical current the bonds become so strong that most
	conventional tools won't affect it.
	]]), 
	text2=minetest.colorize("#000000", [[
		Found: Must be crafted
		Color: orange-yellow / blue-purple when energized
		Notes: is somehow lighter than the sum of its parts, don't ask too many
		questions.
	]]),
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","zweinium", {
	description="Zweinium",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "zweinium", 1, {
	text1=minetest.colorize("#000000", [[
	Zweinium is a green crystallized version of toxic slate, with almost no flaws in the
	average crystal. Perfect for focusing light.
	]]), 
	text2=minetest.colorize("#000000", [[
		Found: In toxic slate deposits
		Color: soft green
		Notes: it's clarity makes it perfect for carrying information
	]]),
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","shimmering", {
	description="Shimmering Alloy",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "shimmering", 1, {
	text1=minetest.colorize("#000000", [[
	An alloy of iron and whatever makes silver sand shiny. 
	Good at preventing interference  in sensitive systems.
	]]), 
	text2=minetest.colorize("#000000", [[
		Found: must be crafted
		Color: white
	]]),
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","heka", {
	description="Hekatonium",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "heka", 1, {
	text1=minetest.colorize("#000000", [[
	An insanely hard, strong metal. Its structure allows it to dissipate
	incurred energy damage to nearby ferrous objects.
	]]), 
	text2=minetest.colorize("#000000", [[
		Found: deep in the earth
		Color: dark violet / neon purple when energized
		Notes: in plasma form it is attracted very strongly to its solid 
		counterpart
	]]),
	extra=[[]]
})

guideBooks.Common.register_section("ocular_networks:guide","reactor", {
	description="The Hekaton Reactor"
})
guideBooks.Common.register_page("ocular_networks:guide", "reactor", 1, {
	text1=minetest.colorize("#000000", [[
	The hekaton reactor will generate huge amounts of power, but it needs a constant
	supply of fuel and coolant, as well as a multiblock structure.
	
	Firstly, place the ton core where you want it.
	secondly, place firebricks on all faces but the top, you should need 5.
	Next, place a pipe storage crate on top - this will be your interface point.
	
	To operate the reactor, place superfuel and nitrogen coolant in the crate. 
	You need 1 coolant for every 50 superfuel, otherwise the core will
	overheat and explode.
	]]), 
	text2=minetest.colorize("#000000", [[
	
	]]),
	extra=[[]]
})

guideBooks.Common.register_section("ocular_networks:guide","data", {
	description="The Data Network"
})
guideBooks.Common.register_page("ocular_networks:guide", "data", 1, {
	text1=minetest.colorize("#000000", [[
	The Data Network is a very vesatile utility for automating machines.
	The main tools are: 
	- network uplinks and downlinks, used to read fields from nodes or
	activate/deactivate systems
	- network processors and terminals, used to repeatedly run a 
	series of commands or enter commands directly
	
	All of these tools act on Channels, which are public and 
	unprotected global settings that can have a string, number,
	or table value.	There are no private channels.
	
	List of Commands:
		if : Conditionally execute a command. | Syntax: if <arg>==<arg> \[command\] <args> | (Both args may be channel names, in which case the value of channel <arg> will be used)
		help : Provide help for a specified command | Syntax: help <cmd>
		let : Set a channel value. | Syntax: let <channel>=<val> (val can be a channel name)
		get : Print the content of a channel. | Syntax: get <channel>
	]]), 
	text2=minetest.colorize("#000000", [[
		list : Turn a list of args into a table and write it to a channel. | Syntax: list <channel>=<arg1>,<arg2>,<arg3>
			dList : Print the content of a channel as an array. | Syntax: dList <channel>
		add : Add two args and write the result to a channel. 
			(arg1 and arg2 may be channel names) | Syntax: add <channel>=<arg1>+<arg2>
		sub : Subtract arg 2 from arg 1 and write the result to a channel. 
			(arg1 and arg2 may be channel names) | Syntax: sub <channel>=<arg1>-<arg2>
		mult : Multiply arg 1 by arg 2 and write the result to a channel. 
			(arg1 and arg2 may be channel names) | Syntax: mult <channel>=<arg1>*<arg2>
		div : Divide arg 1 by arg 2 and write the result to a channel. 
			(arg1 and arg2 may be channel names) | Syntax: div <channel>=<arg1>/<arg2>
		append : Concatenate arg1 witth arg2 and write the result to a channel. 
			(arg1 and arg2 may be channel names) | Syntax: append <channel>=<arg1>+<arg2>
		print : Print the value <val> | Syntax: print <val>
	]]),
	extra=[[]]
})

guideBooks.Common.register_page("ocular_networks:guide", "data", 2, {
	text1=minetest.colorize("#000000", [[
	Processors and terminals both support an extra set of commands, used
	to write information to the storage of the node.
	]]), 
	text2=minetest.colorize("#000000", [[
	List of Commands:
		store : Store the value <val> in the local address <addr> (<val> can be a channel name) | Syntax: store <val>=><addr>
		
		read : Print  the value of the local address <addr> | Syntax: read <addr>
		
		send : Send the value of the local address <addr> to the channel <ch> | Syntax: send <addr>=><ch>
	]]),
	extra=[[]]
})

guideBooks.Common.register_page("ocular_networks:guide", "data", 3, {
	text1=minetest.colorize("#000000", [[
	Finally, you can comment a line using '#'.
	A quick example of a valid program (in a terminal or processor)
	
	#my_program 1.1 foobar
	let my_channel=foo
	append channel_2=my_channel+bar
	get channel_2
	
	if neither foo nor bar are already channels, this should ouput:
	foobar
	]]), 
	text2=minetest.colorize("#000000", [[
	]]),
	extra=[[]]
})