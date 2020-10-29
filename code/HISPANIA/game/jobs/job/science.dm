/datum/job/techwr
	title = "Science Assistant"
	flag = JOB_TECHWR
	department_flag = JOBCAT_MEDSCI
	total_positions = 1
	spawn_positions = 1
	is_science = 1
	supervisors = "the research director"
	department_head = list("Research Director")
	selection_color = "#ffeeff"
	access = list(ACCESS_ROBOTICS, ACCESS_RESEARCH, ACCESS_XENOBIOLOGY, ACCESS_XENOARCH, ACCESS_MINERAL_STOREROOM, ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_RESEARCH, ACCESS_XENOBIOLOGY, ACCESS_XENOARCH, ACCESS_MINERAL_STOREROOM, ACCESS_MAINT_TUNNELS)
	outfit = /datum/outfit/job/techwr

/datum/outfit/job/techwr
	name = "Science Assistant"
	jobtype = /datum/job/techwr

	uniform = /obj/item/clothing/under/retro/science
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/radio/headset/headset_sci
	id = /obj/item/card/id/research
	pda = /obj/item/pda/toxins

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel_tox
	dufflebag = /obj/item/storage/backpack/duffel/science
