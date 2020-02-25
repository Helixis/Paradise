/obj/structure/chemical_barrel
	name = "chemical barrel"
	desc = "A large plasteel barrel. You can store huge ammounts of chemicals inside."
	icon = 'icons/obj/objects.dmi'
	icon_state = "barrel"
	density = TRUE
	anchored = FALSE
	container_type = DRAINABLE | AMOUNT_VISIBLE
	pressure_resistance = 2 * ONE_ATMOSPHERE
	max_integrity = 300
	var/open = FALSE

/obj/structure/chemical_barrel/Initialize()
	create_reagents(600) //Son enormes pero no puedes insertarlos en un chem dispenser
	. = ..()

/obj/structure/chemical_barrel/examine(mob/user)
	. = ..()
	. += "<span class='notice'>It is currently [open ? "open, letting you pour liquids in." : "closed, letting you draw liquids from the tap."] </span>"

/obj/structure/chemical_barrel/attack_hand(mob/user)
	open = !open
	if(open)
		container_type = REFILLABLE | AMOUNT_VISIBLE
		to_chat(user, "<span class='notice'>You open [src], letting you fill it.</span>")
	else
		container_type = DRAINABLE | AMOUNT_VISIBLE
		to_chat(user, "<span class='notice'>You close [src], letting you draw from its tap.</span>")
	update_icon()