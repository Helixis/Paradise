/datum/job/internmed
	title = "Intern"
	flag = JOB_INTERN
	department_flag = JOBCAT_MEDSCI
	total_positions = 2
	spawn_positions = 2
	is_medical = 1
	supervisors = "the chief medical officer"
	department_head = list("Chief Medical Officer")
	selection_color = "#ffeef0"
	access = list(ACCESS_MEDICAL, ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_SURGERY)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_SURGERY)
	outfit = /datum/outfit/job/internmed

/datum/outfit/job/internmed
	name = "Intern"
	jobtype = /datum/job/internmed
	uniform = /obj/item/clothing/under/rank/medical
	suit = /obj/item/clothing/suit/storage/labcoat
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/radio/headset/headset_med
	id = /obj/item/card/id/medical
	l_hand = /obj/item/storage/firstaid/doctor
	pda = /obj/item/pda/medical
	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel_med
	dufflebag = /obj/item/storage/backpack/duffel/medical
