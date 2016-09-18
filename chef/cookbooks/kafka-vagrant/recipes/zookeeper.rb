include_recipe 'zookeeper::default'
include_recipe 'zookeeper::service'

path = "/pep"
description = "Kafka PEP"

execute %(create #{path} "#{description}") do
  command %(/opt/zookeeper/bin/zkCli.sh create #{path} "#{description}")
  not_if %(/opt/zookeeper/bin/zkCli.sh ls #{path})
end

