resource_name :kafka_topic

property :replication, Integer, default: 1
property :partitions, Integer, default: 1

default_action :create

def create_topic_command(topic, replication = 1, partitions = 1, zookeeper:)
  %(/opt/kafka/bin/kafka-topics.sh
    --create
    --topic #{topic}
    --replication #{replication}
    --partitions #{partitions}
    --zookeeper #{zookeeper}
  )
end

def not_if_command(zookeeper:)
  %(/opt/kafka/bin/kafka-topics.sh --list --zookeeper #{zookeeper} | grep elections)
end

action :create do
  topic = new_resource.name
  replication, partitions = new_resource.replication, new_resource.partitions
  zookeeper = node['kafka']['broker']['zookeeper.connect']

  execute 'kafka-topics.sh --create --topic %s' % topic do
    command create_topic_command(topic, replication, partitions, zookeeper: zookeeper)
    not_if not_if_command(zookeeper: zookeeper)
  end
end
