QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateCallback("qb-gangs:server:FetchConfig", function(source, cb)
    cb(json.decode(LoadResourceFile(GetCurrentResourceName(), "config.json")))
end)

QBCore.Commands.Add("creategang", "Create a whitelisted gang job with a stash and car spawn", {{name = "gang", help = "Name of the gang"}, {name = "label", help = "Gang Label"}}, true, function(source, args)
    name = args[1]
    table.remove(args, 1)
    label = table.concat(args, " ")
    
    TriggerClientEvent("qb-gangs:client:BeginGangCreation", source, name, label)
end, "admin")

RegisterServerEvent("qb-gangs:server:creategang", function(newGang, gangName, gangLabel)
    local permission = QBCore.Functions.GetPermission(source)

    if permission == "admin" or permission == "god" then
        local gangConfig = json.decode(LoadResourceFile(GetCurrentResourceName(), "config.json"))
        gangConfig[gangName] = newGang

        local gangs = json.decode(LoadResourceFile(GetCurrentResourceName(), "gangs.json"))
        gangs[gangName] = {
            label = gangLabel
        }

        SaveResourceFile(GetCurrentResourceName(), "config.json", json.encode(gangConfig), -1)
        TriggerClientEvent("qb-gangs:client:UpdateGangs", -1, gangConfig)

        SaveResourceFile(GetCurrentResourceName(), "gangs.json", json.encode(gangs), -1)
        TriggerClientEvent("QBCore:Client:UpdateGangs", -1, gangs)
        TriggerEvent("QBCore:Server:UpdateGangs", gangs)

        TriggerClientEvent("QBCore:Notify", source, "Gang: "..gangName.." successfully Created", "success")
    else
        QBCore.Functions.Kick(source, "Attempting to place create a gang")
    end
end)