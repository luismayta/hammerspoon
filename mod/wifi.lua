-- luacheck: globals hs spoon
local fntools = require('core.fntools')
local settings = require('core.config')

hs.loadSpoon("SpoonInstall")
local Install=spoon.SpoonInstall

Install:andUse(
"WiFiTransitions",
{
  config = {
    actions = {
      -- { -- Test action just to see the SSID transitions
      --    fn = function(_, _, prev_ssid, new_ssid)
      --       hs.notify.show("SSID change", string.format("From '%s' to '%s'", prev_ssid, new_ssid), "")
      --    end
      -- },
      {
          to = "Evilcorp",
          fn = function(_, _, prev_ssid, new_ssid)
            hs.fnutils.partial(fntools.reconfigVolume, 80)
            hs.execute(settings.DnsEmpty)
            hs.execute(settings.DnsCloudflare)
          end
      },
      {
          from = "ulwifiT",
          fn = function(_, _, prev_ssid, new_ssid)
            hs.fnutils.partial(fntools.reconfigVolume, 25)
            hs.execute(settings.DnsEmpty)
            hs.execute(settings.DnsCloudflare)
          end
      },
      {
          from = "ulwifi",
          fn = function(_, _, prev_ssid, new_ssid)
            hs.fnutils.partial(fntools.reconfigVolume, 25)
            hs.execute(settings.DnsEmpty)
            hs.execute(settings.DnsCloudflare)
          end
      },
      {
          to = "ulwifiT",
          fn = function(_, _, prev_ssid, new_ssid)
            hs.execute(settings.DnsEmpty)
          end
      },
      {
          to = "ulwifi",
          fn = function(_, _, prev_ssid, new_ssid)
            hs.execute(settings.DnsEmpty)
          end
      },
      {
          to = "Wayra 5G",
         fn = function(_, _, prev_ssid, new_ssid)
            hs.fnutils.partial(fntools.reconfigVolume, 50)
            hs.execute(settings.DnsEmpty)
          end
      },
      {
          to = "VIPAC-INVITADOS",
          fn = function(_, _, prev_ssid, new_ssid)
            hs.fnutils.partial(fntools.reconfigVolume, 50)
            hs.execute(settings.DnsEmpty)
          end
      },
      {
          from = "VIPAC-INVITADOS",
          fn = function(_, _, prev_ssid, new_ssid)
            hs.fnutils.partial(fntools.reconfigVolume, 25)
            hs.execute(settings.DnsEmpty)
            hs.execute(settings.DnsCloudflare)
          end
      },
    }
  },
  start = true,
}
)
