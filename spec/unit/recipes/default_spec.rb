#
# Cookbook:: asf
# Spec:: default
#
# Copyright:: 2017, Tyler Wong, All Rights Reserved.

require 'spec_helper'

describe 'asf::mono' do
  context 'When all attributes are default' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    # it 'includes the mono and service recipes' do
    #   expect(chef_run).to include_recipe('asf::mono')
    #   expect(chef_run).to include_recipe('asf::service')
    # end
  end
end
