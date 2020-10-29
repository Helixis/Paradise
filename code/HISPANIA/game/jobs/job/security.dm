/datum/job/internsec
	title = "Cadet"
	flag = JOB_INTERNSEC
	department_flag = JOBCAT_ENGSEC
	total_positions = 2
	spawn_positions = 2
	is_security = 1
	supervisors = "the Head of Security"
	department_head = list("Head of Security")
	selection_color = "#ffeeee"
	access = list(ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_MAINT_TUNNELS)
	outfit = /datum/outfit/job/internsec

/datum/outfit/job/internsec
	name = "Cadet"
	jobtype = /datum/job/internsec
	uniform = /obj/item/clothing/under/rank/security2
	suit = /obj/item/clothing/suit/armor/vest/security
	head = /obj/item/clothing/head/beret/sec
	shoes = /obj/item/clothing/shoes/jackboots
	l_ear = /obj/item/radio/headset/headset_sec/alt
	id = /obj/item/card/id/security
	pda = /obj/item/pda/security
	backpack_contents = list(
		/obj/item/restraints/handcuffs/cable/white = 2,
		/obj/item/restraints/legcuffs/bola/energy = 1
		)
	implants = list(/obj/item/implant/mindshield)
	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel_sec
	dufflebag = /obj/item/storage/backpack/duffel/security
	l_pocket = /obj/item/flash
	r_pocket = /obj/item/reagent_containers/spray/pepper
