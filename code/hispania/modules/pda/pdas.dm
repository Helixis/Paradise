/datum/action/item_action/active_pda

/obj/item/pda/pid_boy
	name = "pid boy"
	icon_state =  "pda-pib_boy"
	icon = 'icons/hispania/obj/pda.dmi'
	//armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)
	//resistance_flags = FIRE_PROOF | ACID_PROOF
	slot_flags = SLOT_ID | SLOT_BELT | SLOT_PDA | SLOT_GLOVES
	body_parts_covered = HANDS
	actions_types = list(/datum/action/item_action/active_pda)
	var/transfer_prints = TRUE

/obj/item/pda/pid_boy/item_action_slot_check(slot, mob/user)
	return (slot == slot_gloves)
