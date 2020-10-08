// trait accessor defines
#define ADD_TRAIT(target, trait, source) \
	do { \
		var/list/_L; \
		if (!target.status_traits) { \
			target.status_traits = list(); \
			_L = target.status_traits; \
			_L[trait] = list(source); \
		} else { \
			_L = target.status_traits; \
			if (_L[trait]) { \
				_L[trait] |= list(source); \
			} else { \
				_L[trait] = list(source); \
			} \
		} \
	} while (0)
#define REMOVE_TRAIT(target, trait, sources) \
	do { \
		var/list/_L = target.status_traits; \
		var/list/_S; \
		if (sources && !islist(sources)) { \
			_S = list(sources); \
		} else { \
			_S = sources\
		}; \
		if (_L && _L[trait]) { \
			for (var/_T in _L[trait]) { \
				if ((!_S && (_T != ROUNDSTART_TRAIT)) || (_T in _S)) { \
					_L[trait] -= _T \
				} \
			};\
			if (!length(_L[trait])) { \
				_L -= trait \
			}; \
			if (!length(_L)) { \
				target.status_traits = null \
			}; \
		} \
	} while (0)
#define REMOVE_TRAITS_NOT_IN(target, sources) \
	do { \
		var/list/_L = target.status_traits; \
		var/list/_S = sources; \
		if (_L) { \
			for (var/_T in _L) { \
				_L[_T] &= _S;\
				if (!length(_L[_T])) { \
					_L -= _T } \
				};\
				if (!length(_L)) { \
					target.status_traits = null\
				};\
		}\
	} while (0)
#define HAS_TRAIT(target, trait) (target.status_traits ? (target.status_traits[trait] ? TRUE : FALSE) : FALSE)
#define HAS_TRAIT_FROM(target, trait, source) (target.status_traits ? (target.status_traits[trait] ? (source in target.status_traits[trait]) : FALSE) : FALSE)

/*
Remember to update _globalvars/traits.dm if you're adding/removing/renaming traits.
*/

//mob traits
#define TRAIT_PACIFISM			"pacifism"
#define TRAIT_WATERBREATH       "waterbreathing"

//TRAIT HISPANIA
#define TRAIT_AGEUSIA					"ageusia"
#define TRAIT_MECH_PILOT				"mech_pilot"
#define TRAIT_POD_PILOT					"piloto de pods"
#define TRAIT_SHOOTER					"armas grandes"
#define TRAIT_DUAL_SHOOTER				"disparar con dos armas"
#define TRAIT_GUNS_FOBIA				"fobia_a_las_armas"
#define TRAIT_NO_TOOLS					"no_herramientas"
#define TRAIT_RESITENCIA_ALCOHOLICA		"no_borracheras"
#define TRAIT_CIRUJANO					"cirujano"
#define TRAIT_ESTOMAGO_FUERTE			"resistencia_a_olores"
#define TRAIT_NO_CRAFT					"no_crafting"
#define TRAIT_AMANTE_DE_DONAS			"donas_love"
// FIN TRAIT HISPANIA

// common trait sources
#define ROUNDSTART_TRAIT "roundstart" //cannot be removed without admin intervention
