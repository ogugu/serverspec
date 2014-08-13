require 'rake'
require 'rspec/core/rake_task'

hosts = [
  {
    :name  => 'app01.test.jp',
    :roles => %w( base app zabbix ),
  },
  {
    :name  => 'app_standby.test.jp',
    :roles => %w( base app zabbix ),
  },
  {
    :name  => 'db01.test.jp',
    :roles => %w( base db zabbix ),
  },
  {
    :name  => 'db02.test.jp',
    :roles => %w( base db zabbix ),
  },
]

hosts = hosts.map do |host|
  {
    :name       => host[:name],
    :short_name => host[:name].split('.')[0],
    :roles      => host[:roles],
  }
end

desc "Run serverspec to all hosts"
task :spec => 'serverspec:all'

class ServerspecTask < RSpec::Core::RakeTask

  attr_accessor :target

  def spec_command
    cmd = super
    "env TARGET_HOST=#{target} #{cmd}"
  end

end

namespace :serverspec do
  task :all => hosts.map {|h| 'serverspec:' + h[:short_name] }
  hosts.each do |host|
    desc "Run serverspec to #{host[:name]}"
    ServerspecTask.new(host[:short_name].to_sym) do |t|
      t.target = host[:name]
      t.pattern = 'spec/{' + host[:roles].join(',') + '}/*_spec.rb'
    end
  end
end

#RSpec::Core::RakeTask.new(:spec) do |t|
#  t.pattern = 'spec/*/*_spec.rb'
#end
