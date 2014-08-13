require 'spec_helper'

describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe file('/etc/httpd/conf/httpd.conf') do
  it { should be_file }
  it { should contain "ServerName app1.srv" }
end

# welcome.conf が存在していないか確認                  
describe file('/etc/httpd/conf.d/welcome.conf') do
  it { should_not be_file }
end

describe file('/var/www/error/noindex.html') do
  it { should_not be_file }
end

%w{ httpd php php-pecl-ssh2 php-mysql php-common php-devel php-pear php-pdo php-mbstring php-pecl-apc php-mcrypt php-cli php-gd mysql-libs }.each do |pkg|
  describe package("#{pkg}") do
   it { should be_installed }
  end
end
