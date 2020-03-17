// Crew has to recover ancient stuff from gateway
// Heads assamble a crew and send them to recover that stuff


/datum/station_goal/wartic
	name = "Ancient Unknown Artifact"
	weight = 0

/datum/station_goal/wartic/get_report()
	return {"<div style='text-align:center;'><img src='ntlogo.png'>
	<h3>[command_name()] Orders</h3></div><hr>
	<b>Special Orders for [station_name()]:</b><br><br>
	<b>Ancient Unknown Artifact</b><br>
	We lost contact with a research team trying to find and ancient artifact from an unknown race, asamble a team and bring the artifact back to the station.
	<br><br>
		Protocol:
	<ul style='margin-top: 10px; margin-bottom: 10px;'>
	 <li>Asamble a team with at least one scientist and one engieneer.</li>
	 <li>Give them equipement in order to recover the artifact.</li>
	 <li>Secure the artifact inside a containment cell and leave it on the station for future research.</li>
	</ul>
	Your Gateway has been calibrated to the last known location from this artifact.
	<br>
	-Nanotrasen Research Division"}

/datum/station_goal/wartic/check_completion()
	if(..())
		return TRUE
	for(var/obj/machinery/relwartic/B)
		if(B && !B.stat && is_station_contact(B.z))
			return TRUE
	return FALSE