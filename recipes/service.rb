#
# Cookbook:: asf
# Recipe:: service
#
# Copyright:: 2017, Tyler Wong, All Rights Reserved.

poise_service_user 'asf' do
  action :create
end

%W(#{node['asf']['install']['path']} #{node['asf']['config']['path']}).each do |dir|
  directory dir do
    owner 'asf'
    group 'asf'
    mode '0755'
    recursive true
    action :create
  end
end

remote_file "#{node['asf']['install']['path']}/ASF.exe" do
  source File.join(node['asf']['source'], node['asf']['version'], 'ASF.exe')
  checksum node['asf']['checksum']
  owner 'asf'
  group 'asf'
  mode '0755'
  action :create
end

template "#{node['asf']['config']['path']}/ASF.json" do
  source 'ASF.erb'
  owner 'asf'
  group 'asf'
  mode '0755'
  action :create
end

node['asf']['bots'].keys.each do |bot_name|
  template "#{node['asf']['config']['path']}/#{bot_name}.json" do
    source 'bot.erb'
    owner 'asf'
    group 'asf'
    mode '0750'
    variables(bot_name: bot_name)
    action :create
  end
end

poise_service 'asf' do
  command "/usr/bin/mono #{node['asf']['install']['path']}/ASF.exe --path=\"#{node['asf']['install']['path']}\" --server"
  user 'asf'
  directory node['asf']['install']['path']
  restart_on_update true
  action :enable
end
