Config = {}

-- If you want notification or chat
-- true = notify  |  false = chat
Config.UseNotify = true

-- How long the notification will be shown (in seconds)
Config.NotifyTime = 5

-- Discord webhook link for the report logs
Config.Webhook = 'https://discord.com/api/webhooks/1233778143102242826/_ciZRUyR6ryR6YXlg8cdjgxOi1bD96BmWlRvnOhJUoaZJman-lQT5KaC6DiYlUJ1X3j8'

Config.Locales = {
    notify = {
        noMessage = 'Du använde kommandot fel. Användning: /report [message]',
        reportSend = 'Din report har skickats in, en staff kommer att hjälpa dig inom kort.',
        cooldown = 'Du måste vänta 10 sekunder innan du kan skicka in en ny report!'
    },

    chat = {
        noMessage = '~r~Du använde kommandot fel. Användning: /report [message]',
        reportSend = '~g~Din report har skickats in, en staff kommer att hjälpa dig inom kort.',
        cooldown = '~y~Du måste vänta 10 sekunder innan du kan skicka in en ny report!'
    }
}