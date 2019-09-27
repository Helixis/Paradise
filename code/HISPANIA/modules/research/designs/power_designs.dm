/datum/design/xenobluecellmaker
	name = "Xenobluespace power cell Maker"
	desc = "High-tech porwer cell shell capable of creating a porwer cell that combines Bluespace and xenobiology technology."
	id = "xenobluecell"
	req_tech = list("powerstorage" = 7, "materials" = 6, "engineering" = 6, "bluespace" = 6)
	build_type = PROTOLATHE | MECHFAB | PODFAB
	materials = list(MAT_METAL = 2000, MAT_GOLD = 440, MAT_GLASS = 720, MAT_DIAMOND = 480, MAT_URANIUM = 100, MAT_TITANIUM = 600, MAT_BLUESPACE = 200)
	build_path = /obj/item/xenobluecellmaker
	category = list("Misc","Power")
	lathe_time_factor = 0.2

/datum/design/high_cell_plus
	name = "High-Capacity Power Cell+"
	desc = "A power cell that holds 15 kW of power."
	id = "high_cell_plus"
	req_tech = list("powerstorage" = 3)
	build_type = PROTOLATHE | MECHFAB | PODFAB
	materials = list(MAT_METAL = 700, MAT_GLASS = 65)
	build_path = /obj/item/stock_parts/cell/high/plus/empty
	category = list("Misc","Power")
	lathe_time_factor = 0.2




