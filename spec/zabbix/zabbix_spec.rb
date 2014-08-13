require 'spec_helper'

%w{ zabbix-agent zabbix zabbix-jp-release }.each do |pkg|
  describe package("#{pkg}") do
    it { should be_installed }
  end
end

describe service('zabbix-agent') do
  it { should be_enabled }
  it { should be_running }
end
 
describe port(10050) do
  it { should be_listening }
end
