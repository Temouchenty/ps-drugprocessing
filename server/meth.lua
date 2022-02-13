local playersProcessingMeth = {}
local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-drugtrafficking:pickedUpHydrochloricAcid')
AddEventHandler('qb-drugtrafficking:pickedUpHydrochloricAcid', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.AddItem("hydrochloric_acid", 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hydrochloric_acid"], "add")
end)

RegisterServerEvent('qb-drugtrafficking:pickedUpSodiumHydroxide')
AddEventHandler('qb-drugtrafficking:pickedUpSodiumHydroxide', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.AddItem("sodium_hydroxide", 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sodium_hydroxide"], "add")
end)

RegisterServerEvent('qb-drugtrafficking:pickedUpSulfuricAcid')
AddEventHandler('qb-drugtrafficking:pickedUpSulfuricAcid', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.AddItem("sulfuric_acid", 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sulfuric_acid"], "add")
end)

RegisterServerEvent('qb-drugtrafficking:processChemicals')
AddEventHandler('qb-drugtrafficking:processChemicals', function()
	if not playersProcessingMeth[source] then
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)

		Player.Functions.AddItem("liquidmix", 1)
		Player.Functions.RemoveItem("sulfuric_acid", 1)
		Player.Functions.RemoveItem("hydrochloric_acid", 1)
		Player.Functions.RemoveItem("sodium_hydroxide", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["liquidmix"], "add")
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sulfuric_acid"], "remove")
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hydrochloric_acid"], "remove")
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sodium_hydroxide"], "remove")
	end
end)

RegisterServerEvent('qb-drugtrafficking:processTempUp')
AddEventHandler('qb-drugtrafficking:processTempUp', function()
	if not playersProcessingMeth[source] then
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)

		Player.Functions.AddItem("chemicalvapor", 1)
		Player.Functions.RemoveItem("liquidmix", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chemicalvapor"], "add")
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["liquidmix"], "remove")
	end
end)

RegisterServerEvent('qb-drugtrafficking:processTempDown')
AddEventHandler('qb-drugtrafficking:processTempDown', function()
	if not playersProcessingMeth[source] then
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)

		Player.Functions.AddItem("methtray", 1)
		Player.Functions.RemoveItem("chemicalvapor", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["methtray"], "add")
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chemicalvapor"], "remove")
	end
end)

RegisterServerEvent('qb-drugtrafficking:processMeth')
AddEventHandler('qb-drugtrafficking:processMeth', function()
	if not playersProcessingMeth[source] then
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		local quantity = math.random(5, 12)

		Player.Functions.AddItem("meth", quantity)
		Player.Functions.RemoveItem("methtray", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meth"], "add")
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["methtray"], "remove")
	end
end)

RegisterServerEvent('qb-drugtrafficking:processFailUp')
AddEventHandler('qb-drugtrafficking:processFailUp', function()
	if not playersProcessingMeth[source] then
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)

		Player.Functions.RemoveItem("liquidmix", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["liquidmix"], "remove")
	end
end)

RegisterServerEvent('qb-drugtrafficking:processFailDown')
AddEventHandler('qb-drugtrafficking:processFailDown', function()
	if not playersProcessingMeth[source] then
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)

		Player.Functions.RemoveItem("chemicalvapor", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chemicalvapor"], "add")
	end
end)

function CancelProcessing(playerID)
	if playersProcessingMeth[playerID] then
		playersProcessingMeth[playerID] = nil
	end
end

RegisterServerEvent('qb-drugtrafficking:cancelProcessing')
AddEventHandler('qb-drugtrafficking:cancelProcessing', function()
	CancelProcessing(source)
end)
