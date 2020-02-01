//////////////
////Butter////
/////////////

/obj/item/reagent_containers/food/snacks/butter
	name = "butter"
	icon = 'icons/hispania/obj/food/food.dmi'
	icon_state = "butter"
	desc = "Delicious milk fat."
	filling_color = "#fff98f"
	bitesize = 3
	list_reagents = list("butter" = 20)
	tastes = list("butter" = 1)
	junkiness = 20
	var/stick = FALSE

/obj/item/reagent_containers/food/snacks/butter/update_icon()
	if(stick)
		icon_state = "butter_stick"
		name = "butter on a stick"
	else
		icon_state = "butter"

//butter + metal rod = butter on a stick
/obj/item/reagent_containers/food/snacks/butter/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/rods) && !stick)
		to_chat(user, "<span class='notice'>You insert the [I] into the [src].</span>")
		stick = TRUE
		update_icon()
		qdel(I)
	else
		return ..()


      //////////////////
      ////Tortafrita////
      /////////////////


/obj/item/reagent_containers/food/snacks/raw_tortafrita
	name = "raw tortafrita"
	icon = 'icons/hispania/obj/food/food.dmi'
	icon_state = "rawtortafrita"
	desc = "Delicious raw dough!"
	bitesize = 3
	list_reagents = list("butter" = 5, "nutriment" = 2 ,"sodiumchloride" = 1)
	tastes = list("dough" = 1)


// Flat Dough + Circular Cutter = x3 raw tortafritas
/obj/item/reagent_containers/food/snacks/sliceable/flatdough/attackby(obj/item/I, mob/user, params)
    if(istype(I, /obj/item/kitchen/cutter))
        if(isturf(loc))
            for(var/i=1 to 3)
                new /obj/item/reagent_containers/food/snacks/raw_tortafrita(loc)
            to_chat(user, "<span class='notice'>You cut [src] into tortafritas.</span>")
            qdel(src)
        else
            to_chat(user, "<span class='notice'>You need to put [src] on a surface to cut it!</span>")
    else
        ..()
