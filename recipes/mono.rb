#
# Cookbook:: asf
# Recipe:: mono
#
# Copyright:: 2017, Tyler Wong, All Rights Reserved.

case node['platform_family']
when 'debian'
  apt_repository 'mono-project' do
    uri 'http://download.mono-project.com/repo/debian'
    distribution 'wheezy'
    components ['main']
    key 'http://download.mono-project.com/repo/xamarin.gpg'
    action :add
  end

else
  raise 'Unsupported platform!'
end

%w(mono-complete referenceassemblies-pcl ca-certificates-mono mono-xsp4).each do |pkg|
  package pkg do
    action :install
  end
end
