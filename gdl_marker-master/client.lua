----------------------------
---- Creditos: G0RD4LH4 ----
----------------------------

local Blips = {
    -- Exemplo:
	{name="G0RD4LH4 EXEMPLO", x = -617.99017333984, y = -1589.5893554688, z = 26.751127243042, id= 1, color= 39, scale = 0.5},
}
-- número dos blips: https://wiki.gtanet.work/index.php?title=Blips

Citizen.CreateThread(function()
    for _, item in pairs(Blips) do
	  item.blip = AddBlipForCoord(item.x, item.y, item.z)
	  SetBlipSprite(item.blip, item.id)
	  SetBlipScale(item.blip, item.scale)
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
	Wait(0)
		-- Exemplo:
		DrawMarker(36, -775.25061035156,5583.541015625,33.48571395874 -0.20, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.00, 2.00, 1.00, 255, 178, 102, 200, false, true, 2, true, false, false, false)
	end
end)
-- número dos blips: https://forum.fivem.net/t/resource-available-markers/99384