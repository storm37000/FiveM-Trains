RegisterServerEvent('chat:init')

local trainspawned = false
local PlayerCount = 0
local list = {}

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
--snippet from chat to make PlayerCount work

-- yes i know i'm lazy
AddEventHandler('chat:init', function()
  if not list[source] then
    PlayerCount = PlayerCount + 1
	list[source] = true
	ActivateTrain()
  end
end)

AddEventHandler('playerDropped', function()
  if list[source] then
    PlayerCount = PlayerCount - 1
	list[source] = nil
	ActivateTrain()
  end
end)