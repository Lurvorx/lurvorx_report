if Config.Framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()
elseif Config.Framework == "qb" then
    QBCore = exports["qb-core"]:GetCoreObject()
end

local cooldown = nil

if Config.Webhook.useWebhook then
    SendToDiscord = function(playerName, discordMessage)
        local embeds = {
            {
                ['type'] = 'rich',
                ['title'] = '`🎫` REPORT LOGS',
                ['description'] = discordMessage,
                ['color'] = 3447003,
                ['footer'] = {
                    ['text'] = 'Lurvorx Scripts | ' .. os.date(),
                    ['icon_url'] = 'https://cdn.discordapp.com/attachments/1185300625320329296/1185630929847337000/Lurvorx-Scripts-Logga.jpg?ex=6675b4d9&is=66746359&hm=154e4c80ac278286f9b24f7e1b832fe2afcddad8d4801c62e7656d4b1a79da55&'
                }
            }
        }

        PerformHttpRequest(Config.Webhook.webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end
end

function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

RegisterCommand('report', function(source, args)
    local Players = GetPlayers()
    local playerName = GetPlayerName(source)
    local message = table.concat(args, ' ')
    local reportMessage = '~y~(' .. playerName .. ' - ' .. source .. ')~w~ ' .. message

    if Config.Framework == "esx" then
        if message == '' and Config.UseNotify == true then
            TriggerClientEvent('esx:showNotification', source, Config.Strings.notification.noMessage, 'error', Config.NotificationTime * 1000)
            return
        elseif message == '' and Config.UseNotify == false then
            TriggerClientEvent('chat:addMessage', source, { args = {Config.Strings.chat.noMessage}})
            return
        end
    elseif Config.Framework == "qb" then
        if message == '' and Config.UseNotify == true then
            TriggerClientEvent('QBCore:Notify', source, Config.Strings.notification.noMessage, "error", Config.NotificationTime * 1000)
            return
        elseif message == '' and Config.UseNotify == false then
            TriggerClientEvent('chat:addMessage', source, { args = {Config.Strings.chat.noMessage}})
            return
        end 
    end 

    if Config.Framework == "esx" then
        if cooldown ~= nil and (GetGameTimer() - cooldown) < Config.CooldownTime * 1000 and Config.UseNotify == true then
            TriggerClientEvent('esx:showNotification', source, Config.Strings.notification.cooldown, 'error', Config.NotificationTime * 1000)
            return
        elseif cooldown ~= nil and (GetGameTimer() - cooldown) < Config.CooldownTime * 1000 and Config.UseNotify == false then
            TriggerClientEvent('chat:addMessage', source, { args = {Config.Strings.chat.cooldown}})
            return
        end
    elseif Config.Framework == "qb" then
        if cooldown ~= nil and (GetGameTimer() - cooldown) < Config.CooldownTime * 1000 and Config.UseNotify == true then
            TriggerClientEvent('QBCore:Notify', source, Config.Strings.notification.cooldown, "error", Config.NotificationTime * 1000)
            return
        elseif cooldown ~= nil and (GetGameTimer() - cooldown) < Config.CooldownTime * 1000 and Config.UseNotify == false then
            TriggerClientEvent('chat:addMessage', source, { args = {Config.Strings.chat.cooldown}})
            return
        end
    end

    if Config.Framework == "esx" then
        if message ~= '' and Config.UseNotify == true then
            TriggerClientEvent('esx:showNotification', source, Config.Strings.notification.reportSend, 'success', Config.NotificationTime * 1000)
        elseif message ~= '' and Config.UseNotify == false then
            TriggerClientEvent('chat:addMessage', source, { args = {Config.Strings.chat.reportSend}})
        end
    elseif Config.Framework == "qb" then
        if message ~= '' and Config.UseNotify == true then
            TriggerClientEvent('QBCore:Notify', source, Config.Strings.notification.reportSend, "success", Config.NotificationTime * 1000)
        elseif message ~= '' and Config.UseNotify == false then
            TriggerClientEvent('chat:addMessage', source, { args = {Config.Strings.chat.reportSend}})
        end
    end

    if Config.Framework == "esx" then
        for _, xPlayer in pairs(xPlayers) do
            local xPlayerGroup = xPlayer.getGroup()
            if table.contains(Config.Groups, xPlayerGroup) then
                TriggerClientEvent('chat:addMessage', xPlayer.source, { args = {'~r~REPORT', reportMessage}})
            end
        end
    end

    if Config.Framework == "qb" then
        function getAdmins()
            local admins = {};
            local players = QBCore.Functions.GetPlayers()
    
            for _, v in pairs(players) do
                if QBCore.Functions.HasPermission(v, "mod") or QBCore.Functions.HasPermission(v, "admin") then
                    table.insert(admins, v)
                end
            end
    
            return admins
        end
    
        local admins = getAdmins();
    
        for _, v in pairs(admins) do
            TriggerClientEvent('chat:addMessage', v, { args = { '~r~REPORT', reportMessage } })
        end
    end

    for k,v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("license2:")) == "license2:" then
            license2 = v
        elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
            fivem = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        end
    end

    steamhex = steamid or "N/A"
    fivemlicense = license or "N/A"
    fivemlicense2 = license2 or "N/A"
    fivemid = fivem or "N/A"
    discordid = string.gsub(discord, "discord:", "") or "N/A"

    if Config.Webhook.useWebhook then
        SendToDiscord(
            discordMessage, "**" .. playerName .. "** have send a report." .. "\n\n`📃` **REPORT MESSAGE:** `" .. message .. "`\n\n`👤` **PLAYER:** `" .. playerName .. "`\n`🔢` **SERVER ID:** `" .. source .. "`\n`💬` **DISCORD:** " .. "<@" .. discordid .. "> [||" .. discordid .. "||]" .. "\n`🎮` **STEAM HEX:** ||" .. steamhex .. "||\n`🎮` **FIVEM:** ||" .. fivemid .. "||\n`💿` **LICENSE:** ||" .. fivemlicense .. "||\n`📀` **LICENSE 2:** ||" .. fivemlicense2 .. "||"
        )
    end

    cooldown = GetGameTimer()
end)

RegisterCommand('test', function(source, args)
    TriggerClientEvent("test:event", source, "Hello from server")
end)
