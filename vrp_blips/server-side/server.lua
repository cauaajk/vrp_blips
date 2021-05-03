--[[

   Como funciona:

    Adicionar esse evento desse jeito no server
      TriggerEvent("vrp_blips:add",{ name = "NOME DO BLIP", src = source, color = CORDOBLIP })
    E adicionar esse outro para remover
      TriggerEvent("vrp_blips:remove",source)

--]]

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARS
-----------------------------------------------------------------------------------------------------------------------------------------
local system = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_BLIPS:ADD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_blips:add")
AddEventHandler("vrp_blips:add", function(person)
	system[person.src] = person

	local playerPed = GetPlayerPed(person.src)
	if(DoesEntityExist(playerPed)) then
		local coord = GetEntityCoords(playerPed)
		system[person.src].position = { x = coord.x, y = coord.y, z = coord.z }
	end
	
	for k,v in pairs(system) do
		TriggerClientEvent("vrp_blips:updateAll",k,system)
	end

	TriggerClientEvent("vrp_blips:toggle",person.src,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_BLIPS:REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_blips:remove")
AddEventHandler("vrp_blips:remove",function(src)
	
	system[src] = nil
	
	TriggerClientEvent("vrp_blips:toggle",src,false)
	
	for k,v in pairs(system) do
		TriggerClientEvent("vrp_blips:remove",tonumber(k),src)
	end
	
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATECOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(system) do
			local playerPed = GetPlayerPed(k)
			if(DoesEntityExist(playerPed)) then
				local coord = GetEntityCoords(playerPed)
				system[k].position = { x = coord.x, y = coord.y, z = coord.z }
				TriggerClientEvent("vrp_blips:updateAll",k,system)
			end
		end
		Citizen.Wait(500)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERDROPPED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerDropped",function()
	if system[source] then
		system[source] = nil
	end
end)