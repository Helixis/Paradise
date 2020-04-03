/obj/item/gun/energy/disabler/magistrate
	name = "lawyer-x3ph"
	desc = "An small sized energy-gun made for self-defense, in the back there's writen ``May the law be with you.``.Has only 2 charges of disabler."
	icon_state = "lawyer"
	item_state = "revolver"
	w_class = WEIGHT_CLASS_SMALL
	ammo_type = list(/obj/item/ammo_casing/energy/emergency)
	ammo_x_offset = 1
	shaded_charge = 1

/obj/item/gun/energy/kinetic_accelerator/crossbow/purdar
	name = "purple energy crossbow"
	desc = "A weapon favored by stealth specialists."
	icon = 'icons/hispania/obj/guns/projectile.dmi'
	icon_state = "purplebow"
	item_state = "purplebow"
	w_class = WEIGHT_CLASS_SMALL
	origin_tech = "combat=7;magnets=7;syndicate=7" //High Tech Stuff
	suppressed = 1   //Sin ruidos, sin problemas
	ammo_type = list(/obj/item/ammo_casing/energy/bolt)
	weapon_weight = WEAPON_LIGHT
	unique_rename = 0
	overheat_time = 10
	holds_charge = TRUE
	unique_frequency = TRUE
	can_flashlight = 0
	max_mod_capacity = 0
	empty_state = null