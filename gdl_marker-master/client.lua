-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
local Blips = {
    -- Exemplo:
	{name="EXEMPLO", x = -617.99, y = -1589.58, z = 26.75, id= 1, color= 39, scale = 0.5},
}
-- número dos blips: https://wiki.gtanet.work/index.php?title=Blips

Citizen.CreateThread(function()
    for _, item in pairs(Blips) do
	  item.blip = AddBlipForCoord(item.x,item.y,item.z)
	  SetBlipSprite(item.blip,item.id)
	  SetBlipScale(item.blip,item.scale)
	  SetBlipColour(item.blip,item.color)
	  SetBlipAsShortRange(item.blip, true)
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString(item.name)
	  EndTextCommandSetBlipName(item.blip)
    end
end)

-- Blips Visuais
Citizen.CreateThread(function()
	while true do
        local timeDistance = 500
        timeDistance = 4
		-- Exemplo:
		DrawMarker(36, --[[Coordenada]] -775.25,5583.54,33.48 -0.20, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.00, 2.00, 1.00, 255, 178, 102, 200, false, true, 2, true, false, false, false)

		Citizen.Wait(timeDistance)
	end
end)
-- número dos blips: https://forum.fivem.net/t/resource-available-markers/99384
