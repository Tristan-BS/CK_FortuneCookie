RegisterNetEvent('ox_inventory:usedItem', function(playerId, itemName, slot)
    if itemName ~= Config.ItemName then return end

    -- remove item
    exports.ox_inventory:RemoveItem(playerId, Config.ItemName, 1, nil, slot)

    TriggerClientEvent('CK_FortuneCookie:use', playerId)
end)
