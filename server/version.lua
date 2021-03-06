Citizen.CreateThread(
    function()
        local vRaw = LoadResourceFile(GetCurrentResourceName(), "version.json")
        if vRaw then
            local v = json.decode(vRaw)
            PerformHttpRequest(
                "https://raw.githubusercontent.com/Mojito-Fivem/qb-gangs/main/version.json",
                function(code, res, headers)
                    if code == 200 then
                        local rv = json.decode(res)
                        if rv.version ~= v.version then
                            print(
                                ([[^1
-----------------------------------------------
	qb-gangs
	UPDATE: %s AVAILABLE
	CHANGELOG: %s
-----------------------------------------------
									^0]]):format(
                                    rv.version,
                                    rv.changelog
                                )
                            )
                        end
                    else
                        print("^1[qb-gangs]:^0 Unable to check version. The repository may have been moved, restructured or deleted. Please check github's status if there is a problem.")
                    end
                end,
                "GET"
            )
        end
    end
)
