//Platform Code by Danaleja2005

/obj/structure/platform
    name = "Metal Platform"
    icon = 'icons/hispania/obj/platform.dmi'
    icon_state = "metal"
    desc =  " A metal platform"
    flags = ON_BORDER
    anchored = FALSE
    var/corner = FALSE
    var/material_type = /obj/item/stack/sheet/metal
    var/material_amount = 10 
    var/decon_speed = null

/obj/structure/platform/New()
    ..()
    if(corner)
        decon_speed = 30
    else   
        decon_speed = 60    

// Construcción

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

/obj/structure/platform/CheckExit(atom/movable/O, turf/target)
    if(corner) 
        return  FALSE
    if(O && O.throwing)
        return TRUE
    if(((flags & ON_BORDER) && get_dir(loc, target) == dir))
        return FALSE
    else
        return TRUE

/obj/structure/platform/CanPass(atom/movable/mover, turf/target)
    if(corner)
        return FALSE
    if(mover && mover.throwing)
        return TRUE
    var/obj/structure/S = locate(/obj/structure) in get_turf(mover)
    if(S && S.climbable && !(S.flags & ON_BORDER) && climbable && isliving(mover)) //Climbable objects allow you to universally climb over others
        return TRUE
    if(!(flags & ON_BORDER) || get_dir(loc, target) == dir)
        return FALSE
    else
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
    material_amount = 5 

/*Plataformas para el Map
Tan simple como que no hubo forma de hacer 
que las plataformas del mapa iniciaron anchored y 
las de construccion iniciaran unanchored*/

/obj/structure/platform/map
    anchored = TRUE

/obj/structure/platform/corner/map
    anchored = TRUE

/obj/structure/platform/metal2/map
    anchored = TRUE

/obj/structure/platform/metal2/corner/map
    anchored = TRUE