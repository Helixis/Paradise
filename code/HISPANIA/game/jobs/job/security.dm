//HOS - HEAD
/datum/outfit/job/hos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/podpilot)
	H.add_quirk(/datum/quirk/shooter)
	H.add_quirk(/datum/quirk/donaslove)

//WARDEN - SUBJEFE
/datum/outfit/job/warden/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/podpilot)
	H.add_quirk(/datum/quirk/shooter)
	H.add_quirk(/datum/quirk/donaslove)

//OFICIAL - JOB COMPLETO
/datum/outfit/job/officer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/shooter)
	H.add_quirk(/datum/quirk/donaslove)

//BRIGDOC - JOB ESPECIAL
/datum/outfit/job/brigdoc/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/mechpilot)
	H.add_quirk(/datum/quirk/podpilot) //NO TIENE ACCESOS,PERO LOS SEC NORMALES SÍ. PARA RESCATES, COMO EL PARAMEDICO
	H.add_quirk(/datum/quirk/donaslove)

//DETECTIVE - JOB ROL
/datum/outfit/job/detective/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/borrachoexperto)
	H.add_quirk(/datum/quirk/estomagofuerte)
	H.add_quirk(/datum/quirk/donaslove)

//PILOTO - JOB ESPECIAL
/datum/outfit/job/pilot/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	H.add_quirk(/datum/quirk/podpilot)
	H.add_quirk(/datum/quirk/donaslove)
