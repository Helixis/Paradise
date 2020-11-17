/obj/item/clothing/suit/hooded/armor
	name = "warden's armored winter coat"
	desc = "A heavy armored jacket made from 'synthetic' animal furs with silver rank pips and livery."
	icon_state = "wintercoat_warden"
	item_state = "wintercoat_warden"
	allowed = list(/obj/item/gun/energy,/obj/item/reagent_containers/spray/pepper,/obj/item/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/melee/classic_baton/telescopic,/obj/item/kitchen/knife)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|HANDS
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = UPPER_TORSO|LOWER_TORSO|HANDS
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	strip_delay = 70
	put_on_delay = 40
	max_integrity = 250
	flags_inv = HIDEJUMPSUIT
	resistance_flags = NONE
	hispania_icon = TRUE
	dog_fashion = null
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/security/warden

/obj/item/clothing/suit/hooded/armor/hos
	name = "armored winter coat"
	desc = "A trench coat enhanced with a special alloy for some protection and style. Hood Included"
	icon_state = "wintercoat_hos"
	item_state = "wintercoat_hos"
	strip_delay = 80
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 70, "acid" = 90)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/security/hos

/obj/item/clothing/suit/hooded/armor/detective
	name = "winter coat"
	desc = "An 18th-century multi-purpose winter trenchcoat. Someone who wears this means serious business."
	icon_state = "wintercoat_detective"
	item_state = "wintercoat_detective"
	blood_overlay_type = "coat"
	strip_delay = 60
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|HANDS
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|HANDS
	allowed = list(/obj/item/tank/emergency_oxygen, /obj/item/reagent_containers/spray/pepper, /obj/item/flashlight, /obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/detective_scanner, /obj/item/taperecorder, /obj/item/melee/classic_baton/telescopic, /obj/item/kitchen/knife)
	armor = list("melee" = 25, "bullet" = 10, "laser" = 25, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 45)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/security/detective

/obj/item/clothing/suit/hooded/armor/brigdoc
	name = "brig physician winter coat"
	desc = "A winter coat often worn by doctors caring for inmates."
	icon_state = "wintercoat_brigdoc"
	item_state = "wintercoat_brigdoc"
	strip_delay = 60
	allowed = list(/obj/item/gun/energy,/obj/item/reagent_containers/spray/pepper,/obj/item/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/melee/classic_baton/telescopic,/obj/item/kitchen/knife,/obj/item/stack/medical,/obj/item/reagent_containers/dropper,/obj/item/reagent_containers/hypospray,/obj/item/reagent_containers/applicator,/obj/item/reagent_containers/syringe,/obj/item/healthanalyzer,/obj/item/radio,/obj/item/tank/emergency_oxygen,/obj/item/rad_laser)
	armor = list(melee = 10, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 10, rad = 0, fire = 25, acid = 25)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/security

/obj/item/clothing/head/hooded/winterhood/security/warden
	icon_state = "winterhood_warden"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 25)
	hispania_icon = TRUE

/obj/item/clothing/head/hooded/winterhood/security/detective
	icon_state = "winterhood_detective"
	armor = list("melee" = 25, "bullet" = 5, "laser" = 25, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 25)
	hispania_icon = TRUE

/obj/item/clothing/head/hooded/winterhood/security/hos
	icon_state = "winterhood_hos"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 25, "bio" = 10, "rad" = 0, "fire" = 15, "acid" = 25)
	hispania_icon = TRUE
