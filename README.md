# 🔪 **qb-gangs**
Gangs for QB-Core with Gang Support instead of Jobs, supports infinately scaling gangs. Super optimised down to 0.01ms idle with a gang peaking at 0.04ms when drawing or inside of a territory zone, 0.00ms at idle as a civilian.

# Features:

Each gang has a stash and a list of vehicles they can get out from their garage. Config is fully customisable for each gang. Gangs can be created in-game with the configurator and bosses and territories can be configured manually.

# Changelog

<details open>
	<summary> <b>New Version 2.5 Territories Update </b> </summary> <br>

This update brings gang territories to the map using PolyZones and server side calculations to provide synchronized gang turfs to fight over. At the moment the serve no over purpose, if you have suggestions open an issue or a PR.
</details>

<details>
<summary> <b>New Version 2.4 Gang Boss Update </b> </summary> <br>

- Gang bosses can now be configured in `shared/leaders.lua` and they can hire/fire new members
</details>

<details>
<summary> <b> New Version 2.3 In-Game Gang Configurator </b> </summary> <br>

- To begin creating a gang use `/creategang [name] [description]` to start the process, use `/placestash` to place the gang stash and `/placegarage` to place the gang garage using the In-Game configurator to chose the gang colours and vehicle list, when you have placed both you can use `/finishgang` to complete it or use `/cancelgang` at any time to abort the process.

![Preview](https://i.imgur.com/vVr0n0W.jpg)

</details>

# Repository Disclaimer
Tagged releases are considered 'stable' version of this resource, the master branch and others may contain experimental or unfinished code that you may run into problems with.
This repo is 1 year old, it was built for the original QBCore and I have no plans on making it compatible with the new versions since the maintainers have decided not to make it backwards compatible.

# Installation
Add Gangs into qb-core/shared.lua like this:
```lua
QBShared.Gangs = json.decode(LoadResourceFile("qb-gangs", "gangs.json"))

```
Add event to qb-core/server/events.lua
```lua
RegisterServerEvent("QBCore:Server:UpdateGangs")
AddEventHandler("QBCore:Server:UpdateGangs", function(gangs)
	QBShared.Gangs = gangs
	QBCore.Shared.Gangs = gangs
end)
```
Add event to qb-core/client/events.lua
```lua
RegisterNetEvent("QBCore:Server:UpdateGangs")
AddEventHandler("QBCore:Server:UpdateGangs", function(gangs)
	QBShared.Gangs = gangs
	QBCore.Shared.Gangs = gangs
end)
```

To enable lockable doors for gangs, you need to modify qb-doorlocks/client/main.lua line 217 like this:
```lua
function IsAuthorized(doorID)
	local PlayerData = QBCore.Functions.GetPlayerData()

	for _,job in pairs(doorID.authorizedJobs) do
		if job == PlayerData.job.name then
			return true
		end
	end

	for _,gang in pairs(doorID.authorizedJobs) do
		if gang == PlayerData.gang.name then
			return true
		end
	end
	
	return false
end
```
Add Citizenids for gang leaders for each gang into server/config.lua like this:
```lua
Config = {
	["GangLeaders"] = {
		["ballas"] = {
			"ORJ52463",
			"ABC12345"
		},
		["marabunta"] = {

		},
		["vagos"] = {

		},
		["families"] = {
			
		},
		["lost"] = {

		}
	}
}
```

# Interiors used:

- Ballas Interior - https://github.com/TRANEdAK1nG/Ballas-Interior
- TheFamily Interior - https://github.com/TRANEdAK1nG/Famillies-Interior
- Vagos Interior - https://github.com/TRANEdAK1nG/Vagos-Interior
- Marabunta Interior - https://github.com/TRANEdAK1nG/Marabunta-Interior

# License
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.
