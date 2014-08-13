require 'spec_helper'

%w{ newrelic-sysmond newrelic-php5 }.each do |pkg|
  describe package("#{pkg}") do
    it { should be_installed }
  end
end

describe service('newrelic-sysmond') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/php.ini') do
  it { should be_file }
  it { should contain "newrelic.license=" }
end
 
#describe port(10050) do
#  it { should be_listening }
#end
