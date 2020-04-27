//Designs
/datum/design/corporate_module
	name = "Core AI Module (Commander)"
	desc = "Allows for the construction of a Commander AI Core Module."
	id = "commander_module"
	req_tech = list("programming" = 5, "materials" = 5)
	build_type = IMPRINTER
	materials = list(MAT_GLASS = 1000, MAT_DIAMOND = 100)
	build_path = /obj/item/aiModule/commander
	category = list("AI Modules")


/datum/design/corporate_module
	name = "Core AI Module (AntiEoC)"
	desc = "Allows for the construction of a AntiEoC AI Core Module."
	id = "corporate_module"
	req_tech = list("programming" = 5, "materials" = 5, "combat" = 5)
	build_type = IMPRINTER
	materials = list(MAT_GLASS = 1000, MAT_DIAMOND = 100)
	build_path = /obj/item/aiModule/aeoc
	category = list("AI Modules")
