include_recipe 'java::default'
include_recipe 'kafka::default'

service 'kafka' do
  action :start
end

kafka_topic 'elections' do
  replication 3
  partitions 3
end

kafka_topic 'identity-access' do
  replication 3
  partitions 3
end

kafka_topic 'identities' do
  replication 3
  partitions 3
end

kafka_topic 'default' do
  replication 3
  partitions 3
end
