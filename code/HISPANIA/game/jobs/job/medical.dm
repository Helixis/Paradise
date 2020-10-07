//SEEMEO
/datum/outfit/job/cmo/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/cirujano)

//DOCTOR - JOB COMPLETO
/datum/outfit/job/doctor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/cirujano)

//FORENCE - JOB DE ROL
/datum/outfit/job/coroner/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/cirujano)
	H.add_quirk(/datum/quirk/estomagofuerte)

//QUIMICO  - JOB DE ROL
/datum/outfit/job/chemist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/cirujano)

//GENETISTA - JOB DE ROL
/datum/outfit/job/geneticist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/cirujano)

//VIROLOGO - JOB DE ROL
/datum/outfit/job/virologist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/cirujano)

//SIQUIATRA  - JOB DE ROL
/datum/outfit/job/psychiatrist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/cirujano)

//PARAMEDICO - JOB DE ESPECIAL
/datum/outfit/job/paramedic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/podpilot) //PARA RESACATES ESPACIALES
