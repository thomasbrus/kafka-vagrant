include_recipe 'java::default'
include_recipe 'kafka::default'

service 'kafka' do
  action :start
end
