local trainspawned = false
local PlayerCount = 0
local list = {}

RegisterServerEvent("hardcap:playerActivated")
RegisterServerEvent("playerDropped")

local function ActivateTrain()
	if (PlayerCount) == 1 and not trainspawned then
		TriggerClientEvent('StartTrain', GetHostId())
		trainspawned = true
		print("Spawning train.")
	else
		if (PlayerCount) == 0 then
			trainspawned = false
		end
	end
end
--snippet from hardcap to make PlayerCount work

-- yes i know i'm lazy
AddEventHandler('hardcap:playerActivated', function()
  if not list[source] then
    PlayerCount = PlayerCount + 1
	list[source] = true
	SetTimeout(15000,ActivateTrain)
  end
end)

AddEventHandler('playerDropped', function()
  if list[source] then
    PlayerCount = PlayerCount - 1
	list[source] = nil
	ActivateTrain()
  end
end)