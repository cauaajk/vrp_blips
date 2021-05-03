-----------------------------------------------------------------------------------------------------------------------------------------
-- VARS
-----------------------------------------------------------------------------------------------------------------------------------------
local ativando = false
local system = {}
local blips = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_blips:toggle")
AddEventHandler("vrp_blips:toggle",function(status)
	ativando = status
	if not ativando then
		RemoveAnyExistingEmergencyBlips()
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_blips:remove")
AddEventHandler("vrp_blips:remove",function(src)
	RemoveAnyExistingEmergencyBlipsById(src)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_blips:updateAll")
AddEventHandler("vrp_blips:updateAll",function(personnel)
	system = personnel
	if ativando then
		for src, info in pairs(system) do
			if info.sprite == nil then 
                info.sprite = 1 
            end
			if info.scale == nil then 
                info.scale = 0.4
            end
			
			local player = GetPlayerFromServerId(src)
			local ped = GetPlayerPed(player)
			if info.position then
				if blips[src] then
					SetBlipCoords(blips[src].blip, info.position.x, info.position.y, info.position.z)
				else
					blips[src] = {}
					blips[src].blip = AddBlipForCoord(info.position.x,info.position.y,info.position.z)
					SetBlipSprite(blip,1)
					SetBlipColour(blips[src].blip,info.color)
					SetBlipAsShortRange(blips[src].blip,false)
					SetBlipScale(blips[src].blip,0.4)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString(info.name)
					EndTextCommandSetBlipName(blips[src].blip)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_blips:update")
AddEventHandler("vrp_blips:update",function(person)
	system[person.src] = person
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEEMERGENCYBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
function RemoveAnyExistingEmergencyBlips()
	for src,info in pairs(system) do
		if blips[src] then
			if DoesBlipExist(blips[src].blip) then
				RemoveBlip(blips[src].blip)
			end

			system[src] = nil
			blips[src] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEBLIPEXISTING
-----------------------------------------------------------------------------------------------------------------------------------------
function RemoveAnyExistingEmergencyBlipsById(id)
	if blips[id] then
		if DoesBlipExist(blips[id].blip) then
			RemoveBlip(blips[id].blip)

			system[id] = nil
			blips[id] = nil
		end
	end
end