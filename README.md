# ArchiSteamFarm
[![Build Status](https://travis-ci.org/T-Wong/asf.svg?branch=master)](https://travis-ci.org/T-Wong/asf) [![Cookbook Version](https://img.shields.io/cookbook/v/asf.svg)](https://supermarket.chef.io/cookbooks/asf)

Installs and configures [ArchiSteamFarm](https://github.com/JustArchi/ArchiSteamFarm) on a server system.

## Requirements
### Platforms
* CentOS 7+
* Debian 8+
* Fedora 24+
* openSUSE 13+
* RHEL 7+
* Ubuntu 12.04+

## attributes
### Source Information
* `node[asf']['source']` - Root URL to where to download ArchiSteamFarm. By default, this points to the official GitHub releases page at https://github.com/JustArchi/ArchiSteamFarm/releases.
* `node['asf']['version']` - Version of ArchiSteamFarm to initially download. By default, this is `2.2.0.5`. This value might change on the system if you have chosen to auto update in your ASF global configuration file.
* `node['asf']['checksum']` - The SHA256 checksum of the `ASF.exe` for the version that you want to install.

### Install and configuration Paths
* `node['asf']['install']['path']` - Path to where to install ArchiSteamFarm. By default, this cookbook will install ArchiSteamFarm to `/opt/asf`.
* `node['asf']['config']['path']` - Path to where to store the global and bot configuration files. By default, this cookbook will place these into `/opt/asf/config`.

### Global and bot configuration
* `node['asf']['global']` - Root level key for the global ArchiSteamFarm configuration values. Look at `attributes/default.rb` for information on what values are set by default and refer to [ArchiSteamFarm's official Wiki](https://github.com/JustArchi/ArchiSteamFarm/wiki/Configuration#global-config) on information on what each setting does.

* `node['asf']['bots']`-: Root level key for all of the bot accounts that will be configured. By default, no bot account will be setup. It is necessary to set these attributes either in an environment or a wrapper/role cookbook. For information on what each value does, refer to [ArchiSteamFarm's official Wiki](https://github.com/JustArchi/ArchiSteamFarm/wiki/Configuration#bot-config). Refer to the following example attribute on how to configure a bot account called `bot_name`. It is very important that you include all of the values in the example as not setting a value will result in a broken configuration file.

```ruby
node.default['asf']['bots'] = {
  'bot_name' => {
    'AcceptConfirmationsPeriod' => 0,
    'AcceptGifts' => false,
    'CardDropsRestricted' => true,
    'CustomGamePlayedWhileFarming' => 'null',
    'CustomGamePlayedWhileIdle' => 'null',
    'DismissInventoryNotifications' => true,
    'DistributeKeys' => false,
    'Enabled' => false,
    'FarmingOrder' => 0,
    'FarmOffline' => false,
    'ForwardKeysToOtherBots' => false,
    'GamesPlayedWhileIdle' => [],
    'HandleOfflineMessages' => false,
    'IsBotAccount' => false,
    'LootableTypes' => [1, 3, 5],
    'PasswordFormat' => 0,
    'Paused' => false,
    'RedeemingPreferences' => 0,
    'SendOnFarmingFinished' => false,
    'SendTradePeriod' => 0,
    'ShutdownOnFarmingFinished' => false,
    'SteamApiKey' => 'null',
    'SteamLogin' => 'null',
    'SteamMasterClanID' => 0,
    'SteamMasterID' => 0,
    'SteamParentalPIN' => 0,
    'SteamPassword' => 'null',
    'SteamTradeToken' => 'null',
    'TradingPreferences' => 1,
  },
}
```

## Recipes
### default
The default recipe will install Mono on a target machine, install ArchiSteamFarm, place configuration files, setup a service, and then start ArchiSteamFarm.

### mono
This recipe installs Mono on a target machine. This has only been tested on the platforms outlined above in Platforms.

### service
Installs ArchiSteamFarm, loads all of configuration specified in the `global` and `bots` attributes. A service is also created for this and automatically started.

## Usage
Place a dependency on the asf cookbook in your cookbook's `metadata.rb`

```ruby
depends 'asf', '~> 1.0.0'
```

then, in a recipe:

```ruby
include_recipe 'asf::default'
```

If you would like to modify the default global configuration file or add your bots, set/override the values in `node['asf']['global']` and `node['asf']['bots']` as advised under the attributes section.

## License & Authors
- Author:: Tyler Wong ([ty-w@live.com](mailto:ty-w@live.com))

```text
Copyright 2017, Tyler Wong

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
