/obj/item/b_rig/industrial
	name = "industrial suit control module"
	suit_type = "industrial hardsuit"
	desc = "A heavy, powerful rig used by construction crews and mining corporations."
	icon_state = "engineering_rig"
	item_state = "engineering_rig"
	armor = list(melee = 10, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 75)
	active_slowdown = 3
	offline_slowdown = 10
	offline_vision_restriction = 2
	helm_type = /obj/item/clothing/head/helmet/space/new_rig/industrial
	req_access = list()
	req_one_access = list()

/obj/item/b_rig/medical
	name = "rescue suit control module"
	suit_type = "rescue hardsuit"
	desc = "A durable suit designed for medical rescue in high risk areas."
	icon_state = "medical_rig"
	armor = list(melee = 10, bullet = 5, laser = 10, energy = 5, bomb = 10, bio = 100, rad = 50)
	active_slowdown = 1
	offline_vision_restriction = 1
	helm_type = /obj/item/clothing/head/helmet/space/new_rig/medical
	req_access = list()
	req_one_access = list()

/obj/item/b_rig/hazard
	name = "hazard hardsuit control module"
	suit_type = "hazard hardsuit"
	desc = "A Security hardsuit designed for prolonged EVA in dangerous environments."
	icon_state = "hazard_rig"
	armor = list(melee = 30, bullet = 15, laser = 30, energy = 10, bomb = 10, bio = 100, rad = 50)
	active_slowdown = 1
	offline_slowdown = 3
	offline_vision_restriction = 1
	helm_type = /obj/item/clothing/head/helmet/space/new_rig/hazard
	req_access = list()
	req_one_access = list()
