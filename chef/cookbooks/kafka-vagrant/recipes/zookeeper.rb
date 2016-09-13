include_recipe 'zookeeper::default'
include_recipe 'zookeeper::service'

execute "create /pep pep" do
  command "/opt/zookeeper/bin/zkCli.sh create /pep pep"
end
