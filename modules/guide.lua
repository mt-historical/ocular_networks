
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
	text1=[[
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
	]], 
	text2=[[
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
	]],
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
	text1=[[
	Luminium is a glowing, light blue metal. It has the useful ability to turn
	eletrical current into invisible light beams and vice versa. Its main
	use is wireless power transfer, but it can do many other things.
	]], 
	text2=[[
		Found: In stone, below y -1000
		Color: blue, low saturation / violet, energized
		Notes: ore glows faintly
	]],
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","lumigold", {
	description="Lumigold",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "lumigold", 1, {
	text1=[[
	Lumigold is a very conductive alloy of luminium and gold. It rivals 
	steel in strength and hardness, but is about 15% heavier.
	]], 
	text2=[[
		Found: Must be crafted
		Color: gold, low purity / pastel yellow, very pure
		Notes: antimicrobial
	]],
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","silic", {
	description="Silicotin",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "silic", 1, {
	text1=[[
	Silicotin is a curious version of the alloy SiSn, with some extra stuff thrown in.
	It's about 20% tin, 76% silicon, and 4% mixed metals.
	]], 
	text2=[[
		Found: Must be crafted
		Color: dull blue, silver when draw-forged
		Notes: acts almost like rubber under most conditions, will not dent
	]],
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","angmallen", {
	description="Angmallen",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "angmallen", 1, {
	text1=[[
	Angmallen is an alloy of iron and gold, held together by powerful magnetic forces.
	When exposed to enough electrical current the bonds become so strong that most
	conventional tools won't affect it.
	]], 
	text2=[[
		Found: Must be crafted
		Color: orange-yellow / blue-purple when energized
		Notes: is somehow lighter than the sum of its parts, don't ask too many
		questions.
	]],
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","zweinium", {
	description="Zweinium",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "zweinium", 1, {
	text1=[[
	Zweinium is a green crystallized version of toxic slate, with almost no flaws in the
	average crystal. Perfect for focusing light.
	]], 
	text2=[[
		Found: In toxic slate deposits
		Color: soft green
		Notes: it's clarity makes it perfect for carrying information
	]],
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","shimmering", {
	description="Shimmering Alloy",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "shimmering", 1, {
	text1=[[
	An alloy of iron and whatever makes silver sand shiny. 
	Good at preventing interference  in sensitive systems.
	]], 
	text2=[[
		Found: must be crafted
		Color: white
	]],
	extra=[[]]
})
guideBooks.Common.register_section("ocular_networks:guide","heka", {
	description="Hekatonium",
	slave="materials",
})
guideBooks.Common.register_page("ocular_networks:guide", "heka", 1, {
	text1=[[
	An insanely hard, strong metal. Its structure allows it to dissipate
	incurred energy damage to nearby ferrous objects.
	]], 
	text2=[[
		Found: deep in the earth
		Color: dark violet / neon purple when energized
		Notes: in plasma form it is attracted very strongly to its solid 
		counterpart
	]],
	extra=[[]]
})

guideBooks.Common.register_section("ocular_networks:guide","reactor", {
	description="The Hekaton Reactor"
})
guideBooks.Common.register_page("ocular_networks:guide", "reactor", 1, {
	text1=[[
	The hekaton reactor will generate huge amounts of power, but it needs a constant
	supply of fuel and coolant, as well as a multiblock structure.
	
	Firstly, place the ton core where you want it.
	secondly, place firebricks on all faces but the top, you should need 5.
	Next, place a pipe storage crate on top - this will be your interface point.
	
	To operate the reactor, place superfuel and nitrogen coolant in the crate. 
	You need 1 coolant for every 50 superfuel, otherwise the core will
	overheat and explode.
	]], 
	text2=[[
	
	]],
	extra=[[]]
})