/////////////////////////////////////////
////////////Medical Tools////////////////
/////////////////////////////////////////

/datum/design/item/scalpel_manager
	name = "Incision Management System"
	desc = "A true extension of the surgeon's body, this marvel instantly and completely prepares an incision allowing for the immediate commencement of therapeutic steps."
	id = "scalpel_manager"
	req_tech = list("biotech" = 7, "materials" = 7, "magnets" = 6, "programming" = 7)
	build_type = PROTOLATHE
	materials = list(MAT_METAL = 6000, MAT_GLASS = 4000, MAT_BLUESPACE = 2000, MAT_GOLD = 3000, MAT_DIAMOND = 4000)
	build_path = /obj/item/scalpel/laser/manager/omnimanager
	category = list("Medical")