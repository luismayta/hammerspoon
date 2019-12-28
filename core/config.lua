config = {
  DnsEmpty= "networksetup -setdnsservers Wi-Fi empty",
  DnsCloudflare= "networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4 1.1.1.1 1.0.0.1",
}

-- Displays
config.display = {
  display_laptop = 'Color LCD',
  display_external = 'ASUS PB238'
}

-- Browsers
config.browser = {
  brave = 'com.brave.Browser',
  canary = 'com.google.Chrome.canary',
  chrome = 'com.google.Chrome',
  firefox = 'org.mozilla.firefox',
  firefoxDev = 'org.mozilla.firefoxdeveloperedition',
  safari = 'com.apple.Safari',
}


-- -----
-- Utils
-- -----
function config.split(sep)
  local sep, fields = sep or ':', {}
  local pattern = string.format('([^%s]+)', sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end

config.DefaultBrowser = config.browser.brave
config.devBrowser = config.browser.brave
config.personalBrowser = config.browser.brave
config.hangoutsBrowser = config.browser.chrome

return config