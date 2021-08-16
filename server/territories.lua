function checkGroup(table, val)
    for k, v in pairs(table) do
        if val == v.label then
            return true
        end
    end
    return false
end

function removeGroup(tab, val)
    for k, v in pairs(tab) do
        if v.label == val then
            tab[k] = nil
        end
    end
end

function isContested(tab)
    local count = 0
    for k, v in pairs(tab) do
        count = count + 1
    end

    if count > 1 then
        return "contested"
    end
    return ""
end

RegisterNetEvent("qb-gangs:server:updateterritories")
AddEventHandler("qb-gangs:server:updateterritories", function(zone, inside)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Gang = Player.PlayerData.gang
    local Job = Player.PlayerData.job

    local Territory = Zones["Territories"][zone]

    if Territory ~= nil then
        -- If they're not in a gang or they're not a cop just ignore them
        if Gang.name ~= "none" then
            if inside then
                if not checkGroup(Territory.occupants, Gang.label) then
                    Territory.occupants[Gang.label] = {
                        label = Gang.label,
                        score = 0
                    }
                else
                    local score = Territory.occupants[Gang.label].score
                    if score < Zones["Config"].minScore and Territory.winner ~= Gang.label then
                        if isContested(Territory.occupants) == "" then
                            Territory.occupants[Gang.label].score = Territory.occupants[Gang.label].score + 1
                        end
                    else
                        Territory.winner = Gang.label
                        TriggerClientEvent("qb-gangs:client:updateblips", source, zone, Gang.label)
                    end
                end
            else
                removeGroup(Territory.occupants, Gang.label)
            end
        elseif Job.name == "police" then
            if inside then
                if not checkGroup(Territory.occupants, "Police") then
                    Territory.occupants["Police"] = {
                        label = "Police",
                        score = 0
                    }
                else
                    local score = Territory.occupants["Police"].score
                    if score < Zones["Config"].minScore and Territory.winner ~= "Police" then
                        if isContested(Territory.occupants) == "" then
                            Territory.occupants["Police"].score = Territory.occupants["Police"].score + 1
                        end
                    else
                        Territory.winner = "Police"
                        TriggerClientEvent("qb-gangs:client:updateblips", source, zone, "Police")
                    end
                end
            else
                removeGroup(Territory.occupants, "Police")
            end
        end
    end
end)

QBCore.Functions.CreateCallback("qb-gangs:server:getstatus", function(source, cb, zone)
    local Territory = Zones["Territories"][zone]

    local status = ""
    local gang = ""
    local score = 0

    if Territory ~= nil then
        status = isContested(Territory.occupants)

        local key, _ = next(Territory.occupants)

        gang = Territory.winner ~= nil and Territory.winner or ""
        score = Territory.occupants[key].score
    end

    cb(status, gang, score)
end)

if Zones["Config"].debug then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5000)

            print("Zone 1 Occupants: "..json.encode(Zones["Territories"][1].occupants))
        end
    end)
end