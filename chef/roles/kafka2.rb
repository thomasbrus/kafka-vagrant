name "kafka2"
run_list "recipe[kafka-vagrant::kafka]"
override_attributes "kafka" => { "broker" => { "broker.id" => 2, "port" => 9093 } }
