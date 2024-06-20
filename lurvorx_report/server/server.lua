ESX = nil
ESX = exports['es_extended']:getSharedObject()

local cooldown = nil

SendToDiscord = function(playerName, discordMessage)
    local embeds = {
        {
            ['type'] = 'rich',
            ['title'] = 'NEW REPORT!',
            ['description'] = discordMessage,
            ['color'] = 10092339,
            ['footer'] = {
                ['text'] = 'Lurvorx Scripts | ' .. os.date(),
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/1185300625320329296/1185630929847337000/Lurvorx-Scripts-Logga.jpg?ex=6675b4d9&is=66746359&hm=154e4c80ac278286f9b24f7e1b832fe2afcddad8d4801c62e7656d4b1a79da55&'
            }
        }
    }

    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterCommand('report', function(source, args)
    local xPlayers = ESX.GetExtendedPlayers()
    local steamName = GetPlayerName(source)
    local message = table.concat(args, ' ')
    local reportMessage = '~y~(' .. steamName .. ' - ' .. source .. ')~w~ ' .. message

    if message == '' and Config.UseNotify == true then
        TriggerClientEvent('esx:showNotification', source, Config.Locales.notify.noMessage, 'error', Config.NotifyTime * 1000)
        return
    elseif message == '' and Config.UseNotify == false then
        TriggerClientEvent('chat:addMessage', source, { args = {Config.Locales.chat.noMessage}})
        return
    end

    if cooldown ~= nil and (GetGameTimer() - cooldown) < 10 * 1000 and Config.UseNotify == true then
		TriggerClientEvent('esx:showNotification', source, Config.Locales.notify.cooldown, 'error', Config.NotifyTime * 1000)
		return
    elseif cooldown ~= nil and (GetGameTimer() - cooldown) < 10 * 1000 and Config.UseNotify == false then
        TriggerClientEvent('chat:addMessage', source, { args = {Config.Locales.chat.cooldown}})
        return
	end

    if message ~= '' and Config.UseNotify == true then
        TriggerClientEvent('esx:showNotification', source, Config.Locales.notify.reportSend, 'success', Config.NotifyTime * 1000)
    elseif message ~= '' and Config.UseNotify == false then
        TriggerClientEvent('chat:addMessage', source, { args = {Config.Locales.chat.reportSend}})
    end

    for _, xPlayer in pairs(xPlayers) do
        local xPlayerGroup = xPlayer.getGroup()
        if xPlayerGroup == 'admin' then
            TriggerClientEvent('chat:addMessage', xPlayer.source, { args = {'~r~REPORT', reportMessage}})
        end
    end

    SendToDiscord(discordMessage, '`🧑` **PLAYER:** ' .. GetPlayerName(source) .. '\n`🎰` **PLAYER ID:** ' .. source .. '\n`📃` **REPORT MESSAGE:** ' .. message)

    cooldown = GetGameTimer()
end)