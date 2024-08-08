Config = {}

-- If you want notification or chat.
-- true = notify  |  false = chat
Config.UseNotify = true

-- For how long the notification time wil be shown for (in seconds).
Config.NotificationTime = 5

-- For how long the cooldown time will be (in seconds).
Config.CooldownTime = 10

-- All the groups that will recive the report message.
Config.Groups = {
    "admin",
    "superadmin"
}

-- Your discord webhook for the report logs.
Config.Webhook = 'https://discord.com/api/webhooks/1233569487039496235/OOqCOpIodCEcBBsqdXOqP7lwJPMiKBUtwx__VGHmZOBFXfE5VY_RNJNu8LS7vIF4Mtc-'

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
