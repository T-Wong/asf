#
# Cookbook:: asf
# Spec:: service
#
# Copyright:: 2017, Tyler Wong, All Rights Reserved.

require 'spec_helper'

describe 'asf::service' do
  context 'When all attributes are default' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') do |node|
        node.normal['asf']['install']['path'] = '/opt/asf'
        node.normal['asf']['config']['path'] = '/opt/asf/config'
        node.normal['asf']['bots'] = {
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
            'TradingPreferences' => 1,
          },
        }
      end.converge(described_recipe)
    end

    let(:node) { chef_run.node }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates a new service user' do
      expect(chef_run).to create_poise_service_user('asf')
    end

    it 'creates the install and config directories' do
      expect(chef_run).to create_directory(node['asf']['install']['path'])
      expect(chef_run).to create_directory(node['asf']['config']['path'])
    end

    it 'downloads the asf executable' do
      expect(chef_run).to create_remote_file("#{node['asf']['install']['path']}/ASF.exe")
    end

    it 'creates the config template files' do
      expect(chef_run).to create_template("#{node['asf']['config']['path']}/ASF.json")

      node['asf']['bots'].keys.each do |bot_name|
        expect(chef_run).to create_template("#{node['asf']['config']['path']}/#{bot_name}.json")
      end
    end

    it 'creates a new service' do
      expect(chef_run).to enable_posie_service('asf')
    end
  end
end
