//Platform Code by Danaleja2005

/obj/structure/platform
    name = "Metal Platform"
    icon = 'icons/hispania/obj/platform.dmi'
    icon_state = "metal"
    desc =  " A metal platform"
    flags = ON_BORDER
    var/corner = FALSE
    var/material_type = /obj/item/stack/sheet/metal
    var/material_amount = 5 
    var/decon_speed
    
/obj/structure/platform/Initialize()
    anchored = TRUE
    return ..()

/obj/structure/platform/New()
    ..()
    if(corner)
        decon_speed = 5
    else   
        decon_speed = 10    

// Construction

/obj/structure/platform/screwdriver_act(mob/user, obj/item/I)
    . = TRUE
    to_chat(user, "<span class='notice'>You begin [anchored == TRUE ? "unscrewing" : "screwing"] [src] to the floor.</span>")
    if(!I.use_tool(src, user, decon_speed, volume = I.tool_volume))
        return
    to_chat(user, "<span class='notice'>You [anchored == TRUE ? "unscrew" : "screw"] [src] to the floor.</span>")
    anchored = !anchored

/obj/structure/platform/wrench_act(mob/user, obj/item/I)
    if(user.a_intent != INTENT_HELP)
        return
    . = TRUE
    if(anchored)
        to_chat(user, "<span class='notice'>You cannot disassemble [src] unscrew it firts!.</span>")
        return
    TOOL_ATTEMPT_DISMANTLE_MESSAGE
    if(!I.use_tool(src, user, decon_speed, volume = I.tool_volume))
        return
    var/obj/item/stack/sheet/G = new material_type(user.loc, material_amount)
    G.add_fingerprint(user)
    playsound(src, 'sound/items/deconstruct.ogg', 50, 1) 
    TOOL_DISMANTLE_SUCCESS_MESSAGE 
    qdel(src)

/obj/structure/platform/CanPass(atom/movable/mover, turf/target, height=0)
    if(corner)
        if(get_dir(loc, target) == dir) //Make sure looking at appropriate border
            return !density
        else
            return TRUE

/obj/structure/platform/CheckExit(atom/movable/O, target) 
	if(istype(O) && O.checkpass(PASSTABLE))
		return TRUE

/obj/structure/platform/CanAtmosPass()
    return TRUE

/obj/structure/platform/metal2
    name = "Metal Platform 2"
    icon_state = "metal2"
    material_type = /obj/item/stack/sheet/plasteel

///Corners

/obj/structure/platform/corner
    name = "Metal Platform Corner"
    icon_state = "metalcorner"
    desc =  " A metal platform corner"
    corner = TRUE
    material_amount = 5 

/obj/structure/platform/metal2/corner 
    name = "Metal Platform 2"
    desc =  " A metal platform corner"
    icon_state = "metalcorner2"
    corner = TRUE
    material_type = /obj/item/stack/sheet/plasteel
    material_amount = 5 

