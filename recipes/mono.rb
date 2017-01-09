#
# Cookbook:: asf
# Recipe:: mono
#
# Copyright:: 2017, Tyler Wong, All Rights Reserved.

packages = []

case node['platform_family']
when 'debian'
  # Needed by all debian based installs
  apt_repository 'mono-wheezy' do
    uri 'http://download.mono-project.com/repo/debian'
    distribution 'wheezy'
    components ['main']
    key 'http://download.mono-project.com/repo/xamarin.gpg'
  end

  # For Ubuntu 13.10+ and Debian 8.0+
  apt_repository 'mono-apache24-compat' do
    uri 'http://download.mono-project.com/repo/debian'
    distribution 'wheezy-apache24-compat'
    components ['main']
    key 'http://download.mono-project.com/repo/xamarin.gpg'
    action :add
    only_if do
      (node['platform'] == 'ubuntu' && node['platform_version'].to_f >= 13.10) ||
        (node['platform'] == 'debian' && node['platform_version'].to_f >= 8.0)
    end
  end

  # For Debian 8.0+
  apt_repository 'mono-libjpeg62-compat' do
    uri 'http://download.mono-project.com/repo/debian'
    distribution 'wheezy-libjpeg62-compat'
    components ['main']
    key 'http://download.mono-project.com/repo/xamarin.gpg'
    action :add
    only_if { node['platform'] == 'debian' && node['platform_version'].to_f >= 8.0 }
  end

  # For Ubuntu 12.04
  apt_repository 'mono-wheezy-libtiff-compat' do
    uri 'http://download.mono-project.com/repo/debian'
    distribution 'wheezy-libtiff-compat'
    components ['main']
    key 'http://download.mono-project.com/repo/xamarin.gpg'
    action :add
    only_if { node['platform'] == 'ubuntu' && ['precise'].include?(node['lsb']['codename']) }
  end

  packages = %w(mono-complete referenceassemblies-pcl ca-certificates-mono mono-xsp4)

when 'rhel', 'fedora'
  yum_package 'yum-utils' do
    action :install
  end

  yum_repository 'mono-project' do
    description 'Mono yum repo'
    baseurl 'http://download.mono-project.com/repo/centos/'
    gpgkey 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF'
    action :create
  end

  packages = %w(mono-complete referenceassemblies-pcl)

when 'suse'
  zypper_repo 'mono-project' do
    uri 'http://download.mono-project.com/repo/centos/'
    key 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF'
    action :add
  end

  packages = %w(mono-complete)

else
  raise 'Unsupported platform!'
end

packages.each do |pkg|
  package pkg do
    action :install
  end
end
