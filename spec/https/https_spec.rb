require 'spec_helper'

describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe port(443) do
  it { should be_listening }
end

describe file('/etc/httpd/conf.d/ssl.conf') do
  it { should be_file }
end
