# Source information
default['asf']['source'] = 'https://github.com/JustArchi/ArchiSteamFarm/releases/download'
default['asf']['version'] = '2.2.0.5'
default['asf']['checksum'] = 'fc1da9028a874fb75e58e48a9d7c254580d659195f7e92dff29e157ccb7fb83e'

# Default paths
default['asf']['install']['path'] = '/opt/asf'
default['asf']['config']['path'] = '/opt/asf/config'

# Global and bot configuration values
default['asf']['global'] = {
  'AutoRestart' => true,
  'AutoUpdates' => true,
  'Blacklist' => [267_420, 303_700, 335_590, 368_020, 425_280, 480_730, 566_020],
  'Debug' => false,
  'FarmingDelay' => 15,
  'ForceHttp' => false,
  'GiftsLimiterDelay' => 1,
  'Headless' => true,
  'HttpTimeout' => 60,
  'IdleFarmingPeriod' => 3,
  'InventoryLimiterDelay' => 3,
  'LoginLimiterDelay' => 10,
  'MaxFarmingTime' => 10,
  'MaxTradeHoldDuration' => 15,
  'Statistics' => true,
  'SteamOwnerID' => 0,
  'SteamProtocol' => 6,
  'UpdateChannel' => 1,
  'WCFHost' => '127.0.0.1',
  'WCFPort' => 1242,
}

default['asf']['bots'] = {}
