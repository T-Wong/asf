#
# Cookbook:: asf
# Spec:: mono
#
# Copyright:: 2017, Tyler Wong, All Rights Reserved.

require 'spec_helper'

describe 'asf::mono' do
  context 'Default run on ubuntu 14.04' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds the necessary apt repos' do
      expect(chef_run).to add_apt_repository('mono-wheezy')
      expect(chef_run).to add_apt_repository('mono-apache24-compat')
    end

    it 'installs the packages for ubuntu 13.10+' do
      expect(chef_run).to install_package('mono-complete')
      expect(chef_run).to install_package('referenceassemblies-pcl')
      expect(chef_run).to install_package('ca-certificates-mono')
      expect(chef_run).to install_package('mono-xsp4')
    end
  end

  context 'Default run on debian 8.0' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'debian', version: '8.10')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds the necessary apt repos' do
      expect(chef_run).to add_apt_repository('mono-wheezy')
      expect(chef_run).to add_apt_repository('mono-libjpeg62-compat')
    end

    it 'installs the packages for debian 8.0+' do
      expect(chef_run).to install_package('mono-complete')
      expect(chef_run).to install_package('referenceassemblies-pcl')
      expect(chef_run).to install_package('ca-certificates-mono')
      expect(chef_run).to install_package('mono-xsp4')
    end
  end

  context 'Default run on rhel or fedora' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'fedora', version: '26')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds the yum repo' do
      expect(chef_run).to create_yum_repository('mono-project')
    end

    it 'installs the packages for rhel or fedora' do
      expect(chef_run).to install_yum_package('yum-utils')
      expect(chef_run).to install_package('mono-complete')
      expect(chef_run).to install_package('referenceassemblies-pcl')
    end
  end

  context 'Default run on suse' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'opensuse', version: '42.2')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'adds the zypper repo' do
      expect(chef_run).to add_zypper_repo('mono-project')
    end

    it 'installs the packages for suse' do
      expect(chef_run).to install_package('mono-complete')
    end
  end

  context 'Unsupported platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'freebsd', version: '10.4')
      runner.converge(described_recipe)
    end

    it 'converges unsuccessfully' do
      expect { chef_run }.to raise_error('Unsupported platform!')
    end
  end
end
