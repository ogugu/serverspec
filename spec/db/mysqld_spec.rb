require 'spec_helper'

describe package('MySQL-server') do
  it { should be_installed }
end

describe service('mysql') do
  it { should be_enabled }
  it { should be_running }
end
 
describe port(3306) do
  it { should be_listening }
end
 
describe file('/etc/my.cnf') do
  it { should be_file }
  it { should contain "server-id = 1" }
end
