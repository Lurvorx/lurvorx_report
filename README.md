# lurvorx_report
lurvorx_report is a simple and basic script made by Lurvorx Scripts. This FiveM script is highly configurable and simple to use.
If you need any support with the script, please join this discord server and open a support ticket and a staff will help you.

If you need support or have questions, join [Lurvorx Scripts](https://discord.gg/jJnE7yTYZW) discord server!

---------------------------------------------------------------------------------------------------------------------------
Framework compatible:
- ESX Legacy
- More frameworks coming soon!

Here is the [preview - COMING SOON!]()

**Config File**
```
Config = {}

-- If you want notification or chat
-- true = notify  |  false = chat
Config.UseNotify = true

-- How long the notification will be shown (in seconds)
Config.NotifyTime = 5

-- How long the cooldown time will be (in seconds)
Config.CooldownTime = 10

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
```
