//RD
/datum/outfit/job/rd/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/cirujano)

//CIENTIFICO
/datum/outfit/job/scientist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/cirujano)

//ROBOTISTA - JOB DE ROL
/datum/outfit/job/roboticist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/cirujano)


