name "kafka1"
run_list "recipe[kafka-vagrant::kafka]"
override_attributes "kafka" => { "broker" => { "broker.id" => 1, "port" => 9092 } }
