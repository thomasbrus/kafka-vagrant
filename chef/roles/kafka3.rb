name "kafka3"
run_list "recipe[kafka-vagrant::kafka]"
override_attributes "kafka" => { "broker" => { "broker.id" => 3, "port" => 9094 } }
