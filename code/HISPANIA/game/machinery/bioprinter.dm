/obj/item/circuitboard/bioprinter
	name = "Circuit board (BioPrinter)"
	build_path = /obj/machinery/bioprinter
	board_type = "machine"
	origin_tech = "engineering=2;programming=2;biotech=5"
	req_components = list(
							/obj/item/stock_parts/matter_bin = 3,
							/obj/item/stock_parts/manipulator = 1,
							/obj/item/stack/sheet/glass = 1)

/obj/machinery/bioprinter
	name = "bioprinter"
	desc = "It produces organs and limbs using biomass."
	icon = 'icons/hispania/obj/machines/research.dmi'
	icon_state = "bioprinter"
	density = 1
	anchored = 1.0
	use_power = IDLE_POWER_USE
	idle_power_usage = 40
	active_power_usage = 200
	var/busy = FALSE
	var/biomass = 0
	light_color = LIGHT_COLOR_PURE_GREEN
	var/list/products = list(
		"heart"    	 	  = list(/obj/item/organ/internal/heart,  50),
		"ears"  			= list(/obj/item/organ/internal/ears, 50),
		"eyes"  		    = list(/obj/item/organ/internal/eyes,  30),
		"kidney"        = list(/obj/item/organ/internal/kidneys,  30),
		"liver"  		= list(/obj/item/organ/internal/liver,  30),
		"human lungs"       = list(/obj/item/organ/internal/lungs, 30),
		"plasmaman lungs"          = list(/obj/item/organ/internal/lungs/plasmaman,20),
		"vox lungs"       = list(/obj/item/organ/internal/lungs/vox,   30),
		"drask lungs"        = list(/obj/item/organ/internal/lungs/drask,   30),
		"right arm"			= list(/obj/item/organ/external/arm/right, 100),
		"left arm"			= list(/obj/item/organ/external/arm, 100),
		"left leg"			= list(/obj/item/organ/external/leg, 100),
		"right leg"			= list(/obj/item/organ/external/leg/right, 100),
		"right foot"		= list(/obj/item/organ/external/foot/right, 50),
		"left foot"		= list(/obj/item/organ/external/foot, 50),
		"left hand"		= list(/obj/item/organ/external/hand, 50),
		"left hand"		= list(/obj/item/organ/external/hand/right, 50)
	)

/obj/machinery/bioprinter/New()
	..()
	component_parts = list()
	component_parts += new /obj/item/circuitboard/bioprinter(null)
	component_parts += new /obj/item/stock_parts/matter_bin(null)
	component_parts += new /obj/item/stock_parts/matter_bin(null)
	component_parts += new /obj/item/stock_parts/matter_bin(null)
	component_parts += new /obj/item/stock_parts/manipulator(null)
	component_parts += new /obj/item/stack/sheet/glass(null)
	RefreshParts()

/obj/machinery/bioprinter/interact(mob/user)
	if(panel_open)
		to_chat(user, "<span class='alert'>The bioprinter panel is open. Please close the panel to use.</span>")
		return
	else
		attack_hand(user)

/obj/machinery/bioprinter/update_icon()
	if(stat & NOPOWER)
		icon_state = "bioprinter_off"
	..()

/obj/machinery/bioprinter/attack_hand(mob/user)
	if(!ishuman(user) && !ismachineperson(user) && !issilicon(user))
		return
	if(stat & NOPOWER)
		return
	var/choice = input("What would you like to print?") as null|anything in products

	if(!choice)
		return
	if(busy == FALSE)
		if(biomass >= products[choice][2])
			busy = TRUE
			biomass -= products[choice][2]
			var/new_organ = products[choice][1]
			icon_state = "bioprinter"
			flick("bioprinter_n",src)
			sleep(40)
			new new_organ(get_turf(src))
			visible_message("<span class='notice'>\The [src] spits out a brand new organ.</span>")
			busy = FALSE
		else
			visible_message("<span class='warning'>\The [src]'s error light flickers. It can't make new organs out of thin air, fill it up first.</span>")
			visible_message("<span class='warning'>\The [src]'s states. Current Biomass Level: [src.biomass]  </span>")
	else
		visible_message("<span class='warning'>\The [src]'s error light flickers. It can't make new organs while its printing.</span>")

/obj/machinery/bioprinter/attackby(obj/item/I, mob/user)
	if(exchange_parts(user, I))
		return
	if(is_type_in_list(I, GLOB.cloner_biomass_items))
		if(user.drop_item())
			to_chat(user, "<span class='notice'>[src] processes [I].</span>")
			biomass += BIOMASS_BASE_AMOUNT
			visible_message("<span class='notice'>Current Biomass Level: [src.biomass] </span>")
			qdel(I)
	else
		return ..()

/obj/machinery/bioprinter/screwdriver_act(mob/user, obj/item/I)
	if(!I.use_tool(src, user, 0, volume = 0))
		return
	. = TRUE
	if(busy)
		to_chat(user, "<span class='alert'>The bioprinter is busy. Please wait for completion of previous operation.</span>")
		return
	if(default_deconstruction_screwdriver(user, "bioprinter_panel", "bioprinter", I))
		I.play_tool_sound(user, I.tool_volume)

/obj/machinery/bioprinter/crowbar_act(mob/user, obj/item/I)
	if(!I.use_tool(src, user, 0, volume = 0))
		return
	. = TRUE
	if(busy)
		to_chat(user, "<span class='alert'>The bioprinter is busy. Please wait for completion of previous operation.</span>")
		return
	if(panel_open)
		default_deconstruction_crowbar(user, I)
		I.play_tool_sound(user, I.tool_volume)
