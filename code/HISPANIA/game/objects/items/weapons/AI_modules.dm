/******************** Commander ********************/
/obj/item/aiModule/commander // -- Protege a comando (Danger)
	name = "\improper 'Commander' core AI module"
	desc = "An 'Commander' Core AI Module: 'Reconfigures the AI's core laws.'"
	origin_tech = "programming=5;materials=5"
	laws = new/datum/ai_laws/commander()

/******************** aEoC ********************/
/obj/item/aiModule/aeoc // -- Elimina a cualquier EoC (Danger)
	name = "\improper 'aEoC' core AI module"
	desc = "An 'AntiEnemy of Corporation' Core AI Module: 'Reconfigures the AI's core laws.'"
	origin_tech = "programming=5;materials=5;combat=5"
	laws = new/datum/ai_laws/aeoc()


