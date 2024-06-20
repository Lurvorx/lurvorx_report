Config = {}

-- If you want notification or chat
-- true = notify  |  false = chat
Config.UseNotify = true

-- How long the notification will be shown (in seconds)
Config.NotifyTime = 5

-- Discord webhook link for the report logs
Config.Webhook = ''

Config.Locales = {
    notify = {
        noMessage = 'You used the command incorrectly. Usage: /report [message]',
        reportSend = 'Your report has been submitted, a staff member will assist you shortly.',
        cooldown = 'You must wait 10 seconds before you can submit a new report!'
    },

    chat = {
        noMessage = '~r~You used the command incorrectly. Usage: /report [message]',
        reportSend = '~g~Your report has been submitted, a staff member will assist you shortly.',
        cooldown = '~y~You must wait 10 seconds before you can submit a new report!'
    }
}
