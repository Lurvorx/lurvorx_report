Config = {}

-- Your framework you are gonna use.
-- Options: esx, qb
Config.Framework = "esx"

-- If you want notification or chat.
-- true = notify  |  false = chat
Config.UseNotify = true

-- For how long the notification time wil be shown for (in seconds).
Config.NotificationTime = 5

-- For how long the cooldown time will be (in seconds).
Config.CooldownTime = 10

-- All the groups that will recive the report message.
-- ONLY WORKS FOR ESX
Config.Groups = {
    "admin",
    "superadmin"
}

-- Your discord webhook for the report logs.
Config.Webhook = {
    useWebhook = false,
    webhook = ""
}

-- Config the language you want to use.
Config.Strings = {

    -- The language for the notifications.
    notification = {
        noMessage = 'You used the command incorrectly. Usage: /report [message]',
        reportSend = 'Your report has been submitted, a staff member will assist you shortly.',
        cooldown = 'You must wait 10 seconds before you can submit a new report!'
    },

    -- The language for the chat.
    chat = {
        noMessage = '~r~You used the command incorrectly. Usage: /report [message]',
        reportSend = '~g~Your report has been submitted, a staff member will assist you shortly.',
        cooldown = '~y~You must wait 10 seconds before you can submit a new report!'
    }

}
