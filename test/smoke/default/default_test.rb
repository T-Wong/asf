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
  its('sha256sum') { should eq 'd9d7bea8036d4ca0cbb3e9a6e49f934f72fdf1e9c647e038a2648a54656dd8fc' }
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
