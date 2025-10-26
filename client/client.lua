local ESX = nil

-- load ESX
CreateThread(function()
    if GetResourceState("es_extended") == "started" then
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Wait(200)
        end
    end
end)

local function getRandomFortune()
    return Config.Fortunes[math.random(1, #Config.Fortunes)]
end

local function notify(msg)
    if Config.NotifyType == 'rip' and GetResourceState("RiP-Notify") == "started" then
        exports["RiP-Notify"]:sendNotify("info", 3500, "Glückskeks", msg)
    elseif Config.NotifyType == 'esx' and ESX and ESX.ShowNotification then
        ESX.ShowNotification(msg)
    else
        BeginTextCommandThefeedPost("STRING")
        AddTextComponentSubstringPlayerName(msg)
        EndTextCommandThefeedPostTicker(false, true)
    end
end

RegisterNetEvent("CK_FortuneCookie:use", function()
    local fortune = getRandomFortune()

    notify("Dein Glückskeks sagt: " .. fortune)
end)
