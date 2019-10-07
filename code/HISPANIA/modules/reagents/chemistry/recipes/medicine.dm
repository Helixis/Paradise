/datum/chemical_reaction/ampligen
	name = "Ampligen"
	id = "ampligen"
	result = "ampligen"
	required_reagents = list("mutadone" = 1, "fluorine" = 1,"chlorine" = 1)
	result_amount = 3
	mix_message = "The solution gently swirls with a metallic sheen."

/datum/chemical_reaction/balavir
	name = "Balavir"
	id = "balavir"
	result = "ampligen"
	required_reagents = list("phenol" = 1, "acetone" = 1)
	result_amount = 3
	mix_message = "The solution gently swirls with a metallic sheen."

/datum/chemical_reaction/dolutegravir
	name = "Dolutegravir"
	id = "dolutegravir"
	result = "dolutegravir"
	required_reagents = list("ampligen" = 3, "balavir" = 3)
	result_amount = 3
	mix_message = "The solution gently swirls with a metallic sheen."

/datum/chemical_reaction/efavirenz
	name = "Efavirenz"
	id = "efavirenz"
	result = "efavirenz"
	required_reagents = list("pen_acid" = 2, "ampligen" = 2, "phenol" = 2)
	result_amount = 1
	mix_message = "The solution gently swirls with a metallic sheen."

/datum/chemical_reaction/famciclovir
	name = "Famciclovir"
	id = "famciclovir"
	result = "famciclovir"
	required_reagents = list("efavirenz" = 1, "fosamprenavir" = 1, "dolutegravir" = 1)
	result_amount = 2
	mix_message = "The solution gently swirls with a metallic sheen."

/datum/chemical_reaction/fosamprenavir
	name = "Fosamprenavir"
	id = "fosamprenavir"
	result = "fosamprenavir"
	required_reagents = list("copper" = 1, "sugar" = 1, "ammonia" = 1, "iron" = 1)
	result_amount = 3
	mix_message = "The solution gently swirls with a metallic sheen."