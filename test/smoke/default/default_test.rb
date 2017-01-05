# Inspec test for recipe asf::default

describe service('asf') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe file('/opt/asf/ASF.exe') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'asf' }
  its('group') { should eq 'asf' }
  its('mode') { should cmp '0755' }
  its('sha256sum') { should eq 'fc1da9028a874fb75e58e48a9d7c254580d659195f7e92dff29e157ccb7fb83e' }
end

describe file('/opt/asf/config/ASF.json') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'asf' }
  its('group') { should eq 'asf' }
  its('mode') { should cmp '0755' }
end

describe file('/opt/asf/config/bot_name.json') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'asf' }
  its('group') { should eq 'asf' }
  its('mode') { should cmp '0750' }
end
