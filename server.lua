
PlayerCount = 0
list = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx:playerLoaded")
RegisterServerEvent("playerDropped")

function ActivateTrain ()
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if (PlayerCount) == 1 then
			TriggerClientEvent('StartTrain', xPlayer.source, GetHostId())
		else
			SetTimeout(15000, ActivateTrain)
		end
	end
end
--snippet from hardcap to make PlayerCount work

-- yes i know i'm lazy
AddEventHandler('esx:playerLoaded', function()
  if not list[source] then
    PlayerCount = PlayerCount + 1
    list[source] = true
		if (PlayerCount) == 1 then -- new session?
			SetTimeout(15000, ActivateTrain)
		end
  end
end)

AddEventHandler('playerDropped', function()
  if list[source] then
    PlayerCount = PlayerCount - 1
    list[source] = nil
  end
end)
