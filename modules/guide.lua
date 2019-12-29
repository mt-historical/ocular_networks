
guideBooks.Common.register_guideBook("ocular_networks:guide", {
	inventory_image="poly_guide.png",
	description_short="Compendium Of Eyes",
	description_long="A volume on light",
	style={
		cover={
			bg="poly_abc_guide_cover.png",
			next="poly_abc_guide_arrownext.png"
		},
		page={
			bg="poly_abc_guide_cover.png",
			next="poly_abc_guide_arrownext.png",
			prev="poly_abc_guide_arrowprev.png",
			begn="poly_abc_guide_arrowup.png"
		},
		buttonGeneric="poly_abc_guide_btn.png"
	}
})

guideBooks.Common.register_section("ocular_networks:guide","tutorial", {
	description="Getting Started"
})
guideBooks.Common.register_page("ocular_networks:guide", "tutorial", 1, {
	text1=[[
		
	]], 
	text2=[[]],
	extra=[[]]
})