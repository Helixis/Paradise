//DISPARAR
/datum/quirk/nonviolent
	name = "Pacifista"
	desc = "Repudias la violencia, de hecho nunca heririas a nadie."
	value = -2 //esto te hace perder toda habilidad de combate asi que considero que vale por muchas habilidades
	mob_trait = TRAIT_PACIFISM
	gain_text = "<span class='danger'>Repudias todo acto de violencia!</span>"
	lose_text = "<span class='notice'>Puedes defenderte a ti mismo nuevamente.</span>"
	class = "SEGURIDAD"
	subclass = "DISPARAR"
	etiqueta = "SKILL"

/datum/quirk/gusfobia
	name = "Guns fobia"
	desc = "Le tienes fobia a las armas de fuego."
	value = -1 //esto vale uno porque si alguien lo toma tambien puede tomar el poor_aim gratis
	mob_trait = TRAIT_GUNS_FOBIA
	gain_text = "<span class='danger'>Recuerdas eso... disparos, no de nuevo!</span>"
	lose_text = "<span class='notice'>Pues disparar es hasta divertido, quien lo diria.</span>"
	class = "SEGURIDAD"
	subclass = "DISPARAR"
	etiqueta = "SKILL"

//MISC - SKILLS
/datum/quirk/notools
	name = "Manos inutiles"
	desc = "El uso de herramientas se te dificulta."
	value = -2
	mob_trait = TRAIT_NO_TOOLS
	gain_text = "<span class='danger'>Tus habilidades manuales son basura!</span>"
	lose_text = "<span class='notice'>Al parecer esto de la mecánica no era tan difícil</span>"
	class = "INGENERIA"
	subclass = "TOOLS"
	etiqueta = "SKILL"

/datum/quirk/nocraft
	name = "Desmanado"
	desc = "No puedes craftear nada."
	value = -2
	mob_trait = TRAIT_NO_CRAFT
	gain_text = "<span class='danger'>No podrías ni craftear un barco de papel.</span>"
	lose_text = "<span class='notice'>Esto de craftear no se te daba tan mal.</span>"
	class = "INGENERIA"
	subclass = "CRAFT"
	etiqueta = "SKILL"

//GENETICA
/datum/quirk/torpeza
	name = "Torpeza"
	desc = "Parece que eres torpe, quiza tengas algun cromosoma extra."
	value = -1
	gain_text = "<span class='danger'>Eres torpe, cuidado al caminar!</span>"
	lose_text = "<span class='notice'>Pues esto de trabajar no era nada del otro mundo.</span>"
	class = "INGENERIA"
	subclass = "TOOLS"

/datum/quirk/torpeza/add()
	var/mob/living/carbon/human/H = quirk_holder
	H.dna.SetSEState(GLOB.clumsyblock, TRUE)
	genemutcheck(H, GLOB.clumsyblock, null, MUTCHK_FORCED)
	H.dna.default_blocks.Add(GLOB.clumsyblock)
	H.check_mutations = TRUE

/datum/quirk/manco
	name = "Manco"
	desc = "Hace mucho perdiste una mano en un accidente."
	value = -1
	gain_text = "<span class='danger'>Que le ha pasado a tu mano?</span>"
	lose_text = "<span class='notice'>Pues parece que al final.</span>"
	class = "MEDABAY"
	subclass = "CUERPO"
	etiqueta = "DISCAPACIDAD"

/datum/quirk/manco/on_spawn() //these should only trigger when the character is being created for the first time, i.e. roundstart/latejoin
	var/mob/living/carbon/human/H = quirk_holder
	var/picked_hand = pick("l_hand", "r_hand")
	var/obj/item/organ/external/M = H.get_organ(picked_hand)
	qdel(M)
