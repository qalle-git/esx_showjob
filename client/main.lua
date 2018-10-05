PlayerData                = {}

ESX                             = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

  	PlayerData = ESX.GetPlayerData()
end)

RegisterCommand("job", function(source, args, raw)
    Show()
end, false)

function Show()
    ESX.ShowNotification('You are working as an: ~g~' .. PlayerData.job.label .. " ~s~-~g~ " .. PlayerData.job.grade_label)
end