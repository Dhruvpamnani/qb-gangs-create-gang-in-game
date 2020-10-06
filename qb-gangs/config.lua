Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = Config or {}

-- Config --

Config.gang = "ballas"
Config.stashname = "ballastash" --Always Keep It Like vagostash,gsfstash,mafiastash

Config.Locations = {
    ["ogcarspawnballas"] = {
        label = "Car Spawn",
        coords = {x =89.04, y =-1967.09, z =20.75, h =324.12},
    },
    ["stashballas"] = {
        label = "Ballas Stash",
        coords = {x =113.3059, y =-1970.89, z =21.3276},
    },
    ["ogcarspawnTheFamily"] = {
        label = "Car Spawn",
        coords = {x =-108.24, y =-1597.97, z =31.65, h =322.23},
    },
    ["stashthefamily"] = {
        label = "Family Stash",
        coords = {x =-136.91, y =-1609.84, z =35.03, h =66.89},
    },
    ["ogcarspawnMarabunta"] = {
        label = "Car Spawn",
        coords = {x =1421.77, y =-1506.75, z =60.9, h =170.31},
    },
    ["stashMarabunta"] = {
        label = "Marabunta Stash",
        coords = {x =1438.95, y =-1489.91, z =66.62, h =151.24},
    },
    ["ogcarspawnVagos"] = {
        label = "Car Spawn",
        coords = {x =335.98, y =-2040.44, z =21.14, h =53.29},
    },
    ["stashVagos"] = {
        label = "Vagos Stash",
        coords = {x =344.67, y =-2022.14, z =22.39, h =318.46},
    },
}

Config.Vehicles = {
    ["buffalo2"] = "Buffalo Sport",
    ["rumpo3"] = "RumpoXL",
    ["manchez"] = "Manchez",
    ["chino2"] = "Lowrider",

}