
guideBooks.Common.register_guideBook("ocular_networks:guide", {
	inventory_image="poly_guide.png",
	description_short=minetest.colorize("#00affa", "Compendium Of Eyes"),
	description_long=minetest.colorize("#888888", "A volume on light"),
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
	]], 
	text2=[[]],
	extra=[[]]
})
