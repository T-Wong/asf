# Source information
default['asf']['source'] = 'https://github.com/JustArchi/ArchiSteamFarm/releases/download'
default['asf']['version'] = '2.1.7.9'
default['asf']['checksum'] = 'd9d7bea8036d4ca0cbb3e9a6e49f934f72fdf1e9c647e038a2648a54656dd8fc'

# Default paths
default['asf']['install']['path'] = '/opt/asf'
default['asf']['config']['path'] = '/opt/asf/config'

# Global and bot configuration values
default['asf']['global'] = {
  'AutoRestart' => 'true',
  'AutoUpdates' => 'true',
  'Blacklist' => [267_420, 303_700, 335_590, 368_020, 425_280, 480_730, 566_020],
  'Debug' => 'false',
  'FarmingDelay' => 15,
  'ForceHttp' => 'false',
  'GiftsLimiterDelay' => 1,
  'Headless' => 'false',
  'HttpTimeout' => 60,
  'IdleFarmingPeriod' => 3,
  'InventoryLimiterDelay' => 3,
  'LoginLimiterDelay' => 10,
  'MaxFarmingTime' => 10,
  'MaxTradeHoldDuration' => 15,
  'Statistics' => 'true',
  'SteamOwnerID' => 0,
  'SteamProtocol' => 6,
  'UpdateChannel' => 1,
  'WCFHost' => '127.0.0.1',
  'WCFPort' => 1242
}

default['asf']['bots'] = {
  'bot_name' => {
    'AcceptConfirmationsPeriod' => 0,
    'AcceptGifts' => 'false',
    'CardDropsRestricted' => 'true',
    'CustomGamePlayedWhileFarming' => 'null',
    'CustomGamePlayedWhileIdle' => 'null',
    'DismissInventoryNotifications' => 'true',
    'DistributeKeys' => 'false',
    'Enabled' => 'false',
    'FarmingOrder' => 0,
    'FarmOffline' => false,
    'ForwardKeysToOtherBots' => 'false',
    'GamesPlayedWhileIdle' => [],
    'HandleOfflineMessages' => 'false',
    'IsBotAccount' => 'false',
    'LootableTypes' => [1, 3, 5],
    'PasswordFormat' => 0,
    'Paused' => 'false',
    'RedeemingPreferences' => 0,
    'SendOnFarmingFinished' => 'false',
    'SendTradePeriod' => 0,
    'ShutdownOnFarmingFinished' => 'false',
    'SteamApiKey' => 'null',
    'SteamLogin' => 'null',
    'SteamMasterClanID' => 0,
    'SteamMasterID' => 0,
    'SteamParentalPIN' => '0',
    'SteamPassword' => 'null',
    'SteamTradeToken' => 'null',
    'TradingPreferences' => 1
  }
}
