include_recipe 'java::default'
include_recipe 'kafka::default'

service 'kafka' do
  action :start
end

execute 'kafka-topics.sh --create' do
  command <<-COMMAND % node['kafka']['broker']['zookeeper.connect']
    /opt/kafka/bin/kafka-topics.sh --create --topic elections --partitions 3 --replication 3 --zookeeper %s
  COMMAND

  # not_if <<-NOT_IF % node['kafka']['broker']['zookeeper.connect']
  #   /opt/kafka/bin/kafka-topics.sh --list --zookeeper %s | grep elections
  # NOT_IF
end

execute 'kafka-topics.sh --create' do
  command <<-COMMAND % node['kafka']['broker']['zookeeper.connect']
    /opt/kafka/bin/kafka-topics.sh --create --topic identity-access --partitions 3 --replication 3 --zookeeper %s
  COMMAND
end

execute 'kafka-topics.sh --create' do
  command <<-COMMAND % node['kafka']['broker']['zookeeper.connect']
    /opt/kafka/bin/kafka-topics.sh --create --topic identities --partitions 3 --replication 3 --zookeeper %s
  COMMAND
end

execute 'kafka-topics.sh --create' do
  command <<-COMMAND % node['kafka']['broker']['zookeeper.connect']
    /opt/kafka/bin/kafka-topics.sh --create --topic default --partitions 3 --replication 3 --zookeeper %s
  COMMAND
end
