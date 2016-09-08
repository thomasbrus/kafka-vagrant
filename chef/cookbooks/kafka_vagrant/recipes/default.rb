include_recipe 'zookeeper::default'
include_recipe 'zookeeper::service'
include_recipe 'kafka::default'

service 'kafka' do
  action :start
end
