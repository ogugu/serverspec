require 'spec_helper'

# OS チェック
describe file('/etc/redhat-release') do
  it { should contain 'CentOS' }
end

# selinuxがdisableであること
describe selinux do
  it { should be_disabled }
end
   
# SELinux 無効の確認
describe selinux do
  it { should be_disabled }
end

# SSH サービスの稼働と自動起動の確認
describe service('sshd') do
  it { should be_enabled }
  it { should be_running }
end

# SSH の Listen ポート確認
describe port(22) do
  it { should be_listening }
end

# iptables が稼働していない、自動起動しないか確認
describe service('iptables') do
  it { should_not be_enabled }
  it { should_not be_running }
end

# 必要なパッケージが入っていること
%w{ sendmail ntp }.each do |pkg|
  describe package("#{pkg}") do
    it { should be_installed }
  end
end

# 不要サービス停止
%w{ ip6tables iptables messagebus kudzu }.each do |services|
  describe service("services") do
    it { should_not be_enabled }
    it { should_not be_running }
  end
end
