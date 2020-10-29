//Indumentaria para el beekeeper//

/datum/outfit/job/hydro/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(H.mind && H.mind.role_alt_title)
		switch(H.mind.role_alt_title)
			if("Beekeeper")
				uniform = /obj/item/clothing/under/rank/hydroponics
				suit = /obj/item/clothing/suit/beekeeper_suit
				gloves = /obj/item/clothing/gloves/botanic_leather
				shoes = /obj/item/clothing/shoes/black
				head = /obj/item/clothing/head/beekeeper_head
				l_ear = /obj/item/radio/headset/headset_service
				suit_store = /obj/item/melee/flyswatter
				pda = /obj/item/pda/botanist
				backpack = /obj/item/storage/backpack/botany
				satchel = /obj/item/storage/backpack/satchel_hyd
				dufflebag = /obj/item/storage/backpack/duffel/hydro

// Indumentaria Cadaveres de TSF Discovery //
/datum/outfit/sol_gov/solgov_no_gun
	name = "Solar Federation Marine (No Gun)"

	uniform = /obj/item/clothing/under/solgov
	suit = /obj/item/clothing/suit/armor/bulletproof
	back = /obj/item/storage/backpack/security
	belt = /obj/item/storage/belt/military/assault
	head = /obj/item/clothing/head/soft/solgov
	glasses = /obj/item/clothing/glasses/hud/security/night
	gloves = /obj/item/clothing/gloves/combat
	shoes = /obj/item/clothing/shoes/combat
	r_pocket = /obj/item/flashlight/seclite

/datum/outfit/sol_gov/solgov_gun
	name = "Solar Federation Captain"

	uniform = /obj/item/clothing/under/solgov
	suit = /obj/item/clothing/suit/armor/bulletproof
	back = /obj/item/storage/backpack/security
	belt = /obj/item/storage/belt/military/assault
	head = /obj/item/clothing/head/soft/solgov
	glasses = /obj/item/clothing/glasses/hud/security/night
	gloves = /obj/item/clothing/gloves/combat
	shoes = /obj/item/clothing/shoes/combat
	r_pocket = /obj/item/flashlight/seclite
	backpack_contents = list(
		/obj/item/storage/box/responseteam = 1,
		/obj/item/ammo_box/magazine/m556 = 3,
		/obj/item/clothing/shoes/magboots = 1,
		/obj/item/gun/projectile/automatic/pistol/m1911 = 1,
		/obj/item/ammo_box/magazine/m45 = 2
	)
//fin discovery

/datum/job/waiter
	title = "Waiter"
	flag = JOB_WAITER
	department_flag = JOBCAT_SUPPORT
	total_positions = 2
	spawn_positions = 2
	is_service = 1
	supervisors = "the head of personnel"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_MAINT_TUNNELS)
	access = list(ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_MAINT_TUNNELS)
	outfit = /datum/outfit/job/waiter

/datum/outfit/job/waiter
	name = "Waiter"
	jobtype = /datum/job/waiter
	uniform = /obj/item/clothing/under/waiter
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/radio/headset/headset_service
	pda = /obj/item/pda/bar
	l_hand = /obj/item/clipboard

/datum/job/courier
	title = "Courier"
	flag = JOB_COURIER
	department_flag = JOBCAT_SUPPORT
	total_positions = 1
	spawn_positions = 1
	is_supply = 1
	supervisors = "Quartermaster"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM)
	outfit = /datum/outfit/job/courier

/datum/outfit/job/courier
	name = "Courier"
	jobtype = /datum/job/courier

	uniform = /obj/item/clothing/under/rank/cargotech
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/mailman
	l_ear = /obj/item/radio/headset/headset_cargo
	id = /obj/item/card/id/supply
	pda = /obj/item/pda/cargo
