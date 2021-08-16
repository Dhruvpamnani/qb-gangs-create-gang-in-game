local Territories = {}
local insidePoint = false
local activeZone = nil

Citizen.CreateThread(function()
    Citizen.Wait(500)
    for k, v in pairs(Zones["Territories"]) do
        local zone = CircleZone:Create(v.centre, v.radius, {
            name = "greenzone-"..k,
            debugPoly = Zones["Config"].debug,
        })

        local blip = AddBlipForRadius(v.centre.x, v.centre.y, v.centre.z, v.radius)
        SetBlipAlpha(blip, 80) -- Change opacity here
        SetBlipColour(blip, Zones["Colours"][v.winner] ~= nil and Zones["Colours"][v.winner] or Zones["Colours"].neutral)
    
        Territories[k] = {
            zone = zone,
            id = k,
            blip = blip
        }
    end
end)

RegisterNetEvent("qb-gangs:client:updateblips")
AddEventHandler("qb-gangs:client:updateblips", function(zone, winner)
    local colour = Zones["Colours"][winner]
    local blip = Territories[zone].blip

    SetBlipColour(blip, colour)
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(500)
        if PlayerGang.name ~= "none" or PlayerJob.name == "police" then
            local PlayerPed = PlayerPedId()
            local pedCoords = GetEntityCoords(PlayerPed)

            for k, zone in pairs(Territories) do
                if Territories[k].zone:isPointInside(pedCoords) then
                    insidePoint = true
                    activeZone = Territories[k].id
                    
                    TriggerEvent("QBCore:Notify", "You have entered a gang territory", "success")

                    -- Whilst inside the zone we send a server event for the server sided calculations
                    while insidePoint == true do
                        TriggerServerEvent("qb-gangs:server:updateterritories", activeZone, true)

                        -- We fetch a callback for the most reason status of the zone and send it to the NUI
                        QBCore.Functions.TriggerCallback("qb-gangs:server:getstatus", function(status, gang, score)
                            SendNUIMessage({
                                action = "showgang",
                                data = {
                                    status = status,
                                    winner = gang,
                                    score = score
                                },
                                gang = PlayerGang.label ~= "none" and PlayerGang.label or "Police",
                                max = Zones["Config"].minScore
                            })
                        end, activeZone)

                        if not Territories[k].zone:isPointInside(GetEntityCoords(PlayerPed)) then
                            TriggerServerEvent("qb-gangs:server:updateterritories", activeZone, false)

                            insidePoint = false
                            activeZone = nil

                            QBCore.Functions.Notify("You have left a gang territory", "error")

                            Citizen.Wait(1000)

                            SendNUIMessage({
                                action = "hide"
                            })
                        end

                        Citizen.Wait(1000)
                    end
                end
            end
        else
            Citizen.Wait(2000)
        end
    end
end)