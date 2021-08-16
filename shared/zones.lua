Zones = {
    ["Config"] = {
        debug = false,
        minScore = 60
    },

    ["Territories"] = {
        [1] = {
            centre = vector3(0.0, 0.0, 0.0),
            radius = 75.0,
            occupants = {},
            winner = nil,
            blip = nil
        },

        [2] = {
            centre = vector3(200.0, 200.0, 200.0),
            radius = 25.0,
            occupants = {},
            winner = nil,
            blip = nil
        }
    },

    ["Colours"] = {
        ["Police"] = 3,
        ["Ballas"] = 27,
        ["Vagos"] = 5,
        ["Marabunta"] = 29,
        ["Mafia"] = 44,
        ["The Lost MC"] = 40,
        ["neutral"] = 0
    }
}