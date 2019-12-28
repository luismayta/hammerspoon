local hotkey = require("core.hotkey")
local settings = require("core.config")

hs.loadSpoon("SpoonInstall")
Install=spoon.SpoonInstall

Install:andUse("URLDispatcher",
    {
        config = {
            url_patterns = {
                { "https?://endustria.atlassian.net/", settings.DefaultBrowser },
                { "https?://bitbucket.org/dashboard/overview",settings.DefaultBrowser },
                { "https?://github.com", settings.DefaultBrowser },
            },
            default_handler = settings.DefaultBrowser
        },
        start = true
    }
)