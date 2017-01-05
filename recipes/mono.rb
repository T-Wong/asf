#
# Cookbook:: asf
# Recipe:: mono
#
# Copyright:: 2017, Tyler Wong, All Rights Reserved.

packages = Array.new

case node['platform_family']
when 'debian'   # debian, ubuntu, linuxmint
  apt_repository 'mono-project' do
    uri 'http://download.mono-project.com/repo/debian'
    distribution 'wheezy'
    components ['main']
    key 'http://download.mono-project.com/repo/xamarin.gpg'
    action :add
  end

  packages = %w(mono-complete referenceassemblies-pcl ca-certificates-mono mono-xsp4)

when 'rhel'     # oracle, centos, redhat
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

when 'suse'     # suse

when 'fedora'   # fedora

else
  raise 'Unsupported platform!'
end

packages.each do |pkg|
  package pkg do
    action :install
  end
end
